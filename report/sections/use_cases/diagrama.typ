#import "/utils.typ": *

// Move is needed because svgs are not aligned
#figure(vp_image("/images/usecases/UseCases.svg"),
  caption: "Diagrama de casos de uso geral"
)

#figure(
  move(dx: -50pt, vp_image("/images/usecases/AdministradorGestaoProdutos.svg", width: 60%)),
  caption: "Subdiagrama de casos de uso de gestão de produtos"
)

#figure(
  move(dx: -40pt, vp_image("/images/usecases/AdministradorGestaoAdministradores.svg", width: 60%)),
  caption: "Subdiagrama de casos de uso de gestão de administradores"
)

#figure(
  move(dx: -50pt, vp_image("/images/usecases/AdministradorGestaoLeiloes.svg", width: 60%)),
  caption: "Subdiagrama de casos de uso de gestão de leilões"
)

#figure(
  move(dx: -35pt, vp_image("/images/usecases/LicitadorInteracaoFundos.svg", width: 60%)),
  caption: "Subdiagrama de casos de uso de gestão de fundos"
)

#figure(
  move(dx: -40pt, vp_image("/images/usecases/LicitadorInteracaoLeiloes.svg", width: 60%)),
  caption: "Subdiagrama de casos de uso de interação com leilões"
)
