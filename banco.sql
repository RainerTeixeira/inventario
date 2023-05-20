-- Criação da tabela "Usuarios"
CREATE TABLE Usuarios (
id INT PRIMARY KEY,
nome VARCHAR(100),
setor VARCHAR(50),
nivel_permissao ENUM('Administrador', 'Usuário') NOT NULL,
senha VARCHAR(255)
);

-- Criação da tabela "Topicos"
CREATE TABLE Topicos (
id INT PRIMARY KEY,
titulo VARCHAR(100),
descricao VARCHAR(255),
conteudo TEXT,
imagem_url VARCHAR(255),
video_url VARCHAR(255),
setor_permitido VARCHAR(50),
topico_pai_id INT,
FOREIGN KEY (topico_pai_id) REFERENCES Topicos(id)
);

-- Inserção de dados simulados na tabela "Usuarios"
INSERT INTO Usuarios (id, nome, setor, nivel_permissao, senha)
VALUES
(1, 'João', 'TI', 'Administrador', 'senha1'),
(2, 'Maria', 'RH', 'Usuário', 'senha2'),
(3, 'Pedro', 'Compras', 'Usuário', 'senha3'),
(4, 'Ana', 'Estoque', 'Usuário', 'senha4'),
(5, 'Carlos', 'Faturamento', 'Usuário', 'senha5'),
(6, 'Fernanda', 'Televendas', 'Usuário', 'senha6'),
(7, 'Luis', 'Vendedores', 'Usuário', 'senha7');


-- Inserção de dados simulados na tabela "Topicos"
INSERT INTO Topicos (id, titulo, descricao, conteudo, imagem_url, video_url, setor_permitido, topico_pai_id)
VALUES
(1, '1. Recrutamento e Seleção', 'Processo de Recrutamento', 'O processo de recrutamento envolve a divulgação de vagas, triagem de currículos, entrevistas e seleção dos candidatos adequados.', '', '', 'RH', NULL),
(2, '1.1 Subtópico', 'Descrição do Subtópico', 'Conteúdo do Subtópico', 'url_imagem2.jpg', 'url_video2.mp4', 'RH', 1),
(3, '1.2 Subtópico', 'Descrição do Subtópico', 'Conteúdo do Subtópico', 'url_imagem3.jpg', 'url_video3.mp4', 'RH', 1),
(4, '2. Segurança da Informação', 'Políticas de Segurança', 'As políticas de segurança da informação visam proteger os dados e informações da empresa, abrangendo medidas como senhas seguras, controle de acesso e criptografia.', '', '', 'TI', NULL),
(5, '2.1 Subtópico', 'Descrição do Subtópico', 'Conteúdo do Subtópico', 'url_imagem5.jpg', 'url_video5.mp4', 'TI', 4),
(6, '3. Fornecedores', 'Seleção de Fornecedores', 'A seleção de fornecedores envolve a análise de qualidade, prazos de entrega, preços competitivos e histórico de fornecimento.', '', '', 'Compras', NULL),
(7, '3.1 Negociação com Fornecedores', 'Estratégias de Negociação', 'As estratégias de negociação com fornecedores visam obter condições comerciais favoráveis, como descontos, prazos de pagamento e contratos vantajosos.', '', '', 'Compras', 6),
(8, '3.1.1 Estabelecimento de Parcerias', 'Critérios para Parcerias', 'Os critérios para estabelecer parcerias com fornecedores incluem a avaliação de reputação, capacidade de entrega e alinhamento com os valores da empresa.', '', '', 'Compras', 7),
(9, '3.1.2 Avaliação de Desempenho', 'Monitoramento de Fornecedores', 'O monitoramento de desempenho dos fornecedores é realizado para garantir a qualidade dos produtos ou serviços, cumprimento de prazos e atendimento às expectativas da empresa.', '', '', 'Compras', 7),
(10, '3.1.2.1 Indicadores de Desempenho', 'Métricas de Avaliação', 'Os indicadores de desempenho permitem medir e acompanhar o desempenho dos fornecedores, utilizando métricas como qualidade, tempo de entrega e índice de satisfação.', '', '', 'Compras', 9),
(11, '3.1.2.2 Planos de Melhoria', 'Ações de Aprimoramento', 'Os planos de melhoria são elaborados com base nos resultados da avaliação de desempenho, visando aprimorar a performance dos fornecedores por meio de ações corretivas e preventivas.', '', '', 'Compras', 9),
(12, '4. Controle de Estoque', 'Inventário de Estoque', 'O inventário de estoque consiste na contagem física dos produtos disponíveis, verificação de validade e identificação de possíveis divergências com o sistema de gestão.', '', '', 'Estoque', NULL),
(13, '5. Faturamento Eletrônico', 'Emissão de Notas Fiscais Eletrônicas', 'A emissão de notas fiscais eletrônicas é realizada por meio de sistemas informatizados, seguindo as exigências legais e garantindo a correta emissão e envio aos clientes.', '', '', 'Faturamento', NULL),
(14, '6. Abordagem de Vendas por Telefone', 'Técnicas de Abordagem', 'As técnicas de abordagem de vendas por telefone incluem a identificação do cliente, argumentação persuasiva e tratamento de objeções para conquistar a venda.', '', '', 'Televendas', NULL),
(15, '7. Negociação de Vendas', 'Técnicas de Negociação', 'As técnicas de negociação de vendas envolvem o entendimento das necessidades do cliente, apresentação de propostas personalizadas e fechamento de acordos vantajosos.', '', '', 'Vendedores', NULL);


-- Consulta de exemplo para obter os tópicos permitidos para um usuário específico
SELECT T.id, T.titulo, T.descricao, T.conteudo
FROM Topicos T
INNER JOIN Usuarios U ON (T.setor_permitido = U.setor OR U.nivel_permissao = 'Administrador')
WHERE U.id = 2; -- ID do usuário específico

-- Consulta de exemplo para obter os sub-tópicos de um tópico principal
SELECT T.id, T.titulo, T.descricao, T.conteudo
FROM Topicos T
WHERE T.topico_pai_id = 1; -- ID do tópico principal

-- Consulta de exemplo para obter o tópico pai de um sub-tópico
SELECT T.id, T.titulo, T.descricao, T.conteudo
FROM Topicos T
WHERE T.id = 2; -- ID do sub-tópico

-- Consulta de exemplo para obter o usuário responsável por um tópico
SELECT U.id, U.nome, U.setor, U.nivel_permissao
FROM Usuarios U
INNER JOIN Topicos T ON T.setor_permitido = U.setor
WHERE T.id = 1; -- ID do tópico

-- Consulta de exemplo para obter os tópicos permitidos para um setor específico
SELECT T.id, T.titulo, T.descricao, T.conteudo
FROM Topicos T
WHERE T.setor_permitido = 'Compras'; -- Setor específico

-- Consulta de exemplo para pesquisar qualquer assunto dentro dos tópicos
SELECT T.id, T.titulo, T.descricao, T.conteudo
FROM Topicos T
WHERE T.titulo LIKE '%termo_de_pesquisa%' OR T.descricao LIKE '%termo_de_pesquisa%' OR T.conteudo LIKE '%termo_de_pesquisa%';
