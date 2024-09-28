#import "@preview/timeliney:0.0.1"

#set page(flipped: true, width: auto, margin: 0pt)

#let render_gantt(phases) = timeliney.timeline(
  show-grid: true,
  {
    import timeliney: *

    let dates = (
      "Setembro 2023",
      "Outubro 2023", 
      "Novembro 2023", 
      "Dezembro 2023", 
      "Janeiro 2024",
    )

    let d(day, month, year) = datetime(day: day, month: month, year: year)
    
    let start_date = d(1,9,2023)
    let end_date   = d(1,2,2024)

    let transform_to_range(date) = (date - start_date).days() / (end_date - start_date).days() * dates.len()

    headerline(group(..dates.map(date => strong(date))))

    let task_title(author, title) = align(center)[#title\ #v(-8pt) #text(fill: gray.darken(40%), size: 7.5pt, smallcaps(author))]
    let subtask(title, authors, ..dates) = task(
      style: (stroke: 2pt + gray), 
      task_title(authors, title), 
      ..dates.pos().map(date_tuple => (transform_to_range(date_tuple.at(0)), transform_to_range(date_tuple.at(1))))
    )

    if phases.contains(1) {
      taskgroup(title: [*Fase 1 - Definição do Sistema*], {
        subtask([Contextualização], "Daniel + Duarte + Francisco + Rui",              (d(18,9,2023), d(19,9,2023)))
        subtask([Fundamentação], "Daniel + Duarte + Francisco + Rui",                 (d(18,9,2023), d(19,9,2023)))
        subtask([Classificação do Sistema], "Daniel + Duarte + Francisco + Rui",      (d(19,9,2023), d(20,9,2023)))
        subtask([Objetivos], "Daniel + Duarte + Francisco + Rui",                     (d(20,9,2023), d(24,9,2023)))
        subtask([Viabilidade], "Daniel + Duarte + Francisco + Rui",                   (d(24,9,2023), d(25,9,2023)))
        subtask([Recursos a utilizar], "Daniel + Duarte + Francisco + Rui",           (d(25,9,2023), d(26,9,2023)))
        subtask([Equipa de trabalho], "Daniel + Duarte + Francisco + Rui",            (d(26,9,2023), d(27,9,2023)))
        subtask([Plano de execução de trabalho], "Daniel + Duarte + Francisco + Rui", (d(27,9,2023), d(28,9,2023)))
        subtask([Métricas de sucesso], "Daniel + Duarte + Francisco + Rui",           (d(28,9,2023), d(30,9,2023)))
        subtask([Validação da fase], "Daniel + Duarte + Francisco + Rui",             (d(30,9,2023), d(1,10,2023)))
      })
    }

    if phases.contains(2) {
      taskgroup(title: [*Fase 2 - Especificação do Sistema*], {
        subtask([Levantamento de Requisitos], "Daniel + Duarte + Rui",    (d(2,10,2023), d(10,10,2023)))
        subtask([Análise de Requisitos], "Daniel + Rui",                  (d(10,10,2023), d(13,10,2023)))
        subtask([Modelo de Domínio], "Duarte",                            (d(13,10,2023), d(20,10,2023)))
        subtask([Casos de uso], "Duarte + Rui + Daniel + Francisco",      (d(18,10,2023), d(28,10,2023)))
        subtask([Diagramas de Sequência], "Duarte",                       (d(25,10,2023), d(4,11,2023)))
        subtask([Conceção do Sistema de Dados], "Francisco",              (d(18,10,2023), d(1,11,2023)))
        subtask([Esboço das Interfaces do Sistema], "Francisco",          (d(29,10,2023), d(4,11,2023)), (d(7,11,2023), d(20,11,2023)))
        subtask([Validação da fase], "Daniel + Duarte + Francisco + Rui", (d(4,11,2023), d(6,11,2023)))
      })
    }

    if phases.contains(3) {
      taskgroup(title: [*Fase 3 - Implementação do Sistema*], {
        subtask([Implementação da Base de Dados], "Francisco + Rui",      (d(7,11,2023), d(20,11,2023)))
        subtask([Implementação da Aplicação], "Daniel + Francisco + Rui", (d(20,11,2023), d(17,1,2024)))
        subtask([Manual da Aplicação], "Daniel + Duarte",                 (d(17,1,2024), d(20,1,2024)))
        subtask([Validação final], "Daniel + Duarte + Francisco + Rui",   (d(20,1,2024), d(22,1,2024)))
      })
    }

    milestone(
      at: transform_to_range(d(6,11,2023)),
      style: (stroke: (dash: "dashed")),
      align(center, [
        *Checkpoint 1*\
        06/11
      ])
    )

    milestone(
      at: transform_to_range(d(22,1,2024)),
      style: (stroke: (dash: "dashed")),
      align(center, [
        *Entrega final*\
        22/01
      ])
    )
  }
)

#render_gantt((1,2,3))
