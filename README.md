Documentação do Sistema
Visão Geral
A documentação apresenta um sistema de backend desenvolvido em Node.js e TypeScript, oferecendo APIs para autenticação de usuários, gerenciamento de bibliotecas e funcionalidades adicionais. O sistema emprega várias tecnologias-chave para alcançar seus objetivos.

Tecnologias Utilizadas
Node.js: Plataforma de desenvolvimento JavaScript para criar aplicações server-side eficientes.
TypeScript: Linguagem de programação que adiciona tipagem estática e recursos modernos ao JavaScript.
Express: Framework minimalista para criação de APIs RESTful robustas e escaláveis.
JSON Web Token (JWT): Mecanismo de autenticação baseado em tokens seguro e eficaz.
TypeORM: ORM (Object-Relational Mapping) para mapeamento e gerenciamento de dados no banco de dados.
bcrypt e bcryptjs: Bibliotecas para criptografia de senhas, garantindo segurança das informações.
MySQL e SQLite: Bancos de dados relacionais utilizados para armazenar dados do sistema.
nodemon: Ferramenta para monitoramento de alterações no código e reinício automático do servidor.
Instalação e Execução
Clonagem do Repositório:

sh
Copy code
git clone https://github.com/EndrioAlberton/Tcc-Back.git
cd Tcc-Back
Instalação de Dependências:

sh
Copy code
npm install
Execução do Servidor de Desenvolvimento:

sh
Copy code
npm run dev
Estrutura do Projeto
A organização do projeto é modularizada para facilitar a manutenção e escalabilidade.

src/controllers/: Contém controladores que manipulam as requisições HTTP.
src/models/: Define modelos de dados que representam entidades do sistema.
src/routes/: Define as rotas da API e associa ações aos controladores.
src/services/: Implementa a lógica de negócios, comunicação com o banco de dados, etc.
src/index.ts: Ponto de entrada da aplicação.
Funcionalidades Principais
Autenticação de Usuário:

Autenticação de usuários usando JSON Web Tokens (JWT).
Implementação em AuthController.ts e AuthService.ts.
Senhas são criptografadas usando bcrypt ou bcryptjs antes de serem armazenadas.
Gerenciamento de Bibliotecas:

APIs para gerenciar informações sobre livros, autores, usuários e empréstimos.
Implementação em LibraryController.ts e LibraryService.ts.
Dados armazenados em bancos de dados MySQL ou SQLite usando TypeORM.
Autenticação e Autorização:

Controle de acesso a rotas e recursos baseado em papéis de usuário.
Autenticação e autorização de administradores e usuários regulares.
Empréstimos de Livros:

Funcionalidade para realizar empréstimos e devoluções de livros.
Acompanhamento de datas de devolução e status de empréstimos.
Pesquisa de Livros:

Possibilidade de pesquisar livros por título, autor ou categoria.
Fornecimento de resultados de pesquisa filtrados e relevantes.
Configuração do Banco de Dados
Configure as informações de conexão ao banco de dados no arquivo .env.
Considerações Finais
Esta documentação fornece uma visão abrangente das tecnologias, estrutura do projeto e principais funcionalidades do sistema. Certifique-se de enriquecer cada seção com exemplos, detalhes de implementação e fluxos de trabalho específicos do sistema. Isso garantirá que os desenvolvedores e stakeholders tenham uma compreensão completa do sistema e de suas capacidades
