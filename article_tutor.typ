#import "article.typ":*

#show: article.with(title: "Typst简明使用教程", authors: ("卓能文",))

// 加入公式编号
#set math.equation(numbering: "(1.1)")

// 正式版编译时不能访问图片
#show raw.where(block: true, lang: "typst-ex"): it => {
  let txt = it.text
  code(raw(txt, lang: "typ", block: true), lang: "typst")
  eval(txt, mode: "markup")
}

= Typst简介
Typst是撰写任何长篇文本（如论文、文章、科学论文、书籍、报告和家庭作业）的优秀工具。此外，Typst非常适合于编写任何包含数学符号的文档，例如在数学、物理和工程领域的论文。最后，由于其强大的风格化和自动化功能，它是任何一组具有共同风格的文件的绝佳选择，例如丛书。Typst文档风格和md文档类似，所以很容易上手，同时内置了强大的脚本功能及较多的排版原语，因此，能比较轻松完成优质文档的撰写及排版工作。

= Typst安装
Typst的本地安装非常简单，直接从`https://github.com/typst/typst/releases`下载适合自己操作系统的版本，解压到适当的地方即完成安装。另外，也可以在`https://typst.app`上注册账号，在线编辑typst文档，并下载生成的PDF文档。

编辑器建议采用`visual studio code`，并安装`Typst LSP`和`Typst Preview`插件。

= Typst使用

== 创建文件
新建文本文档，以`.typ`为后缀。建议克隆`https://github.com/soarowl/typst.git`到本地，并将其中的`article.typ`复制到文档所在的目录，并适当进行修改。然后在文档头部添加如下内容：
```typ
#import "article.typ":*

#show: article.with(title: "Typst简明使用教程", authors: ("卓能文",))
```

== 章节设置
格式有点类似markdown，比较简单：
```typ
= 第一章
内容

== 第一节
内容

== 第二节
内容

== 第三节
内容

= 第二章
== 第一节
内容

== 第二节
内容

= 第三章
```

== 显示图片
建议将图片保存在一个特定的目录，如`images、img`之类的地方。
```typst-ex
#image("images/rose.jpg")
```

=== 设置宽度：
```typst-ex
#image("images/rose.jpg", width: 50%)
```

=== 居中显示：
```typst-ex
#align(center,image("images/rose.jpg", width: 50%))
```

=== 设置标题：
```typst-ex
#figure(
  caption: [玫瑰],
  image("images/rose.jpg", width: 50%)
)
```

注：放入`#figure`命令中的图片同时会在图形列表中出现。

=== 多图并列
```typst-ex
#grid(
  columns: (1fr, 1fr),
  image("images/rose.jpg"),
  image("images/rose.jpg"),
)
```

=== 多图并列（带标题）
```typst-ex
#figure(
  caption: [多图并列（带标题）],
  grid(
    columns: (1fr, 1fr),
    image("images/rose.jpg"),
    image("images/rose.jpg"),
  )
)
```

=== 多图并列含间距（带标题）
```typst-ex
#figure(
  caption: [多图并列含间距（带标题）],
  grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    image("images/rose.jpg"),
    image("images/rose.jpg"),
  )
)
```

=== 多图并列（带子标题）
```typst-ex
#figure(
  caption: [多图并列（带子标题）],
  grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    figure(
      caption: [玫瑰1],
      image("images/rose.jpg")
    ),
    figure(
      caption: [玫瑰2],
      image("images/rose.jpg")
    ),
  )
)
```

=== 多图并列（带子标题、子图无编号）
```typst-ex
#figure(
  caption: [多图并列（带子标题、子图无编号）],
  grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    [#image("images/rose.jpg")玫瑰1],
    [#image("images/rose.jpg")玫瑰2],
  )
)
```

== 显示表格
````typst-ex
#figure(
  caption: [示例表格],
  kind: table,
  supplement: "表",
```tbl
    Rx   Nx
    Rx   Nx.
_
software|version
_
     AFL|2.39b
    Mutt|1.8.0
    Ruby|1.8.7.374
TeX Live|2015
_
```
)
````

注： 由于目前Typst中有bug，显示表格时，必须加上`kind`和`supplement`字段。

