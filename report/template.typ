#let project(body) = {
  // Set the document's basic properties.
  set page(paper: "a4", margin:(top: 2.5cm, bottom: 2.5cm, left: 3cm, right: 3cm))
  set text(font: "Calibri", lang: "pt", region: "PT", size: 10pt)

  // Main body.
  set par(justify: true)
  
  // Remove dots from outlines
  set outline(fill: none)

  set heading(numbering: "1.")
  
  show heading: it => {
    if it.level == 1 {
      pagebreak()
      block(below: 5em)
    }
    it
  }

  show heading: set block(above: 2.5em, below: 1em)

  show link: set text(fill: blue.darken(30%))
  show link: underline.with(evade: false)

  show ref: underline.with(evade: false)
  show ref: set text(fill: blue.darken(30%))

  show figure.where(kind: "attachment"): it => {
    heading(outlined: false, numbering: none, level: 2)[#it.caption]
    it.body
  }

  show heading.where(level: 1): it => { text(size: 18pt, it) }
  show heading.where(level: 2): it => { text(size: 16pt, it) }
  show heading.where(level: 3): it => { text(size: 14pt, it) }
  show heading.where(level: 4): it => { text(size: 12pt, it) }

  set block(breakable: false)

  set raw(lang: "csharp")

  show raw.where(lang: "sql"): block.with(
    breakable: true, 
    fill: luma(240),
    inset: 10pt,
    radius: 4pt,
  )
  
  body
}

#let attachment(content) = figure([], caption: content, kind: "attachment", numbering: "1", supplement: [Anexo])