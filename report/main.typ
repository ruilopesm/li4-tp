#import "cover.typ": cover
#import "template.typ": *
#import "utils.typ": *
#import "@preview/tablex:0.0.6": tablex, cellx

#import "@preview/big-todo:0.2.0": *

#show: project

#cover(
  title: "Maçã - Leilões Online",
  authors: (
    (name: "Daniel Pereira", number: "a100545"), 
    (name: "Duarte Ribeiro", number: "a100764"), 
    (name: "Francisco Ferreira", number: "a100660"),
    (name: "Rui Lopes", number: "a100643")
  ), 
  date: "janeiro, 2024",
)

#set page(numbering: "i", number-align: center)
#counter(page).update(1)

#heading(numbering: none, outlined: false)[Resumo]

Este relatório tem como objetivo apresentar o sistema de leilões online da empresa Maçã, que será desenvolvido pela equipa de trabalho, no âmbito da unidade curricular de Laboratórios de Informática IV, do curso de Engenharia Informática, da Universidade do Minho.

Neste, encontram-se detalhadas a primeira, segunda e terceira fases do desenvolvimento de uma solução de _software_.

A primeira etapa centrou-se na definição do sistema a desenvolver, nomeadamente abordando aspetos como os seus objetivos, a sua viabilidade e os recursos necessários para a sua realização.

A segunda etapa focou-se na especificação e modelação do sistema. Nesta, o objetivo passou por especificar e modelar os aspetos estruturais e comportamentais do sistema, de modo a obter uma visão geral do mesmo.
Assim, foram desenvolvidos diagramas que suportassem esse desenvolvimento.
Esta etapa possuiu também um foco na conceção do sistema de dados, onde foi possível planear uma base de dados que apoiasse o funcionamento do sistema.

A terceira e última etapa consistiu na implementação da aplicação descrita nas fases anteriores, fazendo uso de ferramentas e tecnologias presentes no ecossistema do .NET Core.

\

*Área de Aplicação*: Leilões Online.

*Palavras-Chave*: Engenharia de Software, Programação Web, Desenho e Arquitetura de Sistemas de Gestão de Bases de Dados, Planeamento de Software, Modelação de Sistemas, Unified Modelling Language, Bases de Dados Relacionais, Microsoft SQL Server, .NET Core, C\#.

#show outline: it => {
    show heading: set text(size: 18pt)
    it
}

#{
  show outline.entry.where(level: 1): it => {
    v(5pt)
    strong(it)
  }

  outline(
    title: [Índice], 
    indent: true,
    depth: 2
  )
}

#v(-0.4em)
#outline(
  title: none,
  target: figure.where(kind: "attachment"),
  indent: n => 1em,
)

#outline(
  title: [Lista de Figuras],
  target: figure.where(kind: image),
)

#outline(
  title: [Lista de Tabelas],
  target: figure.where(kind: table)
                .or(figure.where(kind: "use-case"))
                .or(figure.where(kind: "sql-table")),
)

#outline(
  title: [Lista de Esboços],
  target: figure.where(kind: "mockup"),
)

#set page(numbering: "1", number-align: center)
#counter(page).update(1)

// Introdução
#section("introducao")

// Requisitos
#section("requisitos/main")

= Especificação e Modelação do Software <especificacao>

== Apresentação geral da especificação
Para esta fase, recorremos à notação UML, como forma de auxiliar no desenvolvimento de diagramas que suportem o projeto ao nível estrutural e ao nível comportamental.

Em termos estruturais, construímos um modelo de domínio para caracterizar as entidades envolvidas no sistema bem como as relações existentes entre as mesmas.

Em termos comportamentais, começamos por definir um conjunto de use cases que especificam as funcionalidades principais do programa. Seguidamente, construímos um diagrama de use cases, onde é possível verificar quais os atores envolvidos no sistema e, concretamente, em cada use case. Construímos, ainda, um diagrama de atividades para descrever o ciclo de vida de um produto e um diagrama de máquina de estado para modelar um leilão.

== Aspetos estruturais

Na definição dos aspetos estruturais, é necessário identificar e compreender o conjunto de entidades e relações existentes no domínio a que o sistema se destina.

Por esse motivo, decidimos elaborar um modelo de domínio, visto que este fornece uma representação visual bastante clara das entidades do sistema e das relações entre as mesmas. Além disso, o modelo de domínio pode ser visto como um planeamento a alto nível do sistema final. E, por isso, terá uma grande utilidade na fase de implementação, como forma de garantir que a aplicação está a ser desenvolvida como foi planeada.

Apresenta-se, então, de seguida, o modelo de domínio desenvolvido.

#figure(vp_image("/images/ModeloDominioDiagram.svg"), caption: "Modelo de domínio")
#linebreak()
Numa análise de relance é intuitivo perceber que já estão modelados os principais objetivos da aplicação, nomeadamente, a interação Utilizador $<->$ Leilão, através de uma Licitação. Ainda, a título de exemplo, se encontram já especificados com detalhe os produtos a serem leiloados.

== Aspetos comportamentais
A aplicação que vamos desenvolver foi projetada para atender apenas a um tipo de utilizador: o licitador. Assim, neste caso, são os administradores do sistema os responsáveis por colocar produtos a leilão. Além disso, existe um e um só administrador do tipo _master_ responsável por gerir os outros administradores no sistema.

Para isso, iremos apresentar um conjunto de casos de uso para os diferentes atores conforme descrito de acordo com os diagramas abaixo. De notar que a lista exaustiva de todas as tabelas descritivas de use cases pode ser encontrada no @lista_exaustiva_use_cases.

#pagebreak()

=== Diagrama de use cases
#section("use_cases/diagrama")

#pagebreak()
=== Use cases de utilizador

#rerender(<usecase_listar_leiloes>)

#rerender(<usecase_registar>)

#rerender(<usecase_autenticar>)

#pagebreak()
=== Use cases de licitador

#rerender(<usecases_licitar_produto>)

#rerender(<usecase_visualizar_leiloes_vencidos>)

#rerender(<usecase_carregar_fundos>)

#rerender(<usecase_levantar_fundos>)

=== Use cases de administrador

#rerender(<usecase_criar_administrador>)

#rerender(<usecase_criar_produto>)

#rerender(<usecase_criar_leilao>)

#rerender(<usecase_cancelar_leilao>)

=== Use cases de administrador master

#rerender(<usecase_criar_administrador>)

#rerender(<usecase_remover_administrador>)

#pagebreak()

