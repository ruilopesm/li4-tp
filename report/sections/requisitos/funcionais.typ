#import "/utils.typ" : requirement

== Requisitos funcionais

#requirement(
  "Registo na aplicação como licitador", 
  "O utilizador deve registar-se na aplicação para poder aceder a certas funcionalidades, nomeadamente, licitar em leilões, tornando-se num licitador.",
  ("Aquando do registo, o sistema deve solicitar os dados necessários ao utilizador: nome, NIF, email, password e data de nascimento;",
  "O sistema não deve permitir o registo de utilizadores com o mesmo email e/ou NIF;",
  "O sistema não deve permitir o registo de utilizadores com menos de 18 anos de idade, a idade mínima para licitar em leilões;",
  "O sistema deverá armazenar os dados do utilizador em questão.")
)

#requirement(
  "Criação de administradores",
  "Partindo da premissa que já existe um administrador presente no sistema de dados da aplicação, deve ser possível a criação de novos administradores.",
  ("O sistema deverá solicitar, ao administrador, os dados necessários para a criação de um novo administrador: nome, email e password;",
  "O sistema deverá armazenar os dados do administrador.")
)

#requirement(
  "Autenticação na aplicação",
  "O utilizador ou administrador deverá introduzir o seu email e a respetiva password para iniciar sessão na aplicação.",
  "O sistema deve verificar a validade da tentativa de autenticação, verificando se o par email e password inseridos correspondem a algum utilizador ou administrador existente no sistema."
)

#requirement(
  "Término de sessão",
  "O utilizador ou administrador deve conseguir terminar a sua sessão na aplicação.",
  "O sistema deve terminar a sessão do utilizador ou administrador em questão."
)

#requirement(
  "Especificação e criação de leilão",
  "Um administrador deve conseguir criar um leilão de um certo produto.",
  ("Aquando da criação do leilão, o sistema deve solicitar os dados necessários ao administrador: produto a leiloar, valor inicial de licitação e data (com hora) de fim.",
  "Um leilão é composto também por uma data (com hora) de início que, por defeito, é a data em que a criação do leilão ocorre.",
  "Finalmente, um leilão é composto por um estado, que pode tomar um dos seguintes valores: a decorrer, cancelado ou terminado. Por defeito, o estado de um leilão é a decorrer.")
)

#requirement(
  "Listagem de leilões ativos",
  "O utilizador, mesmo que não autenticado, deve conseguir listar todos os leilões ativos.",
  "O sistema deve criar uma lista com todos os leilões ativos no momento, ou seja, cuja data de início é menor ou igual à data atual. Esta lista deve ser passível de filtragem e pesquisa."
)

#requirement(
  "Carregamento de fundos",
  "Um utilizador deve conseguir carregar fundos para a sua conta, com o objetivo de licitar em leilões.",
  "O sistema deve fazer uma distinção entre fundos livres e fundos pendentes. Por defeito, o carregamento de fundos afeta o valor dos fundos livres, aumentando-o."
)

#requirement(
  "Levantamento de fundos",
  "Um utilizador deve conseguir levantar fundos da sua conta, com o objetivo de os transferir para a sua conta bancária.",
  "O sistema deve subtrair o valor do levantamento aos fundos livres do utilizador."
)

#requirement(
  "Licitação num leilão",
  "Um utilizador deve conseguir efetuar uma licitação num leilão que esteja a decorrer.",
  ("Durante a visualização de um leilão, deve ser possível um utilizador licitar no mesmo.", 
  [O utilizador apenas poderá licitar se tiver fundos livres suficientes na sua conta superiores à da licitação mais alta. Caso a licitação mais alta seja da sua autoria, basta ter a diferença entre essa mesma licitação e a nova em fundos livres;],
  [Após a licitação, os fundos livres do utilizador são subtraídos e passam a ser fundos pendentes. A licitação anterior, a mais alta até agora, é _anulada_ e os fundos referentes à mesma são restaurados na conta do licitante anterior, passando a serem contabilizados como fundos livres.])
)

#requirement(
  "Listagem de leilões licitados",
  "O utilizador, apenas se autenticado, deve conseguir listar, em tempo real, os leilões onde licitou.",
  "O sistema deve criar uma lista, passível de filtragem e pesquisa, de todos os leilões licitados."
)

#requirement(
  "Histórico de licitações num leilão",
  "O utilizador, apenas se autenticado, deve conseguir visualizar o histórico de licitações num leilão.",
  "Durante a visualização de um leilão, o sistema deve criar uma lista, ordenada cronologicamente, com todas as licitações efetuadas no mesmo."
)

#requirement(
  "Listagem de leilões ganhos",
  "O utilizador, apenas se autenticado, deve conseguir listar os leilões que ganhou.",
  "O sistema deve criar uma lista, passível de filtragem e pesquisa, de todos os leilões ganhos."
)

#requirement(
  "Cancelamento de leilão",
  "Um administrador deve conseguir cancelamento um leilão.",
  ("Durante a visualização de um leilão, deve ser possível um administrador cancelar o mesmo;",
  [O estado do leilão passa a cancelado.],
  "O sistema não deverá, nunca, penalizar os envolvidos no leilão. Assim, o sistema deverá transferir os fundos parciais do atual vencedor para os fundos livres do mesmo.")
)

#requirement(
  "Especificação e criação de um produto",
  "Um administrador deve conseguir criar um produto.",
  ("Aquando da criação do produto, o sistema deve solicitar os dados necessários ao administrador;",
  "Um produto é composto obrigatoriamente por um nome, modelo, estado e condição. Opcionalmente por uma descrição e uma ou mais imagens;",
  "O estado de um produto pode ser recondicionado, usado ou devolvido;",
  "A condição de um produto pode ser satisfatória, muito boa ou excelente.")
)

#requirement(
  "Especificação do modelo de um produto",
  "Um administrador deve conseguir especificar um modelo de um produto.",
  ("O modelo de um produto é composto obrigatoriamente por um identificador e opcionalmente por uma cor e quantidade de armazenamento;",
  "Todos os modelos são providenciados por um serviço externo ao sistema, mas pertencente à Maçã.")
)

#requirement(
  "Listagem de produtos",
  "Um administrador deve conseguir listar todos os produtos.",
  "O sistema deve criar uma lista, passível de filtragem e pesquisa, de todos os produtos."
)

#requirement(
  "Edição de um produto",
  "Um administrador deve conseguir editar um produto.",
  "O sistema deve armazenar as alterações."
)

#requirement(
  "Remoção de um produto",
  "Um administrador deve conseguir remover um produto.",
  "O sistema deve remover o produto em questão."
)

#requirement(
  "Listagem de administradores",
  "O administrador principal deve conseguir listar todos os outros administradores.",
  "O sistema deve criar uma lista de todos os administradores."
)

#requirement(
  "Edição de um administrador",
  "O administrador principal deve conseguir editar outro administrador.",
  "O sistema deve armazenar as alterações."
)

#requirement(
  "Remoção de um administrador",
  "Um administrador deve conseguir remover outro administrador.",
  "O sistema deve remover o administrador em questão."
)
