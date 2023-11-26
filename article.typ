#import "@preview/codly:0.1.0":*
#import "@preview/i-figured:0.2.1"

#let article(
  title: "",
  authors: (),
  date: datetime.today().display(),
  logo: none,
  body,
) = {
  set heading(numbering: "1.1")
  set page(number-align: center, paper: "a4")
  set text(font: "SimSun", lang: "zh")

  // this `level: 2` instructs the figure counters to be reset for every
  // level 2 section, so at every level 1 and level 2 heading.
  show heading: i-figured.reset-counters.with(level: 1)
  // this `level: 2` instructs the figure numbering to include the first
  // two levels of the current heading numbering.
  // how this should behave with zeros can be set using `zero-fill`.
  // e.g., setting `zero-fill: false` and `leading-zero: false` assures
  // there is never a `0` in the numbering.
  show figure: i-figured.show-figure.with(level: 1)

  let icon(codepoint) = {
    box(height: 0.8em, baseline: 0.05em, image(codepoint))
    h(0.1em)
  }

  let nameColor = rgb("#CE412B")

  show: codly-init.with()

  codly(languages: (
    py3: (name: "python", icon: none, color: nameColor),
    rs: (name: "rust", icon: none, color: nameColor),
  ))

  // #set figure(numbering: "1.1")
  set figure.caption(separator: "：")
  // #show figure.where(kind: raw): it => [#align(center)[#it.caption]#v(10pt, weak: true)#it.body]

  show figure.where(kind: "i-figured-raw"): it => [#align(center)[#it.caption]#v(10pt, weak: true)#it.body]

  // Title page.
  // The page can contain a logo if you pass one with `logo: "logo.png"`.
  if logo != none {
    v(0.4fr)
    align(right, image(logo, width: 26%))
    v(9.6fr)
  }

  set align(center)

  v(20fr, weak: true)
  text(2em, weight: 700, title)

  // Author information.
  v(1.5em, weak: true)
  if (authors.len() > 1) {
    text(1.2em, ..authors.map(author => [#strong(author) ]))
  } else {
    text(1.2em, strong(authors.first()))
  }

  v(70fr)
  text(1.1em, date)

  set align(left)
  pagebreak()

  // Table of contents.
  show outline: it => {
    show heading: set align(center)
    it
  }
  outline(title: [目#h(2em)录])
  i-figured.outline(title: [图形列表])
  i-figured.outline(target-kind: raw, title: [代码列表])
  pagebreak()

  // Main body.
  set par(first-line-indent: 2em, justify: true)
  show par: set block(spacing: 0.65em)
  // Workaround 3: Automatically add empty paragraph after heading
  show heading: it => {
    it
    par(text(size: 0.35em, h(0.0em)))
  } // Only works for paragraphs directly after heading

  body
}

