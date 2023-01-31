-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Jan-2023 às 05:01
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cdb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `publisher` varchar(50) NOT NULL,
  `edition` int(2) NOT NULL,
  `topic` varchar(30) NOT NULL,
  `year_published` int(4) NOT NULL,
  `description` text NOT NULL,
  `name_image` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `libraryId` int(11) DEFAULT NULL,
  `loanId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `books`
--

INSERT INTO `books` (`id`, `isbn`, `title`, `author`, `publisher`, `edition`, `topic`, `year_published`, `description`, `name_image`, `url`, `status`, `created_at`, `libraryId`, `loanId`) VALUES
(18, '', '', '', '', 1, '', 0, '', '', '', 1, '2023-01-20 11:04:13.379000', 3, NULL),
(19, '1', '1', '1', '1', 1, '1', 0, '', '', '', 1, '2023-01-20 11:19:38.430902', 3, NULL),
(20, '9788535929881', 'Cosmos ', 'Carl Sagan', 'Companhia das Letras', 1, 'Astronomia', 2017, 'Escrito por um dos maiores divulgadores de ciência do século XX, Cosmos retraça 14 bilhões de anos de evolução cósmica, explorando tópicos como a origem da vida, o cérebro humano, hieróglifos egípcios, missões espaciais, a morte do sol, a evolução das galáxias e as forças e indivíduos que ajudaram a moldar a ciência moderna. Numa prosa transparente, Carl Sagan revela os segredos do planeta azul habitado por uma forma de vida que apenas começa a descobrir sua própria identidade e a se aventurar no vasto oceano do espaço sideral. Aqui, o tratamento dos temas científicos está sempre imbricado com outros campos de estudo tradicionais, como história, antropologia, arte e filosofia. Publicado pela primeira vez em 1980, Cosmos reúne alguns dos conhecimentos mais avançados da época sobre a natureza, a vida e o Universo ― e se mantém até hoje como uma das mais importantes obras de divulgação científica da história. Embora diversas descobertas fascinantes tenham ocorrido nos últimos quarenta anos, o tema central deste livro nunca estará desatualizado: nosso fascínio pelo conhecimento e a prática da ciência como atividade cultural.', '9da7cf26-f406-46aa-b384-a29a72f23571', 'https://firebasestorage.googleapis.com/v0/b/tcc-images-eefb9.appspot.com/o/book_image%2F9da7cf26-f406-46aa-b384-a29a72f23571?alt=media&token=4b88e372-e36c-47f9-9e9b-57bfd95eab03', 1, '2023-01-22 08:30:42.836000', 1, NULL),
(21, '9788535909555', 'A revolução dos bichos: Um conto de fada', 'George Orwell ', 'Companhia das Letras', 10, 'Clássicos de Ficção', 2007, 'Verdadeiro clássico moderno, concebido por um dos mais influentes escritores do século XX, A revolução dos bichos é uma fábula sobre o poder. Narra a insurreição dos animais de uma granja contra seus donos. Progressivamente, porém, a revolução degenera nu', '6c83ca55-2779-4ace-8881-1e7644372445', 'https://firebasestorage.googleapis.com/v0/b/tcc-images-eefb9.appspot.com/o/book_image%2F6c83ca55-2779-4ace-8881-1e7644372445?alt=media&token=10cb7d1b-f6cb-4840-9b1a-4c1d6c1f7dd7', 1, '2023-01-22 08:35:21.714142', 1, NULL),
(22, '9788501117847', 'Verity Capa', 'Colleen Hoover', 'Galera', 19, 'Livros de Suspenses de Espiona', 2020, 'Um casal apaixonado. Uma intrusa. Três mentes doentias. Finalista do prêmio Goodreads como melhor romance de 2019, Verity é o primeiro thriller de Colleen Hoover e deixa os leitores envolvidos do começo ao fim.\n\nHoover é um fenômeno editorial inegável. Acumulando não só milhões de visualizações no TikTok, mas também milhões de exemplares vendidos, ela é a autora mais vendida no Brasil, com suas obras emocionantes que já encantaram milhares de leitores no mundo todo.\n\n \n\nVerity Crawford é a autora best-seller por trás de uma série de sucesso. Ela está no auge de sua carreira, aclamada pela crítica e pelo público, no entanto, um súbito e terrível acidente acaba interrompendo suas atividades, deixando-a sem condições de concluir a história... E é nessa complexa circunstância que surge Lowen Ashleigh, uma escritora à beira da falência convidada a escrever, sob um pseudônimo, os três livros restantes da já consolidada série.\n\nPara que consiga entender melhor o processo criativo de Verity com relação aos livros publicados e, ainda, tentar descobrir seus possíveis planos para os próximos, Lowen decide passar alguns dias na casa dos Crawford, imersa no caótico escritório de Verity - e, lá, encontra uma espécie de autobiografia onde a escritora narra os fatos acontecidos desde o dia em que conhece Jeremy, seu marido, até os instantes imediatamente anteriores a seu acidente - incluindo sua perspectiva sobre as tragédias ocorridas às filhas do casal.\n\nQuanto mais o tempo passa, mais Lowen se percebe envolvida em uma confusa rede de mentiras e segredos, e, lentamente, adquire sua própria posição no jogo psicológico que rodeia aquela casa. Emocional e fisicamente atraída por Jeremy, ela precisa decidir: expor uma versão que nem ele conhece sobre a própria esposa ou manter o sigilo dos escritos de Verity?\n\nEm Verity, Colleen Hoover se afasta do estilo que a consagrou, os romances, para se aventurar em um suspense psicológico que deixou todo o mercado editorial sem palavras de tão avassalador. Através de uma narrativa perturbadora e chocante, Verity explora o lado mais sombrio das relações humanas deixando uma surpresinha chocante no final.\n\n ', '55db67da-e68c-415d-89fa-fb753a5876ad', 'https://firebasestorage.googleapis.com/v0/b/tcc-images-eefb9.appspot.com/o/book_image%2F55db67da-e68c-415d-89fa-fb753a5876ad?alt=media&token=668e60df-9dbf-4519-ac03-a82d2862385b', 1, '2023-01-22 08:55:25.704555', 1, NULL),
(23, '9786555872552', 'A vida invisível de Addie LaRue', 'V.E. Schwab', 'Galera', 7, 'Livros de Fantasia e Terror pa', 2021, 'Uma vida que ninguém lembra. Um livro que ninguém esquece.\n\nEm A vida invisível de Addie LaRue, o aguardado best-seller de V.E. Schwab, conheça Addie e se perca em sua vida invisível ― porém memorável.\n\n \n\nFrança: 1714. Addie LaRue não queria pertercer a ninguém ou a lugar nenhum. Em um momento de desespero, a jovem faz um pacto: a vida eterna, sob a condição de ser esquecida por quem a conhecer. Um piscar de olhos, e, como um sopro, Addie se vai. Uma virada de costas, e sua existência se dissipa na memória de todos.\n\nApós tanto tempo vivendo uma existência deslumbrante, aproveitando a vida de todas as formas, fazendo uso de tantos artifícios quanto fosse possível e viajando pelo tempo e espaço, através dos séculos e continentes, da história e da arte, Addie entende seus limites e descobre ― apesar de fadada ao esquecimento ― até onde é capaz de ir para deixar sua marca no mundo.\n\nTrezentos anos depois, em uma livraria, um acontecimento inesperado: Addie LaRue esbarra com um rapaz.\n\nEle enuncia cinco palavras.\n\nCinco palavras capazes de colocar a vida que conhecia abaixo:\n\nEu me lembro de você.\n\nUma jornada inspirada no mito faustiano sobre busca e perda, eternidade e finitude e, acima de tudo, uma questão: até onde se vai para alcançar a liberdade? Best-seller do The New York Times e recomendado pelo Entertainment Weekly, A vida invisível de Addie LaRue é um livro inesquecível e que colocou V.E. Schwab entre as principais autoras de fantasia da atualidade.\n\n \n\n“Para alguém fadada ao esquecimento, AddieLaRue se provou uma personagem deliciosamente inesquecível, e sua história é uma celebração da imortalidade.” - Neil Gaiman\n\n“Perfeitamente equilibrada entre escuridão e luz, mito e realidade. Essa história é, ironicamente, inesquecível.” - Alix E. Harrow\n\n“A vida invisível de Addie LaRue irá enfeitiçar os leitores da mesma forma que a protagonista é enfeitiçada.” - Naomi Novak', '92ce3d5a-ee7e-4c01-a222-a933d9fa70b6', 'https://firebasestorage.googleapis.com/v0/b/tcc-images-eefb9.appspot.com/o/book_image%2F92ce3d5a-ee7e-4c01-a222-a933d9fa70b6?alt=media&token=91a3758f-1a4a-4580-9bcc-9a75078e4730', 1, '2023-01-22 08:57:10.170568', 1, NULL),
(24, '9786558380542', 'A Biblioteca da Meia-Noite', 'Matt Haig', 'Bertrand Brasil', 8, 'Viagens pelo Tempo Romance', 2021, 'Aos 35 anos, Nora Seed é uma mulher cheia de talentos e poucas conquistas. Arrependida das escolhas que fez no passado, ela vive se perguntando o que poderia ter acontecido caso tivesse vivido de maneira diferente. Após ser demitida e seu gato ser atropelado, Nora vê pouco sentido em sua existência e decide colocar um ponto final em tudo. Porém, quando se vê na Biblioteca da Meia-Noite, Nora ganha uma oportunidade única de viver todas as vidas que poderia ter vivido.\n\nNeste lugar entre a vida e a morte, e graças à ajuda de uma velha amiga, Nora pode, finalmente, se mudar para a Austrália, reatar relacionamentos antigos – ou começar outros –, ser uma estrela do rock, uma glaciologista, uma nadadora olímpica... enfim, as opções são infinitas. Mas será que alguma dessas outras vidas é realmente melhor do que a que ela já tem?\n\nEm A Biblioteca da Meia-Noite, Nora Seed se vê exatamente na situação pela qual todos gostaríamos de poder passar: voltar no tempo e desfazer algo de que nos arrependemos. Diante dessa possibilidade, Nora faz um mergulho interior viajando pelos livros da Biblioteca da Meia-Noite até entender o que é verdadeiramente importante na vida e o que faz, de fato, com que ela valha a pena ser vivida.\n\n \n\n“Uma celebração entusiástica do poder que os livros têm de mudar vidas.” – Sunday Times\n\n“Um cenário de possibilidades ilimitadas, de novos caminhos trilhados, de novas vidas vividas, de um mundo totalmente diferente disponível para nós de alguma forma, em algum lugar, pode ser exatamente do que precisamos nesses tempos difíceis e turbulentos.” – The New York Times\n\n“Um romance extremamente original e instigante sobre a importância de valorizar a vida que você tem.” – Independent\n\n“Instigante e inspirador. Explora a nossa relação com o arrependimento e com o que realmente faz uma vida ser perfeita.” – Harper’s Bazaar\n\n“Uma história sobre segundas chances e viver com arrependimentos. Muito envolvente.” – Stylist\n\n“Eu amei A Biblioteca da Meia-Noite. Ele condensa coisas importantes e tristes – morte, saúde mental, filosofia existencial – em um livro excepcional, prazeroso e de aquecer o coração.” – Pandora Sykes', '7c0b8655-f7b3-41bf-9a0c-4d45504ac840', 'https://firebasestorage.googleapis.com/v0/b/tcc-images-eefb9.appspot.com/o/book_image%2F7c0b8655-f7b3-41bf-9a0c-4d45504ac840?alt=media&token=69c192b0-d585-4d5d-845a-23cf7bd554f1', 1, '2023-01-22 08:59:16.888259', 1, NULL),
(25, '9786555392593', 'O Efeito Frankenstein', 'O Efeito Frankenstein', 'Melhoramentos', 1, 'Romance para Adolescentes: Par', 2021, 'Uma paixão incontrolável toma conta de Max e Nora. Poderia ser uma história de amor, como muitas outras, mas... eles pertencem a séculos diferentes. Max vive em 1781 e Nora, em 2019.\n\nEm O Efeito Frankenstein, romance ganhador do prêmio espanhol edebé de Literatura Juvenil, a autora Elia Barceló coloca à prova a ficção e a realidade em uma contundente ficção científica cheia de debates sobre nossas ações, escolhas e direitos. Tudo porque, para existir, a aventura romântica de Max e Nora precisará superar o choque de costumes e o impacto da Revolução Francesa, além de se entrelaçar com uma das histórias mais famosas da literatura mundial.\n\nAssim como Mary Shelley, a mente por trás do lendário Frankenstein, Nora terá de se rebelar contra a sociedade conservadora e machista da época a que agora pertence. Só assim será capaz de viver plenamente sua história ao lado do novo amor e poderá entender como a criatura de Frankenstein, até então presa nas páginas dos livros da época em que vivia, está, agora, conectada a ela.', 'f8a5ba68-4f37-4ae5-b905-000fe4ffbcfe', 'https://firebasestorage.googleapis.com/v0/b/tcc-images-eefb9.appspot.com/o/book_image%2Ff8a5ba68-4f37-4ae5-b905-000fe4ffbcfe?alt=media&token=07c31965-95c4-4359-9e62-7e2fc8ce7839', 1, '2023-01-22 09:03:54.153547', 1, NULL),
(26, '9788595084759', 'O Senhor dos Anéis: A Sociedade do Anel', ' J.R.R. Tolkien', 'HarperCollins', 1, 'Fantasia Épica', 2019, 'O volume inicial de O Senhor dos Anéis, lançado originalmente em julho de 1954, foi o primeiro grande épico de fantasia moderno, conquistando milhões de leitores e se tornando o padrão de referência para todas as outras obras do gênero até hoje. A imaginação prodigiosa de J.R.R. Tolkien e seu conhecimento profundo das antigas mitologias da Europa permitiram que ele criasse um universo tão complexo e convincente quanto o mundo real.\n\nA Sociedade do Anel começa no Condado, a região rural do oeste da Terra-média onde vivem os diminutos e pacatos hobbits. Bilbo Bolseiro, um dos raros aventureiros desse povo, cujas peripécias foram contadas em O Hobbit, resolve ir embora do Condado e deixa sua considerável herança nas mãos de seu jovem parente Frodo.\n\nO mais importante legado de Bilbo é o anel mágico que costumava usar para se tornar invisível. No entanto, o mago Gandalf, companheiro de aventuras do velho hobbit, revela a Frodo que o objeto é o Um Anel, a raiz do poder demoníaco de Sauron, o Senhor Sombrio, que deseja escravizar todos os povos da Terra-média. A única maneira de eliminar a ameaça de Sauron é destruir o Um Anel nas entranhas da própria montanha de fogo onde foi forjado.\n\nA revelação faz com que Frodo e seus companheiros hobbits Sam, Merry e Pippin deixem a segurança do Condado e iniciem uma perigosa jornada rumo ao leste. Ao lado de representantes dos outros Povos Livres que resistem ao Senhor Sombrio, eles formam a Sociedade do Anel.\n\nAlguém uma vez disse que o mundo dos leitores de língua inglesa se divide entre os que já leram O Senhor dos Anéis e os que um dia lerão o livro. Com esta nova tradução da obra, o fascínio dessa aventura atemporal ficará ainda mais evidente para os leitores brasileiros, tanto os que já conhecem a saga como os que estão prestes a descobrir seu encanto.', '575eb522-23a3-4cb2-85a9-6f52cca0126a', 'https://firebasestorage.googleapis.com/v0/b/tcc-images-eefb9.appspot.com/o/book_image%2F575eb522-23a3-4cb2-85a9-6f52cca0126a?alt=media&token=291a1a93-a74e-4d33-9d1c-69af0a8375b0', 1, '2023-01-22 09:06:22.175979', 1, NULL),
(27, '9788595084759', 'O Senhor dos Anéis: A Sociedade do Anel', ' J.R.R. Tolkien', 'HarperCollins', 1, 'Fantasia Épica', 2019, 'O volume inicial de O Senhor dos Anéis, lançado originalmente em julho de 1954, foi o primeiro grande épico de fantasia moderno, conquistando milhões de leitores e se tornando o padrão de referência para todas as outras obras do gênero até hoje. A imaginação prodigiosa de J.R.R. Tolkien e seu conhecimento profundo das antigas mitologias da Europa permitiram que ele criasse um universo tão complexo e convincente quanto o mundo real.\n\nA Sociedade do Anel começa no Condado, a região rural do oeste da Terra-média onde vivem os diminutos e pacatos hobbits. Bilbo Bolseiro, um dos raros aventureiros desse povo, cujas peripécias foram contadas em O Hobbit, resolve ir embora do Condado e deixa sua considerável herança nas mãos de seu jovem parente Frodo.\n\nO mais importante legado de Bilbo é o anel mágico que costumava usar para se tornar invisível. No entanto, o mago Gandalf, companheiro de aventuras do velho hobbit, revela a Frodo que o objeto é o Um Anel, a raiz do poder demoníaco de Sauron, o Senhor Sombrio, que deseja escravizar todos os povos da Terra-média. A única maneira de eliminar a ameaça de Sauron é destruir o Um Anel nas entranhas da própria montanha de fogo onde foi forjado.\n\nA revelação faz com que Frodo e seus companheiros hobbits Sam, Merry e Pippin deixem a segurança do Condado e iniciem uma perigosa jornada rumo ao leste. Ao lado de representantes dos outros Povos Livres que resistem ao Senhor Sombrio, eles formam a Sociedade do Anel.\n\nAlguém uma vez disse que o mundo dos leitores de língua inglesa se divide entre os que já leram O Senhor dos Anéis e os que um dia lerão o livro. Com esta nova tradução da obra, o fascínio dessa aventura atemporal ficará ainda mais evidente para os leitores brasileiros, tanto os que já conhecem a saga como os que estão prestes a descobrir seu encanto.', '6b2618f0-bf0a-4621-82ae-04003425a2f2', 'https://firebasestorage.googleapis.com/v0/b/tcc-images-eefb9.appspot.com/o/book_image%2F6b2618f0-bf0a-4621-82ae-04003425a2f2?alt=media&token=2eb8c63b-261e-458b-b517-70d23a213ee9', 1, '2023-01-22 09:06:22.679000', 1, NULL),
(28, '', '', '', '', 1, '', 0, '', '', '', 1, '2023-01-22 10:09:58.988000', 15, NULL),
(29, '', '', '', '', 1, '', 0, '', '', '', 1, '2023-01-22 10:10:01.719000', 15, NULL),
(34, '1111111111111', 'a', 'a', 'a', 1, 'a', 2131, 'a', 'beadd7ed-a0d4-4001-a51f-60915335dd52', 'https://firebasestorage.googleapis.com/v0/b/tcc-images-eefb9.appspot.com/o/book_image%2Fbeadd7ed-a0d4-4001-a51f-60915335dd52?alt=media&token=dc80a0f3-fe8c-4a89-8ecb-f7fa987ee0dc', 1, '2023-01-26 00:53:41.097732', 4, NULL),
(36, '1111111111111', 'a', 'a', 'a', 1, 'a', 2131, 'a', '25c38301-1665-4e25-a9f9-651c81058ee6', 'https://firebasestorage.googleapis.com/v0/b/tcc-images-eefb9.appspot.com/o/book_image%2F25c38301-1665-4e25-a9f9-651c81058ee6?alt=media&token=b49d6b79-9774-43a3-b77b-cb6b1e0456a3', 1, '2023-01-26 11:00:52.885794', 4, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `libraries`
--

CREATE TABLE `libraries` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `state` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `number` varchar(6) NOT NULL,
  `telephone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `libraries`