== Diagrama de atividades
Detalhamos aqui o processo que um produto atravessa de modo a ser vendido pela Maçã. Os produtos devolvidos, defeituosos ou vindos de retoma são submetidos a testes de fiabilidade para assegurar que ainda cumprem os rigorosos requisitos de qualidade da empresa. Se tal não for o caso, o produto irá ser arranjado. Caso contrário, os danos cosméticos no mesmo serão avaliados e atribuído um rating ao produto. A partir daí um administrador pode registar o produto na plataforma e criar um leilão. Quando este termina, o produto é enviado ao vencedor. Se ninguém licitar no produto, este pode voltar a ser leiloado.
#figure(vp_image("/images/Product Activity Diagram.svg"),
  caption: "Diagrama de atividade do produto"
)

#pagebreak()

== Diagrama de máquina de estado
Este diagrama detalha a mecânica de leilões. Quando um leilão é criado, este passa a pendente. Quando a hora de início do mesmo chegar, este passa a estar ativo e utilizadores podem licitar no produto em questão. Se há uma licitação menos de 15 minutos antes do fim do leilão, este é estendido por outros 15 minutos. Quando o a data do fim do leilão chega, o produto é considerado vendido se houveram licitações. Caso contrário, o leilão é considerado cancelado, algo que também pode acontecer por ação de um administrador enquanto o leilão está ativo.
#figure(vp_image("/images/Leilao State Machine.svg"),
  caption: "Diagrama de estados de um leilão"
)

= Conceção do Sistema de Dados <concecao_sistema_dados>
A nossa aplicação vai possuir diversos dados acerca dos produtos, leilões e licitadores. Com o passar do tempo, é normal que o sistema comece a armazenar uma grande quantidade de informação e, por esse motivo, é fundamental implementar uma base de dados que organize todas essas informações de forma eficiente.

Além disso, uma base de dados é capaz de gerar relatórios e estatísticas que possuem informações úteis. Por exemplo, podem ser gerados estatísticas que informem qual o número de leilões efetuados com sucesso num dado intervalo de tempo.

Finalmente, as bases de dados possuem implementações muito eficientes de armazenamento de dados, o que permite uma consulta rápida dos mesmos, dando, assim, uma experiência final ao utilizador mais agradável e cumprindo com alguns dos requisitos não funcionais estabelecidos.

#pagebreak()

== Apresentação geral da estrutura do sistema de dados
Após definirmos os modelos que irão sustentar a implementação do sistema, foi necessário planear uma base de dados que apoie o seu funcionamento.
Através de uma análise dos requisitos recolhidos e com auxílio dos modelos apresentados na especificação dos sistema, foi possível reproduzir o seguinte modelo lógico.

#figure(vp_image("images/Modelo Lógico.svg"), caption: "Modelo lógico do sistema de dados")

#pagebreak()

== Descrição detalhada dos vários elementos de dados e seus relacionamentos

Para uma melhor compreensão das entidades na base de dados, as suas relações e os seus atributos, elaborou-se um dicionário de dados em que explicamos o tipo e a descrição de cada campo.

#linebreak()

#rerender(<Tabela_Utilizador>)

#rerender(<Tabela_Licitador>)

#rerender(<Tabela_Produto>)

#rerender(<Tabela_Leilao>)

#rerender(<Relacionamento_Leilao_Produto>)

\

Como de costume, a lista exaustiva de todas as tabelas e relacionamentos SQL pode ser encontrada no @lista_exaustiva_sql. Pode também ser encontrado 

= Esboço das Interfaces do Sistema <esbocos_sistema>

Inicialmente, foi desenhado um logotipo com o intuito de ser simples e apelativo. O mesmo é completamente original e possui o desenho de uma maçã e o nome da empresa.

#figure(image("images/Logotipo.svg", width: 50%), caption: "Logotipo da aplicação")

Foi, também, desenvolvida uma #underline[palete de cores] que se adequasse ao minimalismo do sistema e que fosse agradável à vista.

#figure(color_pallete((
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
)), kind: image, caption: [Palete de cores do sistema])

De seguida, iremos fazer uma apresentação de alguns esboços desenhados.

#pagebreak()

#rerender(<mockup_leiloes_sem_autenticacao>)

#rerender(<mockup_leiloes>)

#rerender(<mockup_registo_com_erro>)

#rerender(<mockup_ver_detalhes>)
#rerender(<mockup_ver_produtos_hover>)

#rerender(<mockup_criar_produto_com_input>)

#rerender(<mockup_editar_produto>)

A lista exaustiva de todos os esboços da interface podem ser encontrados no @lista_exaustiva_esbocos.

= Manual da Aplicação <manual_aplicacao>
Num sistema cujo público alvo é generalizado, a facilidade de uso da aplicação e o facto das interfaces serem apelativas é imperativo. Estes fatores são extremamente importantes para contribuir para uma boa experiência de utilizador (UX), gerando assim uma percepção positiva da aplicação.
Com isto, as interfaces da aplicação foram planeadas e desenvolvidas a pensar nesses requisitos não funcionais.

Abaixo disponibilizamos um diagrama da hierarquia dos caminhos de utilização da aplicação, que detalha quais páginas estão acessíveis a partir de outras (as páginas na barra de navegação encontram-se sempre acessíveis). A azul claro encontram-se as páginas acessíveis a todos os utilizadores, a azul escuro as páginas apenas acessíveis a utilizados não autenticados, a amarelo as páginas restritas a licitadores, a vermelho estão as páginas apenas acessíveis a administradores, e a laranja encontram-se as páginas restritas a administradores master.

#figure(vp_image("images/Navegação Website.svg"), caption: "Diagrama dos caminhos de utilização da aplicação")

== Menu de Leilões
Inicialmente, o utilizador depara-se com a página inicial da aplicação. Nesta, é possível visualizar os leilões atualmente em curso com informação de cada leilão e do produto a ser leiloado. A _toolbar_ é alterada de acordo com o estado de sessão do utilizador e o cargo do mesmo, pelo que, inicialmente, informações de saldo da conta e outros menus estarão indisponíveis, sendo apenas possível visualizar os leilões.

O utilizador pode visualizar um leilão em detalhe clicando no botão "Ver detalhes" ou entrar na página de registo ou iniciar sessão no sistema. 

Após iniciar sessão, o utilizador já pode visualizar as licitações que fez, os leilões que ganhou, o seu perfil e a sua carteira. 
#rerender(<pagina_leioes>)

