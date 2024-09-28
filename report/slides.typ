#import "@preview/polylux:0.3.1": *
#import themes.simple: *
#import "utils.typ": * 
#import "@preview/big-todo:0.2.0": *

#set page(paper: "presentation-16-9", fill: white)
#set text(font: "Calibri", lang: "pt", region: "PT")

#set text(fill: black.lighten(10%), font: "Calibri")

#show: simple-theme.with(
  footer: [Maçã - Grupo 1],
)

#show heading: it => {
  align(center, upper(text(size: 1.4em, it.body)))
  if it.level == 2 {
    block(below: 0.4em)
  }
}

#let center-horizon = align.with(center + horizon)

#let smaller-text(content) = {
  set text(size: 0.6em)
  content
}

#polylux-slide({
  set align(center + horizon)
  image("images/Logotipo.svg", width: 70%)

  {
    set text(size: .7em)
    side-by-side[
      *Daniel Pereira* \ a100545
    ][
      *Duarte Ribeiro* \ a100764
    ][
      *Francisco Ferreira* \ a100660
    ][
      *Rui Lopes* \ a100643
    ]
  }
}) <first-slide>


#centered-slide[= Definição do Sistema]
#slide[
== Contextualização

Venda de dispositivos tecnológicos.

$arrow.t$ Negócio com muito sucesso

$arrow.t$ Muitas vendas

$arrow.b$ Devoluções #emoji.hands.shake Cliente

$arrow.b$ Muito desperdício

#pdfpc.speaker-note(
```
A empresa Maçã encontra-se assente no mercado tecnológico há longos anos. A mesma cria e comercializa dispositivos tecnológicos como _smartphones_, computadores e acessórios para os mesmos. As suas operações são muito rentáveis e têm muito sucesso comercial. 

Ainda assim, por vezes, o cliente não se encontra satisfeito com a sua compra ou o produto tem algum defeito, o que leva à sua devolução. Neste sentido, a empresa Maçã é muito cuidadosa com os seus clientes, garantido sempre a máxima qualidade na interação empresa-cliente.

Além disso, a Maçã também tem um programa de retoma, onde é possível entregar o seu dispositivo antigo da marca em troca de um desconto na compra de um produto cujo modelo é mais recente e avançado tecnologicamente.

A empresa armazena todos estes aparelhos, contudo não podem ser revendidos da mesma forma e preço que os dispositivos novos.
```)
]


#slide[
  == Fundamentação

  $times$ Produtos deitados ao lixo
  
  #pause
  
  === Solução

  - excedentário $arrow$ *Leiloado*
  
  + A empresa Maçã leiloa um artigo a um preço inicial
  + Clientes licitam no artigo (licitador)
  + Leilão termina após um período determinado de tempo
  + Licitador com maior proposta vence e recebe o artigo
  
  #pdfpc.speaker-note(
    ```
    De modo a evitar que esse stock extra seja deitado fora, a Maçã quer desenvolver uma plataforma onde este excedentário é leiloado, diminuindo o lixo eletrónico e ainda obtendo retorno económico.

    Nesta plataforma, a empresa coloca os artigos que pretende leiloar e de após um determinado período de tempo o leilão termina e o licitador com a maior proposta vence e passa a ser proprietária do produto.
    ```
  )
]


#slide[
  == Objetivos

  - Melhorar atividade económica da empresa
  - Diminuir a pegada ecológica
  - Formentar a ligação empresa-cliente
  - Melhorar imagem pública da empresa
  
  #pdfpc.speaker-note(
  ```
  Com esta plataforma de leilões online, a Maçã pretende alcançar alguns objetivos, nomeadamente:

- Melhorar ainda mais a sua atividade económica, rentabilizando a venda de produtos que outrora seriam apenas excedentário
- Diminuir a sua pegada ecológica, reutilizando, para venda, produtos que outrora seriam apenas lixo eletrónico
- Democratizar o acesso à tecnologia, oferecendo, com custo mais baixo, tecnologia de alta qualidade a clientes com menos posses económicas
- Fomentar a ligação empresa-cliente, criando e oferecendo uma solução de leilões online cujo uso seja muito intuitivo
- Melhorar a imagem pública da marca, por ser vista como mais ecológica e amiga do ambiente
  ```
  )
]