更多用法请参考`https://github.com/maxcrees/tbl.typ`

== 显示公式
```typst-ex
勾股定理可用公式：$a^2 + b^2 = c^2$表示。
```

```typst-ex
$ sum_(k=1)^n k = (n(n+1)) / 2 $
```

Typst默认只能显示一级公式，不能按章节重新计数，可采用第三方包`i-figured`实现，本模板已经内置。格式请参考`latex`相关文档。

== 显示代码
注：目前，`codly`显示代码有些问题， 如部分代码在换页时被遮挡，超长代码不自动换行处理等。暂时换为`sourcerer`包进行代码显示。

代码可以很容易添加，格式和markdown一样。 
````typst-ex
```py3
def fibonaci(n):
    if n <= 1:
        return n
    else:
        return fibonaci(n - 1) + fibonaci(n - 2)
```
````

=== 添加标题
````typst-ex
#figure(
  caption: [计算斐波纳契],
```py3
def fibonaci(n):
    if n <= 1:
        return n
    else:
        return fibonaci(n - 1) + fibonaci(n - 2)
```
)
````

=== 居左显示(codly包)
因为`figure`命令会导致代码居中显示，添加`align(start)`命令让代码居左：
````typst-ex
#figure(
 caption: [计算斐波纳契],
 align(start)[
```py3
def fibonaci(n):
    if n <= 1:
        return n
    else:
        return fibonaci(n - 1) + fibonaci(n - 2)
```
 ]
)
````

=== 显示代码文件
在Typst文档中添加太多代码，导致可读性降低，也不便于后续采用相应的工具进行编辑、更新、管理与维护，建议将代码组织在一个文件夹中。
````typst-ex
#figure(
  caption: [计算斐波纳契],
  raw(read("src/fibonaci.py"), lang: "py3", block: true)
)
````

=== 显示代码文件(sourcerer)
````typ
#figure(
  caption: [计算斐波纳契],
  code(raw(read("src/fibonaci.py"), lang: "py3", block: true), lang: "python")
)
````

=== 显示代码文件(codly)
````typst-ex
#figure(
  caption: [计算斐波纳契],
  align(start, raw(read("src/fibonaci.py"), lang: "py3", block: true))
)
````

== 标签与引用
在被引用的图表等地方用`<name>`设置标签，在打算引用的地方输入`@name`即可。name后面如果是中文，添加一个空格可避免编译错误。在`i-figured`中，需要在引用的地方添加`fig:、tbl:、lst:`等，形成`@fig:name`形式。如：@fig:rose 所示。

#figure(caption: [玫瑰], image("images/rose.jpg", width: 50%)) <rose>

== 参考文献设置
参考文献设置也比较简单，只需在文件尾部加入`#bibliography("example.yml", style: "gb-7114-2015-numeric")`即可。yml格式如下：
```yaml
audio-descriptions:
  affiliated:
    - names: Taylor, Dallas
      role: narrator
  author: Barrows, Miellyn Fitzwater
  date: 2017-02-07
  issue: 8
  parent:
    author: Taylor, Dallas
    title: Twenty Thousand Hertz
    type: Audio
  title: Audio Descriptions
  type: Audio
  url: https://www.20k.org/episodes/audio
barb:
  author: Günther-Haug, Barbara
  date: 2020
  language: de-DE
  location: München
  publisher: MVG
  title: Den Boden unter den Füßen verlieren
  type: Book
```

在文章适当的地方插入`@audio-descriptions`@audio-descriptions 或`@barb`@barb 这类的键。

= 写在最后
Typst相对来说还比较新，功能和latex相比稍弱，同时还存在一些bug。如果使用过程中有任何建议或模板上有什么问题，请到`https://github.com/soarowl/typst.git`提要求。

#counter(heading).update(0)
#set heading(numbering: "A.1")
= 附源码

== article模板
#raw(read("article.typ"), lang: "typ", block: true)

== 本文档源码
#raw(read("article_tutor.typ"), lang: "typ", block: true)

// master 版本编译错误。
// #bibliography("basic.yml", style: "gb-7114-2015-numeric")
#bibliography("basic.yml")