== Página de Login
Nesta página, facultamos aos utilizadores a possibilidade de efetuarem a autenticação na nossa plataforma. Para tal, basta inserir as suas credenciais, nomeadamente o "Email" e a "Password", que devem corresponder aos dados fornecidos aquando do registo. Se o _email_ ou a palavra-passe estiverem incorretos, o utilizador será prontamente alertado, sendo-lhe concedida uma nova oportunidade para realizar a autenticação correta.
#rerender(<pagina_login>)

== Página de registo
Para se registar no sistema, o utilizador deve preencher um formulário com os seus dados pessoais, incluindo "Nome", "Email", "Password", "NIF" e "Data de Nascimento". Caso o utilizador já tenha uma conta, pode iniciar sessão no sistema com o seu _email_ e _password_.
#rerender(<pagina_registo>)

== Página de leilão
Ao clicar no "Ver detalhes" de um leilão, o utilizador é redirecionado para a página do leilão em questão. Nesta página, o utilizador pode visualizar as fotos do produto a ser leiloado, o nome do produto, as características (cor, armazenamento, condição e estado) do produto, a descrição do produto, a hora de começo, término e quanto tempo falta para o final do leilão, o valor inicial e atual do leilão. Também pode licitar no leilão introduzindo o valor na caixa em baixo das informações do preço do leilão e clicando no botão para licitar, caso esteja autenticado e tenha saldo para tal. Em baixo da página, o utilizador pode visualizar o histórico de licitações do leilão, com o nome de cada licitador, o valor da licitação e a hora da licitação.
#rerender(<pagina_ver_detalhes>)

== Minhas Licitações
Nesta página, encontram-se concentrados todos os leilões nos quais o utilizador realizou pelo menos uma licitação. A disposição dos leilões nesta página é bastante semelhante à da página inicial. No entanto, em vez de apresentar o estado atual do produto, exibe-se a última licitação realizada pelo utilizador atual. A cor do valor da última licitação do utilizador será sempre verde se o leilão estiver a decorrer. Caso a maior licitação até ao momento pertença ao utilizador atual, também será exibida a verde; caso contrário, aparecerá a vermelho. Para os leilões já concluídos, o valor da última licitação feita pelo utilizador será apresentado a azul. Se o utilizador tiver ganho o leilão, o valor da licitação vencedora também aparecerá a azul; caso contrário, estará a vermelho.
#rerender(<pagina_minhas_licitacoes>)

== Leilões Ganhos
Nesta secção, são destacados todos os leilões nos quais o utilizador emergiu como vencedor. Assim como na página anterior, a disposição dos leilões segue uma estrutura semelhante à da página inicial. Contudo, em vez de apresentar o estado atual do produto, exibe-se o valor da licitação vencedora realizada pelo utilizador.
#rerender(<pagina_leiloes_ganhos>)

== Meu Perfil
Finalmente, aos olhos do utilizador, esta constitui a última página acessível. A partir dela, o utilizador pode efetuar levantamentos ou depósitos na sua conta, selecionando um dos valores predefinidos.
#rerender(<pagina_meu_perfil>)

== Vista de administrador
Já na parte administrativa, o administrador pode visualizar todos os produtos criados, criar novos produtos, e editar/eliminar produtos existentes que não tenham sido leiloados. A descrição atual do produto pode ser vista dando _hover_ sobre o "Descrição" do produto.
#rerender(<pagina_produtos_admin>)

Ao clicar no botão de "Criar produto", um formulário é aberto na mesma página para o administrador preencher com informações de Modelo, Estado, Condição, Descrição e Fotos do Produto em questão. Após preencher o formulário, o administrador pode clicar no botão de "Confirmar" para criar o produto ou pode cancelar a qualquer altura no botão de "Cancelar" para cancelar a criação do produto.
#rerender(<pagina_criar_produto>)

Ao clicar no botão de "Editar" de um produto, um formulário com o mesmo estilo é aberto na mesma página em que o administrador pode editar as informações de um produto. Após editar as informações, o administrador pode clicar no botão de "Confirmar" para editar o produto com as novas mudanças ou pode cancelar a qualquer altura ao clicar no botão de "Cancelar" para cancelar a edição do produto.

Para terminar, na vista de administrador, existe também uma página que permite criar e eliminar novos administradores.
#rerender(<pagina_gerenciar_admins>)

A lista exaustiva de todas as páginas implementadas pode ser encontrada no @lista_exaustiva_paginas.

= Implementação da Aplicação <implementacao_aplicacao>
A aplicação foi implementada utilizando a _framework_ _Blazor Server_. Esta apresentou-se como uma opção bastante favorável ao desenvolvimento da aplicação.

As secções seguintes detalham as várias componentes desenvolvidas e a forma como estas implementam as funcionalides descritas em capítulos anteriores.

Abaixo encontra-se um diagrama que representa a estrutura do projeto desenvolvido e a interação entre os diferentes sistemas envolvidos no mesmo. Os utilizadores utilizam o _browser_ no computador para se ligarem ao _website_. Para carregar os dados relevantes, cada página contacta um número de serviços, que por sua vez contactam a base de dados, de modo a disponibilizar a informação necessária para a visualização da página.

#figure(vp_image("images/Diagrama de Instalação.svg"), caption: "Diagrama de instalação do projeto")

Estas páginas e serviços acima referidos estão descritos e detalhados no diagrama de componentes visível abaixo.

#figure(vp_image("images/Diagrama de Componentes.svg"), caption: "Diagrama de Componentes")

== Serviços
O _Blazor Server_ @blazor utiliza o padrão de desenvolvimento por injeção de dependências. Neste, em vez de se instanciarem as dependências de uma classe dentro dela, estas são injetadas, isto é, inseridas diretamente no construtor da classe a ser utilizadas.

Como exemplo, uma classe que necessite de um módulo de acesso à base de dados e um serviço de envio de emails, ao invés de os instanciar dentro de si, recebe ambos os módulos no seu construtor, para os utilizar posteriormente.

Em _Blazor Server_, a injeção de dependências está assente na lógica de serviços. Os serviços são módulos de código aos quais as páginas poderão aceder. Para um serviço ser marcado como injetável, deve ser declarado como tal no ficheiro `Startup.cs`. O _Blazor Server_ irá, depois, injetar automaticamente os serviços requisitados pelas páginas nos seus construtores.
Detalham-se, de seguida, os principais serviços da aplicação.

