#import "article.typ":*

#show: article.with(
  title: "python数据处理编程",
  authors: (
    "卓能文",
  ),
)

= 简介
希克森写道，Flutter是“老谷歌人”最后推出的项目之一，属于Larry
Page在Alphabet创建前不久发起的一系列雄心勃勃的实验的一部分。Flutter团队基本上也像一家初创公司一样运作，而且在很大程度上是建立在年轻的谷歌文化基础上。例如优先考虑内部透明度、工作/生活平衡和数据驱动决策。所以整个团队从一开始就非常开放，这使得他们能够积极构建一个健康的开源项目。

与此同时，谷歌的高速发展让其公司文化受到了侵蚀。

希克森表示：“透明度消失了。以前我会迫不及待地参加每一次公司全体会议，以便了解情况。现在，我发现自己甚至能够预测高管们所给出的每一个答案。今天，我不知道在谷歌还有谁能解释它的愿景，员工士气也空前低落。如果你和湾区的治疗师交谈，他们会告诉你，他们所有的谷歌客户都对谷歌感到不满意。”

对于今年1月份的“大裁员”，希克森称这是公司非常短视的决策——目的只是为了确保股价保持季度增长，而不是遵循谷歌以前的战略，即优先考虑长期成功，即使这会导致短期损失。

而且自那以来，谷歌一直在进行规模更小、更低调的裁员，以至于员工们现在都在一份内部文件中追踪裁员情况。

希克森说，这些裁员对公司文化产生了“潜在”影响，可能导致员工“大幅减少冒险行为”。他写道：“我现在在谷歌看到了很多负面现象，比如员工对管理层缺乏信任，而管理层也不再信任员工，公司制定的政策也越来越显得空洞。”

此前曾有媒体报道称，谷歌的普通员工和管理层之间关系紧张。比如，谷歌要求高管为员工表现进行绩效打分。

希克森建议，应该努力将权力从首席财务官办公室转移到这样一个人手中——他应该对如何利用谷歌广泛的资源为用户创造价值有清晰长期的愿景。

至于谷歌的文化是否可以挽救，希克森认为可以，但他称“时间紧迫”。他写道：“谷歌文化的腐化最终将变得不可逆转，因为它需要充当道德指南针的那种人，而这类人在没有道德指南针的情况下不会愿意加入谷歌。”

== 概述
#figure(caption: [计算斐波纳契序列], ```py3
def fibonaci(n):
    if n <= 1:
        return n
    else:
        return(fibonaci(n-1) + fibonaci(n-2))
```)

#figure(caption: [苹果], image("images/apple.jpg", width: 90%))

#figure(caption: [hello.rs], ```rs
fn main() {
    println!("Hello, world!");
}
```)

#figure(caption: [日志过滤], ```v
// Print file lines that start with "DEBUG:"
import os

// `read_file` returns an optional (`?string`), it must be checked
text := os.read_file('app.log') or {
    // `err` is a special variable that contains the error
    // in `or {}` blocks
    eprintln('failed to read the file: ${err}')
    return
}

lines := text.split_into_lines()
for line in lines {
    if line.starts_with('DEBUG:') {
        println(line)
    }
}
```)

= 学习
Fortran 2023是Fortran编程语言的最新版本。它是一种高性能并行编程语言，专为科学和工程计算而设计。Fortran
2023具有许多强大的特性，使得它成为处理大规模数值数组的快速计算的理想工具。

+ 高性能：Fortran 2023针对科学和工程计算应用进行了优化，具有成熟且经过实战验证的编译器和库，可以编写接近底层的高效二进制代码。

+ 静态和强类型：Fortran是一种静态和强类型的语言，这使得编译器能够在早期捕捉到许多编程错误。这也使得编译器能够生成高效的二进制代码。

+ 易学易用：Fortran是一种相对简单的语言，学习和使用起来非常容易。通过将大多数数学和算术操作表达为方程式，可以轻松地处理大型数组。

+ 多功能：Fortran允许您以最适合问题的方式编写代码：命令式、过程式、面向数组、面向对象或函数式。

+ 本地并行：Fortran是一种本地并行编程语言，具有直观的类似数组的语法，用于在CPU之间传递数据。您可以在单个CPU上、共享内存多核系统上或分布式内存的HPC或基于云的系统上运行几乎相同的代码。Coarrays、teams、events和集体子程序允许您表达最适合当前问题的不同并行编程模式。

== 深入
#figure(caption: [计算斐波纳契序列], ```py3
def fibonaci(n):
    if n <= 1:
        return n
    else:
        return(fibonaci(n-1) + fibonaci(n-2))
```)

#figure(caption: [苹果], image("images/apple.jpg", width: 90%))

#figure(caption: [hello.rs], ```rs
fn main() {
    println!("Hello, world!");
}
```)