--

INSERT INTO `libraries` (`id`, `email`, `password`, `nome`, `cep`, `state`, `city`, `district`, `street`, `number`, `telephone`) VALUES
(1, 'primeira@gmail.com', '$2b$10$OgF5RgPrnX.06b8YgUav2Ob.Eq6Ir/tLUh2CEpD3UOkWXwFettsUy', 'Escola', '94135300', 'Rio Grande Do Sul', 'Gravataí', 'Bairro Bom Sucesso', 'Rua Men de Sá', '800', '519999999'),
(3, '1', '$2b$10$OgF5RgPrnX.06b8YgUav2Ob.Eq6Ir/tLUh2CEpD3UOkWXwFettsUy', 'Cristal', '', '', '', '', '', '', ''),
(4, 'admin@gmail.com', '$2b$10$OgF5RgPrnX.06b8YgUav2Ob.Eq6Ir/tLUh2CEpD3UOkWXwFettsUy', 'Real Gabinete Português de Leitura', '', '', '', '', '', '', ''),
(8, '1', '$2b$10$YAXaT2uoD1qpk/lzPkChHepC/8kpKU1X1jz9PBeFLWlZcCZbjhiim', 'Baltimore ', 'dd', 'dawd', 'daw', 'dad', 'ddawda', 'dada', 'd'),
(9, '1', '$2b$10$x1TYetwswhoBBaSEGZC7Iu8cWdtIUDLSYTQLRSgutfftBWrhQMPs2', 'Bytes de Livro', '', '', '', '', '', '', ''),
(10, '', '$2b$10$VcwjHy9N5hPc6qthbCefi.skyMNXQJR8bfMJgoiP4u8ikoQZJ2k6W', 'Leitor de sonhos', '', '', '', '', '', '', ''),
(11, '', '$2b$10$21eHAvyBlck4MxpfHCdh0ODYh3UGa16.5.LdkayoKQNCv.4gY9tFe', 'Leia e sinta', '', '', '', '', '', '', ''),
(12, '', '$2b$10$yAeddmIVTLbdmcL4c6N0h.YTVlge7FJGvlcUmXImHydbI/QKnoGvy', 'Compell Library', '', '', '', '', '', '', ''),
(15, 'a@a.a', '$2b$10$14RfP2FcTCmYSqeRF0WGa.ZRe3fQfvGQTkccYRfkIzCsxlI2CoViO', '', '', '', '', '', '', '', ''),
(16, 'new@gmail.com', '$2b$10$eQ01CcO8pu9P0rJiMlDPZOrFxYXNfzAHLy3ScdiGw85gJkFo0mcVS', 'new', '94135300', 'Rio Grande', 'poa', 'vila', 'lala', '12321', '11111111111'),
(17, 'a@b.b', '$2b$10$aIKsmDCSsC1Q3UNn18I4MuyVfMC0TXoM/NqgdBEqzHVu/QSN0b3u6', '1', '94135300', '1', '1', '1', '1', '111111', '11111111111');