=== SqlDataAccess
Este serviço abstrai o acesso à base de dados. A partir dele é possível aceder e manipular
as várias entidades existentes na base de dados. Com este módulo é possível executar operações de criação, leitura, atualização e remoação sobre os dados existentes na base de dados. Permite também executar queries complexas envolvendo relacionamentos 1:N e N:M. E, permite ainda, executar transações sobre vários dados ao mesmo tempo. Esta classe possui uma interface `ISqlDataAccess`, expondo alguns métodos que são utilizados por outros serviços mais granulares, apresentados já de seguida.

=== UserService
Este serviço é responsável por gerir os utilizadores da aplicação, sendo possível, através dele, operar sobre os dados de todos os utilizadores. Permite encontrar também utilizadores que tenham um role específico - licitadores ou administradores.

=== AuctionService
Este serviço é responsável por gerir os leilões criados na aplicação, sendo possível, através dele, operar sobre os dados de todos os leilões.

=== BidService
Este serviço é responsável por gerir as licitações efetuados sobre leilões, sendo possível, através dele, operar sobre os dados de todas as licitações.

=== ProductService
Este serviço é responsável por gerir os produtos presentes na aplicação, sendo possível, através dele, operar sobre os dados de todos os produtos.

== Models
A aplicação contém vários modelos que irão representar as tabelas presentes na base de dados.

=== UserModel
Este modelo é representativo da tabela de utilizadores na base de dados. Para além deste modelo, existem ainda outros dois modelos representantivos de um licitador e de um administrador. `BidderModel` e `AdminModel`, respetivamente.

=== AuctionModel
Este modelo é representativo da tabela de leilões na base de dados. O mesmo, para além dos dados habituais, possui uma referência para o produto que está a ser leiloado, uma referência para o administrador que criou o leilão, uma referência, opcional, para o licitador vencedor do leilão e uma lista das licitações efetuadas no leilão em questão.

=== BidModel
Este modelo é representativo da tabela de licitações na base ded dados, que, por sua vez, representa o relacionamento entre os leilões e os licitadores. Este, para além dos dados habituais, possui uma referência ao leilão e ao licitador.

=== ModelModel
Este modelo é representativo do modelo de um produto.

=== ProductModel
Este modelo é representativo da tabela de produtos. Para além dos dados habituais, o mesmo possui uma referência ao modelo a que está associado e uma lista de imagens.

== Autenticação e Autorização
O módulo de autenticação concretiza-se na classe `AuthProvider`, que deriva de `AuthenticationStateProvider`, já existente no _Blazor Server_. Esta é responsável por guardar uma estrutura de dados `UserSession` que possui o email e o cargo do utilizador atualmente autenticado. Esta estrutura é atualizada aquando do login do utilizador na aplicação.

Em relação à autorização, e como forma de prevenir que um utilizador mal intencionado aceda a páginas indevidas, foi utilizada a classe `AuthorizeView`, já presente no _Blazor Server_, capaz de receber um cargo e de autorizar apenas os utilizadores que possuem esse cargo a aceder à página em questão.

Novamente, a escolha de _Blazor Server_ centrou-se também nestes mecanismos já existentes que são providenciados pela framework.

== Segurança e Proteção de Dados
Garantir a segurança e a proteção de dados dos utilizadores é um passo muito importante no desenvolvimento de uma aplicação. Nesse sentido, foi desenvolvido um sistema de _hashing_ de password, utilizando o algoritmo Bcrypt. Assim, na base de dados, é guardada uma _hash_ e não a password diretamente. Deste modo, é possível garantir a confidencialidade deste dado tão importante para os utilizadores e cumprir com as normas vigentes.

== Atualizações em tempo real
Uma vez que o foco da aplicação é leilões online, é imperativo que existam atualizações em tempo real do preço atual de um dado leilão. De facto, só dessa forma é que a aplicação traria uma utilização justa a todos os utilizadores, tal como referido nos requisitos não funcionais.

Ora, para tal recorreu-se a uma tecnologia muito interessante do ecossistema do _Blazor_ chamada `SignalR`. O objetivo passou por se criar um `Hub` onde todos os clientes estão subscritos e para onde todos os clientes publicam mensagens, quase como uma arquitetura publicador-subscritor. Assim, é possível observar, sem ser necessário refrescar a página, o preço mais recente de um dado leilão.

= Análise e Avaliação da Aplicação Desenvolvida <analise_avaliacao_aplicacao>
Tendo em conta as funcionalidades pedidas e casos de uso estabelecidos para a aplicação, esta deveria ser capaz de:

- Permitir a administradores gerir outros administradores
- Permitir a administradores criar produtos e leilões
- Permitir utilizadores visualizar leilões e criar conta no website
- Permitir licitadores carregar e retirar fundos da plataforma
- Permitir licitadores criar licitações em produtos

Consideramos que cumprimos corretamente todas estas funcionalidades, que são essenciais para este tipo de plataforma. A implementação visual também está muito próxima com o que foi desenhado nos esboços. 

Este sucesso deve-se ao restrito número de funcionalidades definidas, que nos permitiu focar na base da aplicação e desenvolver um núcleo sólido a partir de onde foram desenvolvidas as referidas funcionalidades. A base é facilmente expansível para acolher novas funcionalidades em futuras atualizações à plataforma.

Apesar de simples, desenvolvemos um produto sólido, funcional e intuitivo que irá ter de acordo com as necessidades da empresa e do cliente, tanto no presente como no futuro.

= Conclusões e Trabalho Futuro <conclusao>

Com este trabalho tivemos a oportunidade de realizar todo o processo da conceção de uma aplicação.

Começamos por definir um uso para a mesma, justificar a sua existência, verificar a sua viabilidade e definir os recursos necessários para a sua realização. Depois de definidos estes preliminares, foi necessário consultar o cliente corporativo e também o final para perceber os seus requisitos e necessidades de modo a definir as funcionalidades necessárias. Utilizamos essa informação para definir um modelo geral e casos de uso do programa, que depois foram refinados e mais detalhados em diagramas mais complexos.

Todo este trabalho culminou no desenvolvimento da aplicação final e devida documentação da mesma. É-nos claro que esta metodologia foi crucial para o sucesso, rapidez e eficiência no desenvolvimento da solução, pois permitiu-nos ter uma visão clara e completa do problema antes de o resolver, evitando a custosa resolução de erros, conflitos e más implementações. Atribuimos assim o crédito da celeridade de desenvolvimento e qualidade do produto final em parte a este método de desenvolvimento. Outro fator crucial no sucesso do desenvolvimento foram as ferramentas utilizadas, que devido à integração sublime entre as mesmas facilitou a conexão e coesão entre os diferentes componentes do sistema.