#slide[
  == Viabilidade

  *Custos significativos:*
  - Logística de entrega
  - Desenvolvimento, manutenção e operação da plataforma
  - Possível reparação de dispositivos
  
  *Comercializar stock excedentário:*
  - Custo de execução muito baixo
  - Qualquer valor de venda é lucro

  Portanto, declaramos a Maçã como um serviço *VIÁVEL*
  #pdfpc.speaker-note(```
Esta plataforma apenas comercializará stock excedentário que não poderia ser vendido como novo, que já pertence à empresa e tem um custo de aquisição nulo ou negligível, logo quase todo o valor de venda será lucro.

Os únicos custos significativos seriam a logística da entrega, e o desenvolvimento, manutenção e operação da plataforma, sendo estes últimos maioritariamente fixos, pois é necessária a mesma plataforma para comercializar 10 ou 1000 produtos por dia, sendo que praticamente apenas os custos com hospedagem crescem linearmente.

Sendo a Maçã uma empresa com alto volume de negócios, também obtém um grande número de produtos devolvidos e de retoma. Como a aquisição de produtos (tradicionalmente a maior despesa neste ramo) é um subproduto inerente das operações principais da empresa, os únicos custos reais para além da reparação dos dispositivos com defeito são relacionados com a criação da plataforma, tendo esta operação um potencial de operar com margens de lucro elevadas. 

