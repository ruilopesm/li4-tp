#import "@preview/tablex:0.0.5": *

// Secções
#let section(name) = include("/sections/" + name + ".typ")

// Requisitos
#let requirement(nome, definicao, especificacao) = [
  #heading(nome, level: 4)
  #align(center, underline[*Definição dos requisitos de utilizador*])

  - #definicao

  #align(center, underline[*Especificação dos requisitos de sistema*])
  
  #if type(especificacao) == array {
    for e in especificacao [ - #e]    
  } else [- #especificacao]
]

// Use case tables
#let light_gray = rgb("#D9D9D9")

#let fancy_empty(str) = if str == [] or str == "" [---] else { str } 

#let gray_cell = cellx.with(fill: light_gray)

#let usecase_table(
  usecase: "",
  actor: "",
  desc: "",
  pre: "",
  pos: "",
  ..scenes,
) = figure(block(breakable: false, tablex(
  rows: (30pt, auto),
  columns: (25%, 1fr, 1fr),
  inset: 6pt,
  align: center + horizon,
  gray_cell(usecase, colspan: 3),
  gray_cell[Ator], colspanx(2, fancy_empty(actor)),
  gray_cell[Descrição], colspanx(2, fancy_empty(desc)),
  gray_cell[Pré-Condição], colspanx(2, fancy_empty(pre)),
  gray_cell[Pós-Condição], colspanx(2, fancy_empty(pos)),
  colspanx(3, fill: light_gray)[], 
  ..scenes.pos().map(scene => {
    let scene_name = scene.remove(0)
    (gray_cell(rowspan: scene.len(), scene_name), )
    scene.map(colspanx.with(2, align: left))
  }).flatten()
)), kind: "use-case", supplement: "Tabela Caso de uso", caption: usecase)

#let db_table(name: "", ..content) = figure(tablex(
  columns: (auto, auto, 3fr),
  inset: 8pt, 
  rows: (2em, 2em, auto, ),
  align: center + horizon,
  colspanx(3, fill: gray.lighten(30%), [*#name*]),
  cellx(fill: gray.lighten(40%))[*Campo*], cellx(fill: gray.lighten(40%))[*Tipo*], cellx(fill: gray.lighten(40%))[*Descrição*],
  ..for line in content.pos() {
    for (i, x) in line.enumerate() {
      if i == 0 {
        (cellx(fill: gray.lighten(60%), smallcaps(x)), )
      } else if i == 1 {
       (smallcaps(x), )
      } else { (x, ) }
    }
  },
), kind: "sql-table", supplement: "Tabela SQL", caption: name)

#let db_relation(name: "", description, multiplicity, foreign) = figure(tablex(
    columns: (auto, 3fr),
    inset: 8pt, 
    align: center + horizon,
    colspanx(2, fill: gray.lighten(30%), [*#name*]),
    cellx(fill: gray.lighten(50%))[*Descrição*], cellx(description),
    cellx(fill: gray.lighten(50%))[*Multiplicidade*], cellx(multiplicity),
    cellx(fill: gray.lighten(50%))[*Chave estrangeira*], cellx(smallcaps(foreign)),
), kind: "sql-relation", supplement: "Relacionamento SQL", caption: name)

#let rerender(selector) = locate(loc => query(selector, loc).first())

#let vp_image(path, width: 100%) = image.decode(read(path).replace(regex("Visual Paradigm Standard\(.*\)"), ""), width: width)


#let color_pallete(colors) = {
  grid(
    columns: 4,
    rows: (1em) * 3,
    ..colors.map(c => {
      if c != () {      
        let fill_color = c.at(2, default: white)
        let color_name = c.at(1)
        let current_color_hex = c.at(0)
        let current_color = rgb(current_color_hex)
        rect(stroke: none, 
          fill: current_color,
          width: 100%,
          height: 100%,
          align(center + horizon, text(fill: fill_color.darken(5%), [#raw(color_name)\ \##current_color_hex]))
        )
      } else {
         rect(stroke: none, 
          fill: white,
          width: 100%,
          height: 100%,
        )
      }
    })
  )
}

#let stroked = box.with(stroke: 1pt + gray, radius: 5pt, clip: true)

#let mockupFigure(name, caption: [], width: 100%) = figure(stroked(image("images/mockups/" + name, width: width)), caption: caption, kind: "mockup", supplement: [Esboço])