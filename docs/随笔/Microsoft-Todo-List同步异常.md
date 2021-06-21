---
title: Microsoft-Todo-List同步异常
date: 2021-06-21 11:38:27
permalink: /pages/2b6780/
categories:
  - 随笔
tags:
  - 
---
# Microsoft-Todo-List同步异常

Microsoft Todo List 最近一直连接不上，
根据[这个帖子](http://kevinnan.org.cn/index.php/archives/607/)，
设置使To Do网络连接独立就好了，`非常有用`。

因为安装了Todo List的设备很多，一个一个设置比较麻烦。
于是写了一个python代码来执行。

需要的同学直接运行下列代码执行：

``` bash
python -c "from urllib.request import urlopen ;exec(urlopen('https://github.com/AngusWG/TestProject/raw/master/%E5%B7%A5%E5%85%B7/to_do_list_sync_error.py').read())"
```

* 不能访问github的记得开全局翻墙

![](../images/2021-06-21-12-06-46.png)

---

源码如下:

```python#!/usr/bin/python3
# encoding: utf-8
# @Time   : 2021-06-20 11:44:27
# @author : zza
# @Email  : z740713651@outlook.com
# @File   : to_do_list_sync_error.py
import os
import winreg

from typing import Optional


def get_todos_key() -> Optional[str]:
    reg_path = r"Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Mappings"
    access_key = winreg.OpenKey(winreg.HKEY_CURRENT_USER, reg_path)
    try:
        n = 0
        while True:
            sub_key_name = winreg.EnumKey(access_key, n)
            sub_key = winreg.OpenKey(access_key, sub_key_name)
            display_name = winreg.QueryValueEx(sub_key, "DisplayName")[0]
            # print(display_name)
            n += 1
            if "Todos" in display_name:
                print(display_name)
                print(sub_key_name)
                return sub_key_name
    except WindowsError:
        return None


def service() -> None:
    key = get_todos_key()
    if key is None:
        raise KeyError("Can't find Microsoft.Todos key in registry")
    command = f"CheckNetIsolation.exe loopbackexempt -a -p={key}"
    os.popen(command).read()
    result = os.popen("CheckNetIsolation.exe LoopbackExempt -s").read()
    assert key in result, "设置失败"
    print("设置成功")


if __name__ == "__main__":
    service()

```

![](../images/2021-06-21-12-08-57.png)
