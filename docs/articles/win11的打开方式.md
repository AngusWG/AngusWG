---
title: win11的打开方式
date: 2022-05-06 06:18:55
permalink: /pages/036b87/
categories: 
  - 随笔
tags: 
  - null
article: true
---
# win11的打开方式

## 常规升级

1. 升级windows11 [Windows11InstallationAssistant.exe](https://www.microsoft.com/en-us/software-download/windows11)这个网站下载升级助手。双击升级。
2. [升级wsl](https://zhuanlan.zhihu.com/p/419870972)，update时建议全局。`wsl --update & wsl --shutdown` 目前还没研究出怎么玩GUI。
3. 装wsa  
    3.1 add-appxpackage MicrosoftCorporationII.WindowsSubsystemForAndroid_1.7.32815.0_neutral___8wekyb3d8bbwe.Msixbundle([tg群]( https://t.me/joinchat/NV4xIhmoUTl6UIeB9--IlA)有下载)  
    3.2 [Windows 11 运行安卓子系统安装教程](https://zhuanlan.zhihu.com/p/424959704)安装酷安

## 升级后的一些定制化操作

1. 个性化 > 任务栏 > 任务栏行为 - 任务栏对齐方式 左
2. 重装PowerToys，新版本建议在microsoft store下载。
3. 删掉TranslucentTB，从microsoft store下载。
4. 任务栏设置 > 任务栏项 - 关闭`聊天`， 关闭`搜索`。
5. 在语言里先增加拼音输入法,然后再删掉拼音输入法,就只有qq输入法了。可能会造成闪屏。
6. 左下角小组件设置一下。

## win11更新后资源管理器不断重启卡死的解决办法

关键词: wsl taskbar all icon flash windows 11 任务栏闪烁

~~`震惊！竟然是wsl的锅，解决方法:`wsl --shutdown`~~

根据[帖子](https://www.v2ex.com/t/810392)，bug已经在[wslg-issue](https://github.com/microsoft/wslg/issues/348)里提出，并已经修复。目前有个临时解决方案。

修改 `%USERPROFILE%\.wslconfig`

``` config
[wsl2]
guiApplications=false
```

然后重启wsl: `wsl --shutdown`

解决问题

### MicroSoft store 慢

在国内不要开代理，速度就上去了。
