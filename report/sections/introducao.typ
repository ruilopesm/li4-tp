#import "/utils.typ": section

= Definição do Sistema <definicao_sistema>

== Estrutura do relatório

#[

#show ref: it => {
  locate(loc => {
    let el = it.element
    link(it.element.location(), el.body)
  })
}

Inicialmente, no capítulo @definicao_sistema, é feita uma pequena descrição do sistema a ser desenvolvido, enunciando a sua contextualização, fundamentação, classificação, objetivos, viabilidade, recursos a utilizar, equipa de trabalho, plano de execução de trabalho e métricas de sucesso.

No capítulo @levantamento_requisitos, aborda-se o levantamento e análise de requisitos do sistema, onde são identificados os requisitos funcionais e não funcionais.

Em @especificacao, o software é especificado e modelado, através de modelos de domínio, diagramas de casos de uso e a sua especificação detalhada, diagramas de atividades e máquinas de estado.

No capítulo seguinte @concecao_sistema_dados, enuncia-se o modelo de dados que a plataforma irá utilizar, através de um diagrama de modelo lógico de dados, seguido da sua especificação detalhada.

No capítulo @esbocos_sistema, é apresentada a logo da plataforma, seguida de uma palete de cores usada para a realização dos vários esboços das interfaces do sistema, que são apresentados de seguida.

Em @manual_aplicacao são apresentadas as instruções de utilização da plataforma.

Já no capítulo @implementacao_aplicacao são apresentados os detalhes da implementação da plataforma, nomeadamente as tecnologias utilizadas, a arquitetura do sistema, a estrutura de dados e a segurança.

No penúltimo capítulo @analise_avaliacao_aplicacao, é feita uma análise e avaliação da aplicação desenvolvida onde se compara os resultados obtidos com os objetivos definidos inicialmente.

Por fim, no capítulo @conclusao, é feita uma pequena reflexão sobre o trabalho realizado, onde são apresentadas as dificuldades encontradas e as melhorias que poderiam ser feitas.
]

== Contextualização

A empresa Maçã encontra-se assente no mercado tecnológico há longos anos. A mesma cria e comercializa dispositivos tecnológicos como _smartphones_, computadores e acessórios para os mesmos. As suas operações são muito rentáveis e têm muito sucesso comercial. 

Ainda assim, por vezes, o cliente não se encontra satisfeito com a sua compra ou o produto tem algum defeito, o que leva à sua devolução. Neste sentido, a empresa Maçã é muito cuidadosa com os seus clientes, garantido sempre a máxima qualidade na interação empresa-cliente. \
Além disso, a Maçã também tem um programa de retoma, onde é possível entregar o seu dispositivo antigo da marca em troca de um desconto na compra de um produto cujo modelo é mais recente e avançado tecnologicamente.

A empresa armazena todos estes aparelhos, contudo não podem ser revendidos da mesma forma e preço que os dispositivos novos.

== Fundamentação

De modo a evitar que esse stock extra seja deitado fora, a Maçã quer desenvolver uma plataforma onde este excedentário é leiloado, diminuindo o lixo eletrónico e ainda obtendo retorno económico.

Nesta plataforma, a empresa coloca os artigos que pretende leiloar e de após um determinado período de tempo o leilão termina e o licitador com a maior proposta vence e passa a ser proprietária do produto.

== Classificação do sistema

Podemos então classificar o sistema como um sistema de leilões online, que estará disponível apenas em Portugal, com o objetivo de leiloar produtos tecnológicos usados que pertencem à empresa Maçã. Por ser um sistema de leilões, teremos que limitar a idade mínima de utilização a 18 anos.

#figure(table(
  columns: (0.5fr, 1fr),
  inset: 7pt,
  fill: (c, v) => if c == 0 { gray.lighten(50%) },
  stroke: (dash: "dashed"),
  [*Nome*], [Maçã],
  [*Categoria*], [Leilões online],
  [*Idiomas disponíveis*], [Português],
  [*Faixa Etária*], [18+]
), caption: [Classificação do sistema])

== Objetivos

Com esta plataforma de leilões online, a Maçã pretende alcançar alguns objetivos, nomeadamente:

- Melhorar ainda mais a sua atividade económica, rentabilizando a venda de produtos que outrora seriam apenas excedentário
- Diminuir a sua pegada ecológica, reutilizando, para venda, produtos que outrora seriam apenas lixo eletrónico
- Democratizar o acesso à tecnologia, oferecendo, com custo mais baixo, tecnologia de alta qualidade a clientes com menos posses económicas
- Fomentar a ligação empresa-cliente, criando e oferecendo uma solução de leilões online cujo uso seja muito intuitivo
- Melhorar a imagem pública da marca, por ser vista como mais ecológica e amiga do ambiente

