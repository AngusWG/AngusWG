---
title: win11的打开方式
date: 2021-10-28 22:36:31
permalink: /pages/036b87/
categories:
  - 随笔
tags:
  - 
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

[不停卡死的偏方1](https://www.bilibili.com/read/cv13461253?from=articleDetail)
[不停卡死的偏方2](https://www.bilibili.com/read/cv13051781?from=search&spm_id_from=333.337.0.0)
