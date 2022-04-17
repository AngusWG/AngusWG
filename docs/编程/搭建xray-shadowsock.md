---
title: 搭建xray-shadowsock
date: 2021-06-11 18:11:21
permalink: /pages/738615/
categories: 
  - 编程
tags: 
  - null
publish: true
---
# 搭建xray-shadowsock

## 参考

* [安装](https://github.com/xinlc/scripts/blob/0f08db90c5cf39c033d5ff7b43a07d9adfa1646c/net/shadowsocks_install/docker/shadowsocks-libev/README.md)
* [证书](https://github.com/acmesh-official/acme.sh/wiki/%E8%AF%B4%E6%98%8E)

## ssl

通过acme.sh生成证书并自动更新

``` bash
curl  https://get.acme.sh | sh
apt install socat
/root/.acme.sh/acme.sh --register-account -m my@example.com
/root/.acme.sh/acme.sh --issue -d www.mydomain.com  --standalone
/root/.acme.sh/acme.sh  --upgrade  --auto-upgrade
```

## 配置配置文件

`mkdir /etc/shadowsocks-libev`

``` vim
# vim /etc/shadowsocks-libev/config.json
{
    "server":"0.0.0.0",
    "server_port":9000,
    "password":"password",
    "timeout":300,
    "method":"aes-256-gcm",
    "fast_open":true,
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"xray-plugin:tls;host=www.mydomain.com",
    "plugin_opts":"server"
}
```

## docker启动shadowsocks

``` bash
docker pull teddysun/shadowsocks-libev
docker run -d -p 9000:9000 -p 9000:9000/udp --name ss-libev --restart=always -v /etc/shadowsocks-libev:/etc/shadowsocks-libev -v /root/.acme.sh:/root/.acme.sh teddysun/shadowsocks-libev
```

## 客户端配置

* 去[xray-plugin](https://github.com/teddysun/xray-plugin/releases/tag/v1.4.2)下载对应软件
* 放到shadowsocks客户端文件夹里
* 写入配置

``` json
    {
      "server": "www.mydomain.com",
      "server_port": 9000,
      "password": "password",
      "method":"aes-256-gcm",
      "plugin": "xray-plugin",
      "plugin_opts": "tls;host=www.mydomain.com",
      "plugin_args": "",
      "remarks": "mydomain.com",
      "timeout": 5
    },
```

* 安卓用户点[这里](https://github.com/teddysun/xray-plugin-android/releases)下载

## 认证超时问题

查看日志`docker logs ss-libev -f --tail 20`

```text
2021/09/10 10:08:03 http: TLS handshake error from 192.168.1.1:999: remote error: tls: bad certificate
2021/09/10 10:08:04 http: TLS handshake error from 192.168.1.1:999: remote error: tls: bad certificate
2021/09/10 10:08:05 http: TLS handshake error from 192.168.1.1:999: remote error: tls: bad certificate
2021/09/10 10:08:06 http: TLS handshake error from 192.168.1.1:999: remote error: tls: bad certificate
```

证书过时了

输入命令更新证书:`/root/.acme.sh/acme.sh  --upgrade  --auto-upgrade`

然后报错了:

``` text
[Fri 10 Sep 2021 10:11:37 AM CST] Renew: 'www.mydomain.com'
[Fri 10 Sep 2021 10:11:37 AM CST] Using CA: https://acme-v02.api.letsencrypt.org/directory
[Fri 10 Sep 2021 10:11:37 AM CST] Standalone mode.
[Fri 10 Sep 2021 10:11:37 AM CST] LISTEN    0         511                0.0.0.0:80               0.0.0.0:*        users:(("nginx",pid=1481169,fd=8),("nginx",pid=898219,fd=8))                   
LISTEN    0         511                   [::]:80                  [::]:*        users:(("nginx",pid=1481169,fd=9),("nginx",pid=898219,fd=9))                   
[Fri 10 Sep 2021 10:11:37 AM CST] tcp port 80 is already used by (("nginx",pid=1481169,fd=8),("nginx",pid=898219,fd=8))                   
80                  [
[Fri 10 Sep 2021 10:11:37 AM CST] Please stop it first
[Fri 10 Sep 2021 10:11:37 AM CST] _on_before_issue.
```

需要先关闭nginx

写了个脚本:
vim `/root/script/acme_job.sh`

``` bash
nginx -s stop        
/root/.acme.sh/acme.sh  --upgrade  --auto-upgrade
nginx
```

更改执行时间：  
`sed -i  '$a15 0 * * * "/usr/bin/bash /root/script/acme_job.sh" > /var/log/acme_job.log' /tmp/a.txt`

ok--