A única parte do ciclo de vida de uma aplicação que ficou por explorar neste projeto foi a futura manutenção e expansão das funcionalidades do mesmo. Acreditamos que a metodologia de desenvolvimento praticada durante a execução da versão inicial do projeto tornaria a manutenção e expansão do sistema muito mais simples, pois é uma filosofia abrangente e generalizada, facilmente aplicada a novas funcionalidades e versátil o suficiente para as compatibilizar com a solução existente.

#set heading(numbering: none)

#bibliography(full: true, "bibliography.bib")

= Lista de Siglas e Acrónimos

/ LI4: Laboratórios de Informática IV
/ NIF: Número de Identificação Fiscal
/ UML: _Unified Modelling Language_
/ UX: _User Experience_ (Experiência de utilizador)

= Anexos

#attachment[Diagrama de Gantt] <gantt>

// #align(center, image("attachments/gantt rotated.svg", width: 38%))
#align(center, image("attachments/gantt.svg", width: 120%))

#pagebreak()
#attachment[Lista exaustiva de Casos de uso] <lista_exaustiva_use_cases>

#usecase_table(
  usecase: "Listar os leilões a decorrer",
  actor: "Utilizador",
  desc: "Listar todos os leilões a decorrer no momento",
  pre: "",
  pos: "Leilões serem listados ao utilizador",
  ("Fluxo normal", 
  [1. Utilizador pede ao sistema os leilões a decorrer],
  [2. Os leilões são devolvidos ao utilizador]
  ),
) <usecase_listar_leiloes>

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
  [3.1. O sistema informa que o utilizador não possui a idade mínima de utilização]
  ),
) <usecase_registar>

#usecase_table(
  usecase: "Autenticar-se na plataforma como licitador",
  actor: "Utilizador",
  desc: "Utilizador autenticar-se na plataforma como licitador",
  pre: "O utilizador não está autenticado",
  pos: "O utilizador está autenticado na plataforma como licitador",
  ("Fluxo normal", 
  [1. Sistema pede o email de registo e palavra-passe],
  [2. Utilizador introduz no sistema o email e palavra-passe e confirma o login],
  [3. Sistema verifica se email está registado na plataforma],
  [4. Sistema verifica se palavra-passe fornecida coincide com a existente na base de dados],
  [5. Sistema autentica utilizador]
  ),
  ("Fluxo de Exceção (1) (Não existe conta registada sob esse email)",
  [3.1. O sistema avisa que não existe nenhuma conta registada sob esse email na plataforma]
  ),
  ("Fluxo de Exceção (2) (Palavra-passe incorreta)",
  [3.1. O sistema avisa que a palavra-passe está incorreta]
  ),
) <usecase_autenticar>

#usecase_table(
  usecase: "Visualizar os leilões em que licitou",
  actor: "Licitador",
  desc: "Enumerar todos os Leilões licitados pelo Utilizador",
  pre: "",
  pos: "Leilões licitados serem listados ao utilizador",
  ("Fluxo normal", 
  [1. Utilizador pede ao sistema os Leilões licitados por si],
  [2. Os leilões são devolvidos ao utilizador]
  ),
  ("Fluxo de Exceção (1) (Utilizador não possui Leilões licitados)",
  [2.1. O sistema informa que não há Leilões licitados para listar]
  ),
)

#usecase_table(
  usecase: "Visualizar histórico de licitações num leilão",
  actor: "Licitador",
  desc: "Enumerar todas as licitações de um leilão",
  pre: "",
  pos: "Licitações de um leilão serem listadas",
  ("Fluxo normal", 
  [1. Utilizador seleciona o leilão que pretende visualizar o histórico de licitações],
  [2. As licitações são devolvidas ao Utilizador]
  ),
  ("Fluxo de Exceção (1) (Leilão não possui licitações)",
  [2.1. O sistema informa que o leilão não possui licitações para serem listados]
  ),
)

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
  [6.1. O sistema avisa que o licitador não tem fundos suficientes]
  ),
) <usecases_licitar_produto>

// #usecase_table(
//   usecase: "Visualizar dados pessoais",
//   actor: "Licitador",
//   desc: "Visualização dos dados pessoais",
//   pre: "",
//   pos: "Dados pessoais serem apresentados ao utilizador",
//   ("Fluxo normal", 
//   [1. Sistema apresenta os dados pessoais do Utilizador atual]
//   ),
// )

#usecase_table(
  usecase: "Visualizar os leilões que venceu",
  actor: "Licitador",
  desc: "Listar todos os leilões vencidos pelo licitador",
  pre: "",
  pos: "Leilões vencidos serem listados ao licitador",
  ("Fluxo normal", 
  [1. Licitador pede ao sistema os Leilões vencidos por si],
  [2. Os leilões são devolvidos ao utilizador]
  ),
  ("Fluxo de Exceção (1) (Utilizador não possui Leilões vencidos)",
  [2.1. O sistema informa que não há Leilões vencidos para listar]
  ),
) <usecase_visualizar_leiloes_vencidos>

// #usecase_table(
//   usecase: "Alterar dados pessoais",
//   actor: "Licitador",
//   desc: "Alterar os dados pessoais",
//   pre: "",
//   pos: "Dados pessoais serem alterados",
//   ("Fluxo normal", 
//   [1. Sistema apresenta os dados pessoais do Utilizador atual],
//   [2. Utilizador substitui aqueles que acha necessário (exceto data de nascimento e NIF)],
//   [3. Sistema verifica se email não está registado noutra conta],
//   [4. Sistema altera os dados do utilizador e notifica o mesmo]
//   ),
//   ("Fluxo de Exceção (1) (O email já pertence a outro utilizador)",
//   [3.1 O sistema informa que já existe um utilizador registado com o email fornecido]
//   ),
// )

#usecase_table(
  usecase: "Carregar fundos",
  actor: "Licitador",
  desc: "Adicionar fundos à carteira do utilizador",
  pre: "",
  pos: "Fundos serem adicionados aos fundos livres do Utilizador",
  ("Fluxo normal",
  [1. Sistema pede a quantia que o licitador deseja adicionar aos seus fundos],
  [2. Utilizador introduz no sistema a quantia que deseja adicionar aos seus fundos],
  [3. Sistema adiciona a quantia de fundos especificada aos fundos livres do Utilizador]
  ),
) <usecase_carregar_fundos>