Dada a escala prevista do serviço e as margens em questão, achamos estes custos suportáveis e a operação rentável. Além do mais, ainda permite à Maçã comercializar-se como sustentável, conferindo uma maior reputação à empresa, mesmo em quem não utiliza este serviço da empresa. Deste modo, declaramos o serviço _*viável*_.
  ```)
]

#slide[
  == Recursos a utilizar

  #set text(size: 0.85em)
- Hardware:
  + Servidores para hospedar a plataforma;
  + Computadores para os programadores desenvolverem o programa;
  + Redes de comunicação;
  + Dispositivos de armazenamento dos dados.

- Software:
  + Software de Gestão;
  + Software de Segurança;
  + Software de Automação;
  + Software de Desenvolvimento.
]

#slide[
  == Equipa de trabalho

  #only(1)[*Interno:*
  - Coordenador do projeto, responsável por liderar o desenvolvimento
  - Analista, responsável por analisar os requisitos e criar especificações
  - Desenvolvedores
    + Web, para desenvolver o núcleo da plataforma
    + Integração, para integrar a base de dados num programa
  - Designers, para determinar o estilo e desenhar os vários esboços
  - Testadores, cuja função é testar o produto e certificar que não hajam bugs]

  #only(2)[*Externo:*
  - Organizações ambientais, para certificação da plataforma
  - Legisladores, para certificação do cumprimento das leis de proteção de dados
  - Administradores
    + Bases de dados, para certificação de segurança da base de dados
    + Sistemas, para assegurar a boa disponibilidade do sistema
  ]

  #pdfpc.speaker-note(
    ```
    Para o bom desenvolvimento do projeto, foi definida uma equipa de trabalho composta por vários elementos com funções em diferentes áreas, em que a colaboração de todos foi essencial. Além disso, foi efetuada uma divisão entre _pessoal_ interno e externo.
    ```
  )
]

#slide[
  === Plano de execução

  #import "attachments/gantt.typ": *
  #set text(size: 10pt)

  #only(1, render_gantt((1,)))

  #only(2, render_gantt((2,)))

  #only(3, render_gantt((3,)))

  #pdfpc.speaker-note(
```
Com o intuito de preparar e planear o desenvolvimento de todo o projeto, foi delineado um diagrama de Gantt, que pode ser consultado nos anexos do presente documento. A escolha deste tipo de diagrama, deve-se a vários fatores, entre eles: a clara visualização, em cronograma, das diversas tarefas, a facilidade de alocação de recursos humanos a cada tarefa e, finalmente, a possibilidade de planeamento a longo prazo.
Este está dividido em três fases: definição, especificação e implementação. A primeira consiste na definição do sistema, a segunda na especificação do sistema e a terceira na implementação do sistema.
```
  )
]

// talvez seja desnecessário falar sobre isto
// #slide[
//   == Métricas de sucesso

// Uma das métricas de sucesso que, na nossa visão, é um indicador significativamente mais informativo que o número de utilizador ativos mensalmente, embora este seja também um indicador valioso, é a venda total de dispositivos através dos leilões suscitados pela plataforma. Esta métrica acaba por influenciar, de forma positiva, a pegada ecológica que a Maçã tem no planeta, que pode, também, ser utilizada como uma métrica de sucesso.
// ]

#slide(center-horizon[
  #figure(image("/images/Maqueta do sistema.png"), caption: [Maqueta do sistema])
])

#slide[
  == Classificação do sistema

  #figure(table(
    columns: (0.5fr, 1fr),
    inset: 10pt,
    fill: (c, v) => if c == 0 { gray.lighten(50%) },
    stroke: (dash: "dashed"),
    [*Nome*], [Maçã],
    [*Categoria*], [Leilões online],
    [*Idiomas disponíveis*], [Português],
    [*Faixa Etária*], [18+]
  ), caption: [Classificação do sistema])

  #pdfpc.speaker-note(
    ```
    Podemos então classificar o sistema como um sistema de leilões online, que estará disponível apenas em Portugal, com o objetivo de leiloar produtos tecnológicos usados que pertencem à empresa Maçã. Por ser um sistema de leilões, teremos que limitar a idade mínima de utilização a 18 anos.
    ```
  )
]

#centered-slide[
  = Levantamento e Análise de Requisitos
]

#slide[
  == Estratégia de levantamento

  #set text(size: 0.8em)

  Necessitamos recolher informações para criar uma especificação correta do sistema. Deste modo aplicamos os seguintes métodos de recolha de dados:

  - *Reunião com a equipa da Maçã* - CEO, Diretor de Operações, Diretora de Marketing
  - *Análise do setor e do modelo de negócio* - Foram analisadas outras plataformas de leilões online de modo a compreender melhor o formato e as necessidades do mesmo
  - *Entrevistas com potenciais compradores (internos e externos)* - Identificar os requisitos que os utilizadores consideram importantes para uma experiência satisfatória
  Depois da devida análise das informações recolhidas, conseguimos levantar os requisitos necessários à elaboração do sistema.
]

#slide(center-horizon[
  == Requisitos funcionais
])

#let slide_requirement(title, definicao, especificacao) = {
  let deco-format(it) = text(size: .6em, fill: gray, it)
  set page(
    header: locate( loc => {
      let sections = query(heading.where(level: 1, outlined: true).before(loc), loc)
      if sections == () [] else { deco-format(sections.last().body + " - Requisitos Funcionais") }
    }),
    footer: deco-format({
      simple-footer.display(); h(1fr); logic.logical-slide.display()
    }),
    footer-descent: 1em,
    header-ascent: 1em,
  )
  
  polylux-slide[
    === #title
    
    #set text(size: 0.8em)
    
    #align(center, underline[*Definição dos requisitos de utilizador*])
    
    - #definicao
    
    #align(center, underline[*Especificação dos requisitos de sistema*])
    
    #if type(especificacao) == array {
      for e in especificacao [ - #e]    
    } else [- #especificacao]
  ]
}

#slide_requirement(
  [Licitação num leilão], 
  [Um utilizador deve conseguir efetuar uma licitação num leilão que esteja a decorrer.],
  (
    [Durante a visualização de um leilão, deve ser possível um utilizador licitar no mesmo.], 
    [O utilizador apenas poderá licitar se tiver fundos livres suficientes na sua conta superiores à da licitação mais alta. Caso a licitação mais alta seja da sua autoria, basta ter a diferença entre essa mesma licitação e a nova em fundos livres;],
    [Após a licitação, os fundos livres do utilizador são subtraídos e passam a ser fundos pendentes. A licitação anterior, a mais alta até agora, é _anulada_ e os fundos referentes à mesma são restaurados na conta do licitante anterior, passando a serem contabilizados como fundos livres.]
  )
)

#slide_requirement(
  [Especificação e criação de leilão],
  [Um administrador deve conseguir criar um leilão de um certo produto.],
  (
    [Aquando da criação do leilão, o sistema deve solicitar os dados necessários ao administrador: produto a leiloar, valor inicial de licitação e data (com hora) de fim.],
    [Um leilão é composto também por uma data (com hora) de início que, por defeito, é a data em que a criação do leilão ocorre.],
    [Finalmente, um leilão é composto por um estado, que pode tomar um dos seguintes valores: a decorrer, cancelado ou terminado. Por defeito, o estado de um leilão é a decorrer.]
  )
)

#slide_requirement(
  [Carregamento de fundos],
  [Um utilizador deve conseguir carregar fundos para a sua conta, com o objetivo de licitar em leilões.],
  [O sistema deve fazer uma distinção entre fundos livres e fundos pendentes. Por defeito, o carregamento de fundos afeta o valor dos fundos livres, aumentando-o.]
)

#slide[
  #set text(size: 0.8em)
== Requisitos não funcionais

- *A aplicação deverá ser de fácil uso*, principalmente para os utilizadores, promovendo uma navegação intuitiva e tendo um _layout_ o mais minimalista possível.
- *O tempo de resposta da aplicação deverá ser o menor possível*, para não prejudicar os possíveis licitadores, afetando de forma negativa a sua experiência.
- *A aplicação deve ser suportada pelos browsers mais usados atualmente*: Google Chrome, Firefox, Microsoft Edge e Safari.
- *A aplicação deve ser segura*, garantindo a confidencialidade e integridade dos dados dos utilizadores.
- *A aplicação deve ser escalável*, ou seja, deve ser possível aumentar a sua capacidade de processamento e armazenamento, de forma a suportar um maior número de utilizadores.
]

#slide(center-horizon[
  == Validação dos requisitos estabelecidos

  #pdfpc.speaker-note(
    ```
    Após o estabelecimento dos requisitos funcionais e não funcionais, estes foram validados com a Maçã, de forma a garantir que os mesmos correspondem às suas necessidades e expectativas. A validação foi feita através de uma reunião com a empresa, onde foram apresentados os requisitos estabelecidos, e o cliente confirmou que os mesmos correspondem às suas necessidades e expectativas. Assim sendo, o processo de desenvolvimento pôde prosseguir com normalidade.
    ```
  )
])

#centered-slide[
  = Especificação e Modelação do Software
]

#slide[
  == Modelo de Domínio
  
  #only(1, smaller-text(figure(vp_image("images/ModeloDominioProdutoLeilao.svg", width:64%), caption: [Modelo de domínio de Produto e de Leilão])))
    
  #only(2, center-horizon(smaller-text(figure(vp_image("images/ModeloDominioutilizador.svg", width:75%), caption: [Modelo de domínio de Utilizadores]))))
    
  #only(3, center-horizon(smaller-text(figure(vp_image("images/ModeloDominioLicitacao.svg", width:75%), caption: [Interação entre os componentes do modelo de domínio]))))
]

#slide(smaller-text(center-horizon[
  #figure(vp_image("images/ModeloDominioDiagram.svg"), caption: [Modelo de domínio geral])
]))

#slide[
  == Casos de Uso

  #smaller-text(figure(vp_image("images/usecases/UseCases.svg", width: 65%), caption: [Diagrama de Casos de uso]))
]

#slide[
  === Licitador
  #set text(size: 11pt)
  
  #usecase_table(
  usecase: "Registar-se na plataforma como licitador",
  actor: "Utilizador",
  desc: "Registo de um utilizador na plataforma",
  pre: "O Utilizador não estar autenticado",
  pos: "Utilizador ficar registado na plataforma como licitador",
  ("Fluxo normal", 
  [1. Sistema pede ao utilizador as suas informações (Nome, NIF, email, palavra-passe e data de nascimento)],
  [2. Utilizador fornece as informações requisitadas],
  [3. O sistema verifica se não existe uma conta com esses dados e se o utilizador é maior de idade],
  [4. O sistema cria uma conta com os dados oferecidos e informa o utilizador que a conta foi criada]
  ),
  ("Fluxo de Exceção (1) (Já existe uma conta com esse NIF ou email)",
  [3.1. O sistema informa que já existe um utilizador com o NIF ou email fornecidos]
  ),
  ("Fluxo de Exceção (2) (O utilizador é menor de idade)",
  [3.1. O sistema informa que o utilizador não possui a idade mínima de utilização])
  )
]

#slide[
  #set text(size: 11pt)
  
  #usecase_table(
    usecase: "Licitar num produto",
    actor: "Licitador",
    desc: "Adicionar uma proposta num produto a ser licitado",
    pre: "",
    pos: "Licitação ser efetuada",
    ("Fluxo normal",
    [1. Sistema solicitar o leilão sobre o qual o licitador deseja realizar a licitação],
    [2. O licitador informa qual o leilão],
    [3. O sistema solicita o valor que o licitador deseja licitar],
    [4. O licitador introduz a quantia de fundos que deseja licitar],
    [5. O sistema verifica a quantia da licitação atual comparativamente à quantia da licitação anterior],
    [6. Sistema verifica que o licitador tem uma quantia de fundos livres equivalente ou superior à da licitiação],
    [7. O sistema transforma essa quantia de fundos livres do licitador em fundos pendentes],
    [8. O sistema cria uma licitação com a quantia indicada]
    ),
    ("Fluxo Alternativo (1) (Licitação anterior foi feita pelo licitador atual)",
    [5.1. O sistema verifica que o licitador possui a diferença entre a licitação atual e a licitação anterior, em fundos livres],
    [5.2 Regressar a 6]
    ),
    ("Fluxo de Exceção (1) (Valor da licitação não supera licitação mais recente)",
    [5.1. O sistema avisa que o valor da licitação não supera a licitação mais recente]
    ),
    ("Fluxo de Exceção (2) (Fundos insuficientes na carteira do licitador)",
    [6.1. O sistema avisa que o licitador não tem fundos suficientes])
  )
]

#slide[
  === Administrador
  #set text(size: 10pt)
  
  #usecase_table(
  usecase: "Cancelar leilão",
  actor: "Administrador",
  desc: "Cancelar leilão de um produto",
  pre: "",
  pos: "Estado do leilão ser alterado para cancelado",
  ("Fluxo normal",
  [1. Sistema pede ao administrador para selecionar um leilão],
  [2. Administrador seleciona o leilão que pretende cancelar],
  [3. O sistema verifica se o leilão ainda se encontra a decorrer],
  [4. O sistema verifica que não existe nenhuma licitação no leilão],
  [5. O sistema altera o estado do leilão selecionado para "Cancelado"],
  ),
  ("Fluxo de Exceção (1) (Leilão tem estado cancelado)",
  [3.1. O sistema avisa que o leilão selecionado já se encontra cancelado],
  ),
  ("Fluxo de Exceção (2) (Leilão tem estado terminado)",
  [3.1 O sistema avisa que o leilão selecionado já se encontra terminado],
  ),
  ("Fluxo Alternativo (1) (Leilão possui uma licitação)",
  [4.1 O sistema reembolsa o dono da melhor licitação], 
  [4.2 Regressar a 5.]
  ),
)
]

#slide[
  === Administrador Master
  #set text(size: 11pt)
  
  #usecase_table(
  usecase: "Remover administrador",
  actor: "Administrador Master",
  desc: "Remover um Administrador",
  pre: "",
  pos: "Administrador ser removido",
  ("Fluxo normal", 
  [1. O sistema solicita ao administrador master que outro administrador pretende remover],
  [2. administrador master seleciona o administrador a remover],
  [3. O sistema verifica se a conta de administrador existe e não é a do próprio],
  [4. O sistema remove o administrador selecionado do sistema]
  ),
  ("Fluxo de Exceção (1) (Administrador não presente no sistema)",
  [3.1. O sistema avisa que o administrador selecionado não existe no sistema]
  ),
  ("Fluxo de Exceção (2) (Administrador a remover é o mesmo que fez o pedido de remoção)",
  [3.1. O sistema avisa que não é possível remover-se a si mesmo]
  ),
)
]


#slide(smaller-text[
  #figure(vp_image("/images/Product Activity Diagram.svg", width: 90%),
  caption: [Diagrama de atividade de um produto]
  )
  #pdfpc.speaker-note(
    ```
    Detalhamos aqui o processo que um produto atravessa de modo a ser vendido pela Maçã. Os produtos devolvidos, defeituosos ou vindos de retoma são submetidos a testes de fiabilidade para assegurar que ainda cumprem os rigorosos requisitos de qualidade da empresa. Se tal não for o caso, o produto irá ser arranjado. Caso contrário, os danos cosméticos no mesmo serão avaliados e atribuído um rating ao produto. A partir daí um administrador pode registar o produto na plataforma e criar um leilão. Quando este termina, o produto é enviado ao vencedor. Se ninguém licitar no produto, este pode voltar a ser leiloado.
    ```
  )
])


#slide(smaller-text[
  #figure(vp_image("/images/Leilao State Machine.svg", width: 80%),
    caption: [Diagrama de estados de um leilão]
  )
  #pdfpc.speaker-note(
    ```
    Este diagrama detalha a mecânica de leilões. Quando um leilão é criado, este passa a pendente. Quando a hora de início do mesmo chegar, este passa a estar ativo e utilizadores podem licitar no produto em questão. Se há uma licitação menos de 15 minutos antes do fim do leilão, este é estendido por outros 15 minutos. Quando o a data do fim do leilão chega, o produto é considerado vendido se houveram licitações. Caso contrário, o leilão é considerado cancelado, algo que também pode acontecer por ação de um administrador enquanto o leilão está ativo.
    ```
  )
])

#centered-slide[
  = Conceção do Sistema de Dados
]

#slide[
  #center-horizon(figure(vp_image("images/Modelo Lógico Vertical.svg", width: 110%), caption: [Modelo lógico do sistema de dados]))

  #pdfpc.speaker-note(
    ```
    Após definirmos os modelos que irão sustentar a implementação do sistema, foi necessário planear uma base de dados que apoie o seu funcionamento.
    Através de uma análise dos requisitos recolhidos e com auxílio dos modelos apresentados na especificação dos sistema, foi possível reproduzir o seguinte modelo lógico.
    ```
  )
]

#slide[
  #set text(size: 20pt)
  #db_table(name: [Tabela Leilão],
    ([ID], [INT], [Identificador único do leilão]),
    ([Product ID], [INT], [ID do produto a ser leiloado]),
    ([Start], [DATETIME], [Data do ínicio do leilão]),
    ([End], [DATETIME], [Data do fim previsto do leilão -- uma licitação adiará esta data caso seja feita perto desta]),
    ([Start Price], [MONEY], [Preço base do leilão -- o preço inicial para entrada no leilão]),
    ([Current Price], [MONEY], [Preço atual do leilão -- valor do lance mais recente do leilão]),
    ([Is Cancelled], [BOOLEAN], [Verdadeiro se o leilão foi cancelado]),
    ([Publisher ID], [INT], [Publicador do leilão -- utilizado para fins de segurança]),
    ([Winner NIF], [INT], [NIF do vencedor do leilão -- colocado no fim do leilão])
  )
]

#slide[
  #set text(size: 20pt)
  #center-horizon(db_relation(
    name: [Leilão -- Produto],
    [Um leilão tem um produto a ser leiloado],
    [Leilão (0,N) #footnote[Um mesmo produto pode ser releiloado por vários motivos (ex: não houve vencedores no leilão).] - Produto (1,1)],
    [Product Id]
  ))
]

#centered-slide[
  = Esboços das interfaces do sistema
]

#slide[
  #figure(image("images/Logotipo.svg", width: 90%), caption: "Logotipo da aplicação")

  #pdfpc.speaker-note(
    ```
    Inicialmente, foi desenhado um logotipo com o intuito de ser simples e apelativo. O mesmo é completamente original e possui o desenho de uma maçã e o nome da empresa.
    ```
  )
]

#slide[
  == Palete de cores
  #set text(size: 18pt)
  #color_pallete((
    ("1E1E1E", "Negro"),
    ("8A2828", "Vermelho (selected)"),
    ("4C7B27", "Verde (selected)"),
    ("365F9B", "Azul (selected)"),
    ("505050", "Cinza (selected)"),
    ("C73030", "Vermelho"),
    ("5D9A2E", "Verde"),
    ("4F95FF", "Azul"),
    ("7D7D7D", "Cinza"),
    ("C3B533", "Dourado"),
    (),
    (),
    ("BBBBBB", "Cinza Claro"),
    (),
    (),
    (),
    ("F3F3F3", "Cinza muito claro", black),
  ))

  #pdfpc.speaker-note(
    ```
    Foi, também, desenvolvida uma palete de cores que se adequasse ao minimalismo do sistema e que fosse agradável à vista.
    ```
  )
]

#slide(center-horizon[== Esboços do sistema])

#slide(smaller-text(mockupFigure("Leilões (sem estar autenticado).png", caption: [Interface menu de Leilões (sem estar autenticado)], width: 78%)))

#slide(smaller-text(mockupFigure("Leilões.png", caption: [Interface menu de Leilões], width: 78%)))

#slide(smaller-text(mockupFigure("Página de registo com erro.png", caption: [Página de registo com erro], width: 78%)))

#slide(smaller-text(mockupFigure("Ver detalhes.png", caption: [Ver detalhes de um leilão], width: 78%)))

#slide(smaller-text(mockupFigure("Ver produtos (hover na descrição).png", caption: [Ver produtos (hover na descrição) (administrador)], width: 78%)))

#slide(smaller-text(mockupFigure("Criar produto (com input).png", caption: [Criar produto (com input) (administrador)], width: 78%)))

#slide(smaller-text(mockupFigure("Editar produto.png", caption: [Editar produto (administrador)], width: 78%)))

#centered-slide[= Implementação da Aplicação]

#slide[
  #smaller-text(figure(vp_image("images/Diagrama de Instalação.svg", width: 74%), caption: [Diagrama de instalação do projeto]))
  #pdfpc.speaker-note(
      ```
      Os utilizadores utilizam o _browser_ no computador para se ligarem ao _website_. Para carregar os dados relevantes, cada página contacta um número de serviços, que por sua vez contactam a base de dados, de modo a disponibilizar a informação necessária para a visualização da página.
      ```
    )
]

#slide[
  #smaller-text(figure(vp_image("images/Diagrama de Componentes.svg", width: 80%), caption: [Diagrama de Componentes]))
  #pdfpc.speaker-note(
    ```
    As páginas e serviços acima referidos estão descritos e detalhados neste diagrama de componentes.
    ```
  )
]

#slide[
  == Tecnologias

  - Uso da framework *Blazor Server*
    - Padrão de desenvolvimento de injeção de dependências
  - Sistema baseado em Serviços
    - Módulos de código que as páginas podem aceder e utilizar
  #pdfpc.speaker-note(
    ```
    A aplicação foi implementada utilizando a _framework_ _Blazor Server_. Esta apresentou-se como uma opção bastante favorável ao desenvolvimento da aplicação.
    O _Blazor Server_ @blazor utiliza o padrão de desenvolvimento por injeção de dependências. Neste, em vez de se instanciarem as dependências de uma classe dentro dela, estas são injetadas, isto é, inseridas diretamente no construtor da classe a ser utilizadas.
    Como exemplo, uma classe que necessite de um módulo de acesso à base de dados e um serviço de envio de emails, ao invés de os instanciar dentro de si, recebe ambos os módulos no seu construtor, para os utilizar posteriormente.
    Em _Blazor Server_, a injeção de dependências está assente na lógica de serviços. Os serviços são módulos de código aos quais as páginas poderão aceder.
    O _Blazor Server_ irá, depois, injetar automaticamente os serviços requisitados pelas páginas nos seus construtores.
    ```
  )
]

#slide[
  == _Services_ e _Models_
  
  - Serviços necessários:
    - Leilões (_AuctionService_)
    - Licitações  (_BidService_)
    - Produtos (_ProductService_)
    - Utilizadores (_UserService_)
  - _Models_ são representações no programa das entidades da Base de Dados
  - Cada serviço utiliza determinados _Models_
  #pdfpc.speaker-note(
    ```
    Para o funcionamento normal da aplicação, determinamos estes serviços como necessários.
    A aplicação contém vários modelos que irão representar as tabelas presentes na base de dados.
    Os serviços utilizam Models para representar os dados na aplicação depois de lidos da base de dados
    ```
  )
]

#slide[
  == Autenticação e Autorização

  - Autenticação realizada através da classe AuthProvider
    - Deriva de AuthenticationStateProvider, conceito existente em _Blazor Server_
  - Utilização da classe _AuthorizeView_ para manter a autorização
    - Páginas apenas podem ser acedidas por utilizadores com permissões para tal
  - Uso das tecnologias fornecidas por _Blazor Server_, acelerando desenvolvimento

  #pdfpc.speaker-note(
    ```
    O módulo de autenticação concretiza-se na classe `AuthProvider`, que deriva de `AuthenticationStateProvider`, já existente no _Blazor Server_. Esta é responsável por guardar uma estrutura de dados `UserSession` que possui o email e o cargo do utilizador atualmente autenticado. Esta estrutura é atualizada aquando do login do utilizador na aplicação.

    Em relação à autorização, e como forma de prevenir que um utilizador mal intencionado aceda a páginas indevidas, foi utilizada a classe `AuthorizeView`, já presente no _Blazor Server_, capaz de receber um cargo e de autorizar apenas os utilizadores que possuem esse cargo a aceder à página em questão.
    
    Novamente, a escolha de _Blazor Server_ centrou-se também nestes mecanismos já existentes que são providenciados pela framework.
    ```
  )
]

#slide[
  == Segurança e Proteção de Dados

  - Uso de _hashing_ para garantir integridade e confidencialidade da password utilizada
    - Tecnologia _BCrypt_ usada para esse efeito
    - A base de dados não guarda palavras-passe em texto, mas sim sobre uma _hash_
  - Aumentar a segurança do sistema e das informações dos nossos clientes

  #pdfpc.speaker-note(
    ```
    Garantir a segurança e a proteção de dados dos utilizadores é um passo muito importante no desenvolvimento de uma aplicação. Nesse sentido, foi desenvolvido um sistema de _hashing_ de password, utilizando o algoritmo Bcrypt. Assim, na base de dados, é guardada uma _hash_ e não a password diretamente. Deste modo, é possível garantir a confidencialidade deste dado tão importante para os utilizadores e cumprir com as normas vigentes.
    ```
  )
]

#slide[
  == Leilões em tempo real

  - Atualiação em tempo real do preço é imperativo, de modo a garantir igualdade entre utilizadores
  - Uso da tecnologia _SignalR_, presente em _Blazor_
    - Foi criado um _Hub_ onde os clientes estão subscritos
    - Os clientes publicam atualizações para o Hub
    - Os outros clientes observam esse Hub por publicações e atualizam a página de acordo
  - Arquitetura semelhante a um sistema publicador-subscritor
  #pdfpc.speaker-note(
    ```
    Uma vez que o foco da aplicação é leilões online, é imperativo que existam atualizações em tempo real do preço atual de um dado leilão. De facto, só dessa forma é que a aplicação traria uma utilização justa a todos os utilizadores, tal como referido nos requisitos não funcionais.

    Ora, para tal recorreu-se a uma tecnologia muito interessante do ecossistema do _Blazor_ chamada `SignalR`. O objetivo passou por se criar um `Hub` onde todos os clientes estão subscritos e para onde todos os clientes publicam mensagens, quase como uma arquitetura publicador-subscritor. Assim, é possível observar, sem ser necessário refrescar a página, o preço mais recente de um dado leilão.
    ```
  )
]

#centered-slide[= Demonstração da Aplicação]

#centered-slide[= Análise e Avaliação da Aplicação Desenvolvida]

#slide[
  == Funcionalidades Pedidas
  #one-by-one[
    - Permitir a administradores gerir outros administradores
  ][ 
    - Permitir a administradores criar produtos e leilões
  ][
    - Permitir utilizadores visualizar leilões e criar conta no website
  ][
    - Permitir licitadores carregar e retirar fundos da plataforma
  ][
    - Permitir licitadores criar licitações em produtos
  ][
    Cumprimos todas as funcionalidades *com sucesso* $checkmark$
  ][
    
    Implementação segue muito próximo do que foi desenhado nos esboços
  ]

  #pdfpc.speaker-note(
    ```
    Tendo em conta as funcionalidades pedidas e casos de uso estabelecidos para a aplicação, esta deveria ser capaz de:

    - Permitir a administradores gerir outros administradores
    - Permitir a administradores criar produtos e leilões
    - Permitir utilizadores visualizar leilões e criar conta no website
    - Permitir licitadores carregar e retirar fundos da plataforma
    - Permitir licitadores criar licitações em produtos
    
    Consideramos que cumprimos corretamente todas estas funcionalidades, que são essenciais para este tipo de plataforma. A implementação visual também está muito próxima com o que foi desenhado nos esboços. 
    ```
  )
]

#slide(center-horizon[
  == Considerações finais

  #pdfpc.speaker-note(
    ```
    Este sucesso deve-se ao restrito número de funcionalidades definidas, que nos permitiu focar na base da aplicação e desenvolver um núcleo sólido a partir de onde foram desenvolvidas as referidas funcionalidades. A base é facilmente expansível para acolher novas funcionalidades em futuras atualizações à plataforma.
    
    Apesar de simples, desenvolvemos um produto sólido, funcional e intuitivo que irá ter de acordo com as necessidades da empresa e do cliente, tanto no presente como no futuro.
    ```
  )
])

#rerender(<first-slide>)