== Viabilidade

Esta plataforma apenas comercializará stock excedentário que não poderia ser vendido como novo, que já pertence à empresa e tem um custo de aquisição nulo ou negligível, logo quase todo o valor de venda será lucro.

Os únicos custos significativos seriam a logística da entrega, e o desenvolvimento, manutenção e operação da plataforma, sendo estes últimos maioritariamente fixos, pois é necessária a mesma plataforma para comercializar 10 ou 1000 produtos por dia, sendo que praticamente apenas os custos com hospedagem crescem linearmente.

Sendo a Maçã uma empresa com alto volume de negócios, também obtém um grande número de produtos devolvidos e de retoma. Como a aquisição de produtos (tradicionalmente a maior despesa neste ramo) é um subproduto inerente das operações principais da empresa, os únicos custos reais para além da reparação dos dispositivos com defeito são relacionados com a criação da plataforma, tendo esta operação um potencial de operar com margens de lucro elevadas. 

Dada a escala prevista do serviço e as margens em questão, achamos estes custos suportáveis e a operação rentável. Além do mais, ainda permite à Maçã comercializar-se como sustentável, conferindo uma maior reputação à empresa, mesmo em quem não utiliza este serviço da empresa. Deste modo, declaramos o serviço _*viável*_.

== Recursos a utilizar

Os recursos necessários ao planeamento e desenvolvimento de toda a plataforma, podem ser divididos em duas categorias, sendo elas: _hardware_ e _software_. A primeira diz respeito a todas as infraestruturas e equipamentos necessários para o bom desenvolvimento da plataforma, tanto como para uma garantia de que a plataforma irá funcionar sem problemas, futuramente. A segunda refere-se a todos os programas inerentes ao processo de desenvolvimento, por parte dos desenvolvedores, testadores e administradores.

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

== Equipa de trabalho
Para o bom desenvolvimento do projeto, foi definida uma equipa de trabalho composta por vários elementos com funções em diferentes áreas, em que a colaboração de todos foi essencial. Além disso, foi efetuada uma divisão entre _pessoal_ interno e externo.

*Interno:*
- Coordenador de projeto, responsável por liderar e coordenar o desenvolvimento, certificando-se que o projeto está de acordo com os requisitos e garantindo a qualidade do trabalho.

- Analista, responsável por analisar os requisitos, criar especificações e garantir que a solução é satisfatória.

- Desenvolvedores:
  + _Web_, para desenvolver o núcleo da plataforma de leilões.
  + Integração, para integrar a base de dados num programa e criar a ligação entre o sistema e o cliente _Web_.

- Designers, responsáveis por determinar o estilo da aplicação e desenhar os vários esboços da aplicação.

- Testadores, cujo objetivo é testar o produto e certificar que não existem _bugs_ ou inconsistências com os requisitos.

#pagebreak()
*Externo:*
- Organizações ambientais, como forma de certificar a plataforma como uma alternativa mais ecológica na compra de um produto tecnológico.

- Legisladores, como forma de certificar que a plataforma cumpre todas as leis de proteção de dados.

- Administradores:
  + Bases de dados, para certificar-se que a base de dados se mantém segura, fazer _backup_ dos dados e garantir a disponibilidade do sistema.
  + Sistemas, para certificar-se que os servidores onde a plataforma está a ser hospedada funcionam corretamente e garantir a disponibilidade do sistema.

== Plano de execução de trabalho

Com o intuito de preparar e planear o desenvolvimento de todo o projeto, foi delineado um diagrama de Gantt, que pode ser consultado nos anexos do presente documento (@gantt). A escolha deste tipo de diagrama, deve-se a vários fatores, entre eles: a clara visualização, em cronograma, das diversas tarefas, a facilidade de alocação de recursos humanos a cada tarefa e, finalmente, a possibilidade de planeamento a longo prazo.
Este está dividido em três fases: definição, especificação e implementação. A primeira consiste na definição do sistema, a segunda na especificação do sistema e a terceira na implementação do sistema.

== Métricas de sucesso

Uma das métricas de sucesso que, na nossa visão, é um indicador significativamente mais informativo que o número de utilizador ativos mensalmente, embora este seja também um indicador valioso, é a venda total de dispositivos através dos leilões suscitados pela plataforma. Esta métrica acaba por influenciar, de forma positiva, a pegada ecológica que a Maçã tem no planeta, que pode, também, ser utilizada como uma métrica de sucesso.

#pagebreak()
== Maqueta do sistema 

#figure(image("/images/Maqueta do sistema.png", width: 80%), caption: [Maqueta do sistema])