#usecase_table(
  usecase: "Levantar fundos",
  actor: "Licitador",
  desc: "Levantar fundos da sua conta",
  pre: "",
  pos: "Fundos livres serem removidos da conta do licitador",
  ("Fluxo normal", 
  [1. Sistema pede a quantia de fundos que o licitador pretende levantar],
  [2. Licitador introduz no sistema a quantia que deseja levantar],
  [3. Sistema subtrai a quantia de fundos especificados aos fundos livres do licitador]
  ),
  ("Fluxo de Exceção (1) (Valor especificado ultrapassa valor de fundos livres do licitador)",
  [3.1. O sistema avisa que o licitador não possui fundos que chegue para levantar a quantia especificada]
  ),
) <usecase_levantar_fundos>

#usecase_table(
  usecase: "Terminar sessão como licitante",
  actor: "Licitador",
  desc: "Licitador autenticado termina a sua sessão na plataforma",
  pre: "O licitador está autenticado",
  pos: "O licitador não está autenticado na plataforma, passando a ser apenas um utilizador",
  ("Fluxo normal", 
  [1. Utilizador informa o sistema da sua intenção de terminar sessão],
  [2. Sistema termina a sessão do utilizador e este deixa de estar autenticado],
  ),
)

#usecase_table(
  usecase: "Listar administradores",
  actor: "Administrador Master",
  desc: "Listar todos os administradores",
  pre: "",
  pos: "Todos os administradores serem listados",
  ("Fluxo normal", 
  [1. Sistema lista todos os administradores presentes na plataforma]
  ),
  ("Fluxo de Exceção (1) (Não existem administradores no sistema)",
  [3.1. O sistema avisa o administrador que não existem outros administradores para serem listados]
  ),
)

#usecase_table(
  usecase: "Criar administrador",
  actor: "Administrador Master",
  desc: "Criar um novo administrador",
  pre: "",
  pos: "Novo administrador ser registado",
  ("Fluxo normal", 
  [1. Sistema solicita ao administrador master os dados do administrador a ser criado (nome, email e password)],
  [2. Administrador introduz os dados requisitados],
  [3. O sistema verifica se não existe uma conta com o mesmo email],
  [4. O sistema cria um novo administrador com os dados fornecidos e informa o administrador master que a conta foi criada]
  ),
  ("Fluxo de Exceção (1) (Já existe uma conta com o email fornecido)",
  [3.1. O sistema avisa que já existe uma conta com o email fornecido]
  ),
) <usecase_criar_administrador>

#usecase_table(
  usecase: "Editar administrador",
  actor: "Administrador Master",
  desc: "Editar um administrador já existente",
  pre: "",
  pos: "Administrador ser atualizado com os novos dados",
  ("Fluxo normal", 
  [1. Sistema solicita ao administrador master que administrador pretende alterar],
  [2. O administrador master seleciona o administrador],
  [3. O sistema solicita ao administrador master que campos pretende alterar (nome, email e password)],
  [4. O administrador master substitui os campos que considera necessário],
  [5. O sistema verifica se os novos dados são válidos],
  [6. O sistema altera as informações do produto com os dados fornecidos]
  ),
  ("Fluxo de Exceção (1) (Dados não válidos)",
  [5.1. O sistema avisa que os dados não são válidos]
  ),
)

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
) <usecase_remover_administrador>

#usecase_table(
  usecase: "Listar produtos",
  actor: "Administrador",
  desc: "Listar todos os produtos disponíveis",
  pre: "",
  pos: "Todos os produtos serem listados",
  ("Fluxo normal", 
  [1. Sistema lista todos os produtos disponíveis na plataforma]
  ),
  ("Fluxo de Exceção (1) (Não existem produtos no sistema)",
  [3.1. O sistema avisa o administrador que não existem produtos para serem listados]
  ),
)

#usecase_table(
  usecase: "Criar produto",
  actor: "Administrador",
  desc: "Criar um novo produto",
  pre: "",
  pos: "Novo produto ser adicionado ao sistema",
  ("Fluxo normal", 
  [1. Sistema solicita ao administrador os dados do produto (modelo, estado, condição, descrição e fotos do produto)],
  [2. Administrador fornece os dados requisitados],
  [3. O sistema verifica se os dados introduzidos são válidos],
  [4. O sistema cria um novo produto com os dados fornecidos]
  ),
  ("Fluxo de Exceção (1) (Dados não válidos)",
  [3.1. O sistema avisa que os dados não são válidos]
  ),
) <usecase_criar_produto>

#usecase_table(
  usecase: "Editar produto",
  actor: "Administrador",
  desc: "Editar um produto já existente",
  pre: "",
  pos: "Produto ser atualizado com os novos dados",
  ("Fluxo normal", 
  [1. Sistema solicita ao administrador que produto pretende alterar],
  [2. O Administrador seleciona o produto],
  [3. O sistema solicita ao administrador que campos pretende alterar (fotos, condição, descrição, modelo e estado)],
  [4. O administrador substitui os campos que considera necessário],
  [5. O sistema verifica se os novos dados são válidos],
  [6. O sistema altera as informações do produto com os dados fornecidos]
  ),
  ("Fluxo de Exceção (1) (Dados não válidos)",
  [5.1. O sistema avisa que os dados não são válidos]
  ),
)

#usecase_table(
  usecase: "Remover produto",
  actor: "Administrador",
  desc: "Remover um produto existente",
  pre: "",
  pos: "Produto ser removido do sistema",
  ("Fluxo normal",
  [1. Sistema pede ao administrador o produto que deseja remover],
  [2. O administrador seleciona o produto],
  [3. O sistema remove o produto]
  ),
  ("Fluxo de Exceção (1) (Produto não existente)",
  [3.1. O sistema avisa que o produto não existe]
  ),
)

#usecase_table(
  usecase: "Criar leilão",
  actor: "Administrador",
  desc: "Criar leilão de um produto",
  pre: "",
  pos: "Criar um novo leilão no sistema",
  ("Fluxo normal", 
  [1. Sistema solicita ao administrador o produto que deseja colocar para licitação],
  [2. O administrador seleciona o produto],
  [3. O sistema verifica se o produto selecionado existe],
  [3. O sistema pede ao administrador o valor inicial do leilão, a data de começo e a data de término (com hora)],
  [4. Administrador o fornece os dados requisitados],
  [5. O sistema cria um novo leilão com os dados fornecidos]
  ),
  ("Fluxo de Exceção (1) (Produto não existente)",
  [3.1. O sistema avisa que o produto não existe]
  ),
  ("Fluxo de Exceção (2) (Produto já listado para licitação)",
  [3.1. O sistema avisa que o produto já está listado noutro leilão]
  ),
) <usecase_criar_leilao>

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
) <usecase_cancelar_leilao>

