---
title: 搭建xray-shadowsock
date: 2021-06-11 18:11:21
permalink: /pages/738615/
categories:
  - 编程
tags:
  - 
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
/root/.acme.sh/acme.sh --issue -d www.mydomain.com  --standalone
acme.sh  --upgrade  --auto-upgrade
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
