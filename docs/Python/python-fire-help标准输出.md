---
title: python-fire-help标准输出
date: 2021-06-15 16:02:32
permalink: /pages/a16cd4/
categories:
  - Python
tags:
  - 
---
# python-fire-help标准输出

[fire](https://github.com/google/python-fire)是一个比click更有使用体验的命令行工具包。

但是在help命令中，会进入man的交互模式里，不能直接打印到标准输出里。

看了下[Issue](https://github.com/google/python-fire/issues/188)，有几种解决方案，记录一下。

> 修改fire.core.Display

``` python
if __name__ == "__main__":
    # Make Python Fire not use a pager when it prints a help text
    fire.core.Display = lambda lines, out: print(*lines, file=out)
    fire.Fire(...)
```

> 更改PAGER环境变量(推荐)

* windows上设置 setx PAGER type
* linux上设置 export PAGER=cat

> 在程序中修改环境变量

```python
os.environ["PAGER"] = 'cat'
```