#usecase_table(
  usecase: "Autenticar-se na plataforma como administrador",
  actor: "Utilizador",
  desc: "Utilizador autenticar-se na plataforma como administrador",
  pre: "O utilizador não está autenticado",
  pos: "O utilizador ficar autenticado na plataforma como administrador",
  ("Fluxo normal", 
  [1. Sistema pede o email de registo e palavra-passe],
  [2. Administrador introduz no sistema o email e palavra-passe e confirma o login],
  [3. Sistema verifica se email está registado na plataforma],
  [4. Sistema verifica se palavra-passe fornecida coincide com a existente na base de dados],
  [5. Sistema autentica administrador]
  ),
  ("Fluxo de Exceção (1) (Não existe conta registada sob esse email)",
  [3.1. O sistema avisa que não existe nenhuma conta registada sob esse email na plataforma]
  ),
  ("Fluxo de Exceção (2) (Palavra-passe incorreta)",
  [3.1. O sistema avisa que a palavra-passe está incorreta]
  ),
) <usecase_autenticar_admin>

#usecase_table(
  usecase: "Terminar sessão como administrador",
  actor: "Administrador",
  desc: "Administrador autenticado termina a sua sessão na plataforma",
  pre: "O administrador está autenticado",
  pos: "O administrador não está autenticado na plataforma, passando a ser apenas utilizador",
  ("Fluxo normal", 
  [1. Administrador informa o sistema da sua intenção de terminar sessão],
  [2. Sistema termina a sessão do administrador e este deixa de estar autenticado],
  ),
)

#pagebreak()
#attachment[Lista exaustiva de tabelas e relacionamentos do Sistema de Dados] <lista_exaustiva_sql>

#db_table(name: "Tabela Utilizador",
 ([Id], [INT], [Identificador do utilizador]),
 ([Name], [VARCHAR], [Nome do utilizador]),
 ([Email], [VARCHAR], [Email (único) do utilizador para entrada na aplicação]),
 ([Password], [VARCHAR], [Hash da password do utilizador para entrada na aplicação]),
 ([Role], [VARCHAR], [Cargo do utilizador $in$ [Licitador, Administrador]])
) <Tabela_Utilizador>

#db_table(name: [Tabela Licitador],
 ([NIF], [INT], [NIF do utilizador \ Utilizado como identificador único do utilizador]),
 ([Birth Date], [DATE], [Data de nascimento do utilizador \ (é necessário ser maior de 18 anos para utilizar a aplicação)]),
 ([Balance], [MONEY], [Fundos do utilizador na plataforma sem nenhuma \ restrição de uso]),
 ([Pending Balance], [MONEY], [Fundos do utilizador bloqueados temporariamente por fazerem parte de melhores propostas de leilões a decorrer -- serão removidos caso o utilizador ganhe o leilão, ou transformados em fundos livres caso alguém licite com um valor maior]),
 ([User Id], [INT], [Relação identificativa do licitador à tabela de utilizadores])
) <Tabela_Licitador>

#db_relation(
  name: [Licitador -- Utilizador],
  [Um licitador é um utilizador],
  [Licitador (1) - Utilizador (1)],
  [User Id]
)

#db_table(name: "Tabela Administrador",
 ([Internal ID], [INT], [Identificador único do administrador]),
 ([Is Master], [BOOLEAN], [O administrador _Master_ tem permissões de criar outros administradores]),
 ([User ID], [VARCHAR], [Relação identificativa do administrador à tabela de utilizadores]),
) <Tabela_Administrador>

#db_relation(
  name: [Administrador -- Utilizador],
  [Um administrador é um utilizador],
  [Administrador (1) - Utilizador (1)],
  [User Id]
)

#db_table(name: "Tabela Modelo",
  ([ID], [INT], [Identificador único do modelo]),
  ([Name], [VARCHAR], [Nome do modelo]),
  ([Color], [VARCHAR], [Cor (opcional) do modelo]),
  ([Storage], [VARCHAR], [Armazenamento (opcional) do modelo]),
)

#db_table(name: "Tabela Produto",
  ([ID], [INT], [Identificador único do produto]),
  ([Name], [VARCHAR], [Nome do produto]),
  ([Description], [VARCHAR], [Descrição do produto e possíveis defeitos]),
  ([Model ID], [INT], [ID do Modelo a que este produto se refere]),
  ([State], [VARCHAR], [Valor do estado do produto $in$ [Excellent, Good, Bad]]),
  ([Condition], [VARCHAR], [Valor do condição do produto $in$ [Used, Refurbished, Returned]]),
) <Tabela_Produto>

#db_relation(
  name: [Produto -- Modelo],
  [Um produto refere-se a um modelo],
  [Produto (0,N) - Modelo (1,1)],
  [Model ID]
)

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
) <Tabela_Leilao>

#db_relation(
  name: [Leilão -- Licitador],
  [Um leilão tem um vencedor],
  [Leilão (0,N) - Licitador (0,1)],
  [Winner NIF]
)

#db_relation(
  name: [Leilão -- Produto],
  [Um leilão tem um produto a ser leiloado],
  [Leilão (0,N) #footnote[Um mesmo produto pode ser releiloado por vários motivos (ex: não houve vencedores no leilão).] - Produto (1,1)],
  [Product Id]
) <Relacionamento_Leilao_Produto>

#db_relation(
  name: [Leilão -- Administrador],
  [Um leilão foi criado por um administrador],
  [Leilão (0,N) - Administrador (1,1)],
  [Publisher Id]
)

#db_table(name: "Tabela Licitação",
  ([ID], [INT], [Identificador único da licitação]),
  ([Auction ID], [INT], [ID do leilão a que esta licitação se refere]),
  ([Bidder NIF], [INT], [NIF do licitador que fez esta licitação]),
  ([Value], [MONEY], [Valor monetário desta licitação]),
  ([Date], [DATETIME], [Data da licitação])
) <Tabela_Licitacao>

#db_relation(
  name: [Licitação -- Licitador],
  [Uma licitação é feita por um licitador],
  [Licitação (0,N) - Licitador (1,1)],
  [Bidder NIF]
)