-- --------------------------------------------------------

--
-- Estrutura da tabela `library-joined-reader`
--

CREATE TABLE `library-joined-reader` (
  `librariesId` int(11) NOT NULL,
  `readersId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `library-joined-reader`
--

INSERT INTO `library-joined-reader` (`librariesId`, `readersId`) VALUES
(1, 1),
(1, 12),
(1, 19),
(1, 20),
(1, 21),
(3, 1),
(3, 2),
(15, 1),
(15, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `loans`
--

CREATE TABLE `loans` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `libraryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `readers`
--

CREATE TABLE `readers` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `telphone` varchar(11) NOT NULL,
  `loanIdReader` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `readers`
--

INSERT INTO `readers` (`id`, `email`, `password`, `nome`, `cpf`, `telphone`, `loanIdReader`) VALUES
(1, 'primeiro@gmail.com', '$2b$10$AK/wRCjGKRQefADxKz7XHOjdzwk3CRVdlZI/t.tPQCBoOOirBr0jK', 'Marcelo', '', '', NULL),
(4, '1', '$2b$10$3VgO9e3aZ3reLQUfapK3eu34QxIP.0GuiZfcOxi3hTroFFiirIl4K', 'Eduardo', '', '', NULL),
(8, 'a@a.a', '$2b$10$M9emR1/XOpjCssMTrmuPbOT.iFQ6VNfKxiYmlzjsBrXpttGViCTFG', 'Simone', '', '', NULL),
(12, 'b@b.baa', '12345678', 'Bruno', '', '', NULL),
(19, 'primeira@gmail.com', '$2b$10$lB8Nh9K7xUX9.CPoKj5mJuQtJuUdLDSzFcMfbjcIzlFeu/hyGsDcm', 'Carlos Eduardo', '1', '1', NULL),
(20, 'a@a.a', '$2b$10$Ao2LRaPVSKj63S4vsE3Zc.F4YAJgsyR9oVEsY9Q1tsKK9SrHYtYz6', 'Leonardo', '', '', NULL),
(21, 'segunda@gmail.com', '$2b$10$VkOLVZVgAcdLB/vEvnifyuzWvdJFtWCQz34.EwskNnCKWFytnNlqi', 'Sila', '', '', NULL),
(22, 'endrio.alberton@gmail.com', '$2b$10$DrIRHeDzcvIDv7hpGUqiVuorIGu1mWIkbmKHRMD0GoE.3kyPss806', 'Endrio', '11111111111', '51985092381', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `REL_ad5e91254a2b0f4413cbed7e4e` (`loanId`);

--
-- Índices para tabela `libraries`
--
ALTER TABLE `libraries`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `library-joined-reader`
--
ALTER TABLE `library-joined-reader`
  ADD PRIMARY KEY (`librariesId`,`readersId`),
  ADD KEY `IDX_fed0b8205cf4f3193784dc8abd` (`librariesId`),
  ADD KEY `IDX_0751d968c83afacac03a77f505` (`readersId`);

--
-- Índices para tabela `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `readers`
--
ALTER TABLE `readers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `libraries`
--
ALTER TABLE `libraries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `readers`
--
ALTER TABLE `readers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
