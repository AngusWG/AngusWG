---
title: outlook 垃圾邮件设置
date: 2022-04-25 14:49:45
tags:
  - 屁大点事
categories:
  - 随笔
article: true
---
# outlook 垃圾邮件设置

先说结论：使用 [outLook 网页版](https://outlook.live.com/) 就 ok 了。

最近因为调试 github action ， 疯狂发报错邮件，导致 outlook 判定 github 为垃圾邮件，全部发到 outlook 垃圾箱里了。

我用的是 outlook 客户端 (outlook client)。网上已经明确说，客户端设置的是个 [bug](https://answers.microsoft.com/en-us/outlook_com/forum/all/even-though-no-automatic-filtering-is-selected/41ab2a0c-949d-4f45-8624-429c31d17737)，垃圾邮件过滤规则不生效。对客户端已经摆烂了。

有效方案：完全不使用 outlook 客户端， 用 [网页版 outlook 邮箱](https://outlook.live.com/)。

在已关闭 outlook 垃圾邮箱 [筛选器](https://outlook.live.com/mail/0/options/mail/junkEmail/filtersOption) 的情况下，就不会默认放进垃圾邮件。

- 关闭客户端后，担心没有提示的，建议在设置打开 [邮件桌面提醒](https://outlook.live.com/mail/0/options/general/notifications)。
- 客户端与网页端的主要区别是邮件过滤规则中，`不能开启标记邮件并提示到 Microsoft To Do List`

---

结合之前还出了一个 [office 365 网页版本](https://www.office.com/) 的推行。
看来巨硬已经完全放弃客户端了。