#db_relation(
  name: [Licitação -- Leilão],
  [Uma licitação é feita sobre um leilão],
  [Licitação (1,1) - Leilão (0,N)],
  [Auction ID]
)

#db_table(name: "Tabela Fotos de Produto",
  ([ID], [INT], [Identificador único da foto]),
  ([Product Id], [INT], [ID do produto a que esta foto pertence]),
  ([Link], [VARCHAR], [Caminho onde o ficheiro da foto está acessível]),
)

#db_relation(
  name: [Fotos de Produto -- Produto],
  [Um produto tem várias fotos],
  [Fotos de Produto (1,N) -- Produto (1,1)],
  [Product Id]
)

#attachment[Lista exaustiva de esboços da interface do sistema] <lista_exaustiva_esbocos>

#mockupFigure("Leilões (sem estar autenticado).png", caption: [Interface menu de Leilões (sem estar autenticado)]) <mockup_leiloes_sem_autenticacao>
#mockupFigure("Leilões.png", caption: [Interface menu de Leilões]) <mockup_leiloes>
#mockupFigure("Leilões (selecionados).png", caption: [Interface menu de Leilões (selecionado)])
#mockupFigure("Leilões (administrador).png", caption: [Interface menu de Leilões (administrador)])
#mockupFigure("Criar leilão.png", caption: [Interface menu criar leilão (administrador)])
#mockupFigure("Criar leilão (com inputs).png", caption: [Interface menu criar leilão (administrador) (com inputs)])
#mockupFigure("Leilões ganhos.png", caption: [Leilões ganhos])
#mockupFigure("Meu perfil.png", caption: [Meu perfil])
#mockupFigure("Meu perfil (selecionados).png", caption: [Meu perfil (selecionados)])
#mockupFigure("Minhas licitações.png", caption: [Minhas licitações])
#mockupFigure("Minhas licitações (selecionados).png", caption: [Minhas licitações (selecionados)])
#mockupFigure("Página de autenticação.png", caption: [Página de autenticação])
#mockupFigure("Página de registo.png", caption: [Página de registo])
#mockupFigure("Página de registo com erro.png", caption: [Página de registo com erro]) <mockup_registo_com_erro>
#mockupFigure("Página de autenticação (selecionado).png", caption: [Página de autenticação (selecionado)])
#mockupFigure("Toolbar não autenticado.png", caption: [Toolbar não autenticado])
#mockupFigure("Toolbar autenticado.png", caption: [Toolbar autenticado])
#mockupFigure("Toolbar administrador (Master).png", caption: [Toolbar administrador (Master)]) 
#mockupFigure("Toolbar administrador.png", caption: [Toolbar administrador])
#mockupFigure("Ver detalhes.png", caption: [Ver detalhes de um leilão]) <mockup_ver_detalhes>
#mockupFigure("Ver detalhes (terminado).png", caption: [Ver detalhes de um leilão (terminado)])
#mockupFigure("Ver detalhes (sem estar autenticado).png", caption: [Ver detalhes de um leilão (sem estar autenticado)])
#mockupFigure("Ver detalhes (último licitador sou eu).png", caption: [Ver detalhes de um leilão (último licitador sou eu)])
#mockupFigure("Ver detalhes (último licitador sou eu) (selecionado).png", caption: [Ver detalhes de um leilão (último licitador sou eu) (selecionado)])
#mockupFigure("Ver detalhes (sem licitações).png", caption: [Ver detalhes de um leilão (sem licitações)])
#mockupFigure("Ver detalhes (administrador).png", caption: [Ver detalhes de um leilão (administrador)])
#mockupFigure("Ver produtos.png", caption: [Ver produtos (administrador)])
#mockupFigure("Ver produtos (hover na descrição).png", caption: [Ver produtos (hover na descrição) (administrador)]) <mockup_ver_produtos_hover>
#mockupFigure("Criar produto.png", caption: [Criar produto (administrador)])
#mockupFigure("Criar produto (com input).png", caption: [Criar produto (com input) (administrador)]) <mockup_criar_produto_com_input>
#mockupFigure("Editar produto.png", caption: [Editar produto (administrador)]) <mockup_editar_produto>
#mockupFigure("Remover produto.png", caption: [Remover produto (administrador)])
#mockupFigure("Gerenciar administradores.png", caption: [Gerenciar administradores (Master)])
#mockupFigure("Criar administrador.png", caption: [Criar administrador (Master)])
#mockupFigure("Criar administrador (com input).png", caption: [Criar administrador (com input) (Master)])
#mockupFigure("Editar administrador.png", caption: [Editar administrador (Master)])
#mockupFigure("Remover administrador.png", caption: [Remover administrador (Master)])

#attachment[Código SQL de inicialização do Sistema de Dados] <codigo_sql>

#raw(read("attachments/init.sql"), lang: "sql")

#attachment[Lista exaustiva de páginas implementadas do sistema] <lista_exaustiva_paginas>

#let paginaFigure(name, caption: []) = figure(stroked(image("images/paginas/" + name)), caption: caption, kind: "pagina", supplement: [Página])

#paginaFigure("Leilões.png", caption: [Página implementada dos leilões]) <pagina_leioes>
#paginaFigure("Login.png", caption: [Página implementada do login]) <pagina_login>
#paginaFigure("Registo.png", caption: [Página implementada do registo]) <pagina_registo>
#paginaFigure("Ver detalhes.png", caption: [Página implementada de ver detalhes de produto]) <pagina_ver_detalhes>
#paginaFigure("Ver detalhes (administrador).png", caption: [Página implementada de ver detalhes de produto (administrador)]) <pagina_ver_detalhes_admin>
#paginaFigure("Minhas licitações.png", caption: [Página implementada de Minhas Licitações]) <pagina_minhas_licitacoes>
#paginaFigure("Leilões ganhos.png", caption: [Página implementada de Leilões ganhos]) <pagina_leiloes_ganhos>
#paginaFigure("Meu perfil.png", caption: [Página implementada de Meu Perfil]) <pagina_meu_perfil>
#paginaFigure("Produtos.png", caption: [Página implementada de ver produtos]) <pagina_produtos_admin>
#paginaFigure("Gerenciar administradores.png", caption: [Página implementada de gerenciar administradores]) <pagina_gerenciar_admins>
#paginaFigure("Criar produto.png", caption: [Página implementada de criar produto]) <pagina_criar_produto>
#paginaFigure("Editar administradores.png", caption: [Página implementada editar administradores]) <pagina_editar_admins>