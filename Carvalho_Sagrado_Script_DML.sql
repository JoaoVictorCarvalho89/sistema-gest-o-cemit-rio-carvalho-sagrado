-- =========================================================================
-- SCRIPT SQL DML: MODELO FÍSICO - CEMITÉRIO CARVALHO SAGRADO
-- =========================================================================

-- =========================================================================
-- INSERTS: INSERINDO DADOS NAS TABELAS
-- Inserções de dados fictícios para manipulação 
-- =========================================================================

USE CemiterioCarvalhoSagradoDB; -- Seleciona o banco de dados CemiterioCarvalhoSagradoDB para inserção de dados

-- =========================================================================
-- Cenário 1 — Expansão da marca com novas Unidades Regionais e Infraestrutura de Jazigos: 
-- Carvalho Sagrado cadastrou suas 5 unidades regionais e mapeou os jazigos 
-- iniciais disponíveis em cada unidade antes de qualquer sepultamento.
-- =========================================================================

INSERT INTO UnidadeRegional (idUnidadeRegional, nome, endereco, telefone) 
VALUES 
    (1, 'Unidade Central - São Paulo', 'Av. das Orquídeas, 500 - São Paulo/SP', '1133334444'),
    (2, 'Unidade Fluminense - Rio de Janeiro', 'Rua dos Ciprestes, 120 - Rio de Janeiro/RJ', '2133335555'),
    (3, 'Unidade Mineira - Belo Horizonte', 'Alameda dos Ipês, 80 - Belo Horizonte/MG', '3133336666'),
    (4, 'Unidade Paulista Interior - Campinas', 'Rodovia das Acácias, Km 12 - Campinas/SP', '1933337777'),
    (5, 'Unidade Sulista - Curitiba', 'Rua das Araucárias, 410 - Curitiba/PR', '4133338888');

INSERT INTO Jazigo (idJazigo, numero, tipo, status_jazigo, vagas, idUnidadeRegional)
VALUES
    (1, 101, 'Perpétuo Familiar', 'Disponível', 4, 1), -- Ainda possui 3 vagas livres após 1 sepultamento
    (2, 102, 'Individual', 'Ocupado', 1, 1),           -- Totalmente ocupado (1 vaga = 1 falecido)
    (3, 201, 'Perpétuo Familiar', 'Disponível', 3, 2), -- Ainda possui 2 vagas livres após 1 sepultamento
    (4, 202, 'Gaveta Individual', 'Ocupado', 1, 2),    -- Totalmente ocupado (1 vaga = 1 falecido)
    (5, 301, 'Jardim Familiar', 'Disponível', 6, 3);   -- Ainda possui 5 vagas livres após 1 sepultamento

-- =========================================================================
-- Cenário 2 — Contratação de Equipe e Catálogo de Produtos e Serviços:
-- Com as unidades estruturadas, a diretoria contratou a equipe operacional 
-- (sepultadores, tanatopractores, gerentes e jardineiros) e definiu a tabela 
-- oficial de serviços funerários e produtos memoriais.
-- =========================================================================

INSERT INTO Funcionario (idFuncionario, cpfFuncionario, nome, telefone, ocupacao, status_funcionario, idUnidadeRegional)
VALUES
    (1, '11122233344', 'Carlos Alberto Ramos', '11911112222', 'Sepultador', 'Ativo', 1),
    (2, '22233344455', 'Beatriz Souza Cruz', '11922223333', 'Atendente Comercial', 'Ativo', 1),
    (3, '33344455566', 'João Paulo Ferreira', '21933334444', 'Tanatopractor', 'Ativo', 2),
    (4, '44455566677', 'Luciana Maria Mendonça', '21944445555', 'Gerente Operacional', 'Ativo', 2),
    (5, '55566677788', 'Ricardo Augusto Lima', '31955556666', 'Jardineiro', 'Ativo', 3);

INSERT INTO Servico (idServico, nome, descricao, preco)
VALUES
    (1, 'Tanatopraxia e Preparação de Corpo', 'Higienização, conservação e restauração estética para velório.', 1200.00),
    (2, 'Organização de Cerimônia de Velório', 'Locação de salão nobre por 24h com suporte de cerimonial.', 1500.00),
    (3, 'Serviço de Sepultamento Standard', 'Abertura, fechamento e lacração técnica do jazigo.', 850.00),
    (4, 'Exumação e Manutenção de Ossuário', 'Procedimento legal de exumação e transferência para ossuário.', 950.00),
    (5, 'Manutenção e Jardinagem Anual de Jazigo', 'Limpeza mensal, poda de grama e conservação de lápide por 12 meses.', 450.00);

INSERT INTO Produto (idProduto, nome, preco, categoria)
VALUES
    (1, 'Urna Funerária de Madeira Nobre (Carvalho)', 3500.00, 'Urnas'),
    (2, 'Urna Funerária Ecológica Biodegradável', 2200.00, 'Urnas'),
    (3, 'Coroa de Flores Naturais Premium', 450.00, 'Ornamentação'),
    (4, 'Placa Memorial em Bronze Personalizada', 850.00, 'Memoriais'),
    (5, 'Lápide em Mármore Polido', 1800.00, 'Memoriais');

-- =========================================================================
-- Cenário 3 — Cadastro de Clientes Titulares e Registro de Óbitos:
-- Durante os primeiros meses de operação, cinco famílias procuraram as 
-- unidades para realizar o cadastro dos titulares responsáveis e registrar 
-- o sepultamento de seus entes queridos nos respectivos jazigos.
-- =========================================================================

INSERT INTO Cliente (idCliente, cpfCliente, nome, dataNascimento, dataInscricao, email, endereco, senha, telefone) 
VALUES 
    (1, '12345678901', 'Ana Silva', '1985-04-12', '2026-03-08', 'ana.silva@email.com', 'Rua das Flores, 123 - São Paulo/SP', 'hash_senha_123', '11987654321'), -- Em 08/03/2026, Ana Silva se inscreveu.
    (2, '23456789012', 'Carlos Eduardo Santos', '1990-08-25', '2026-04-01', 'carlos.santos@email.com', 'Av. Paulista, 1000 - São Paulo/SP', 'hash_senha_456', '11976543210'), -- Em 01/04/2026, Carlos Eduardo Santos se inscreveu.
    (3, '34567890123', 'Mariana Oliveira', '1995-11-03', '2026-05-12', 'mariana.oliveira@email.com', 'Rua dos Pinheiros, 45 - Rio de Janeiro/RJ', 'hash_senha_789', '21988887777'), -- Em 12/05/2026, Mariana Oliveira se inscreveu.
    (4, '45678901234', 'Roberto Souza', '1978-01-30', '2026-06-18', 'roberto.souza@email.com', 'Rua Bahia, 500 - Belo Horizonte/MG', 'hash_senha_abc', '31999998888'), -- Em 18/06/2026, Roberto Souza se inscreveu.
    (5, '56789012345', 'Fernanda Lima', '2001-06-18', '2026-07-05', 'fernanda.lima@email.com', 'Av. das Américas, 250 - Rio de Janeiro/RJ', 'hash_senha_def', '21977776666'); -- Em 05/07/2026, Fernanda Lima se inscreveu.

INSERT INTO Falecido (idFalecido, certObito, nome, dataNascimento, cpf, idCliente, idJazigo)
VALUES
    (1, 'OB123456789-01', 'António da Silva', '1942-03-15', '11100099988', 1, 2),       -- Ocupou o jazigo individual 2
    (2, 'OB987654321-02', 'Maria Francisca Santos', '1938-11-20', '22200099977', 2, 1), -- Ocupou 1 das 4 vagas do jazigo familiar 1
    (3, 'OB456789123-03', 'José Manuel Oliveira', '1950-07-10', '33300099966', 3, 3),   -- Ocupou 1 das 3 vagas do jazigo familiar 3
    (4, 'OB789123456-04', 'Helena Maria Souza', '1965-01-25', '44400099955', 4, 4),     -- Ocupou o jazigo individual 4
    (5, 'OB321654987-05', 'Gabriel Ferreira Lima', '1998-09-05', '55500099944', 5, 5);  -- Ocupou 1 das 6 vagas do jazigo familiar 5

-- =========================================================================
-- Cenário 4 — Contratação de Serviços e Aquisição de Produtos Funerários:
-- Para a realização das cerimônias, homenagens e manutenção dos jazigos, 
-- os clientes contrataram serviços específicos (alguns com desconto comercial) 
-- e adquiriram urnas, coroas de flores e memoriais.
-- =========================================================================

INSERT INTO Contrata (idCliente, idServico, data_contratacao, desconto)
VALUES 
    (1, 1, '2026-03-10', 100.00), -- Ana contratou Tanatopraxia com R$ 100 de desconto
    (1, 2, '2026-03-10', 0.00),   -- Ana contratou Cerimônia de Velório pelo valor integral
    (2, 3, '2026-04-02', 50.00),  -- Carlos Eduardo contratou Sepultamento Standard com desconto
    (3, 5, '2026-05-15', 0.00),   -- Mariana contratou Jardinagem Anual
    (4, 3, '2026-06-20', 0.00);   -- Roberto contratou Sepultamento Standard

INSERT INTO Compra (idCliente, idProduto, data_compra, quantidade)
VALUES
    (1, 1, '2026-03-10', 1), -- Ana comprou 1 Urna de Carvalho
    (1, 3, '2026-03-10', 2), -- Ana comprou 2 Coroas de Flores
    (2, 2, '2026-04-02', 1), -- Carlos Eduardo comprou 1 Urna Ecológica
    (3, 4, '2026-05-20', 1), -- Mariana comprou 1 Placa Memorial em Bronze
    (4, 5, '2026-06-25', 1); -- Roberto comprou 1 Lápide em Mármore

-- =========================================================================
-- Cenário 5 — Execução Operacional dos Serviços Contratados:
-- Por fim, os funcionários designados em cada unidade regional executaram 
-- os serviços contratados pelos clientes, registrando a data e a duração 
-- de cada atendimento operacional.
-- =========================================================================

INSERT INTO Execucao (idFuncionario, idServico, data_execucao, duracao)
VALUES
    (3, 1, '2026-03-10', '02:00:00'), -- João Paulo (Tanatopractor) realizou Tanatopraxia
    (4, 2, '2026-03-11', '04:00:00'), -- Luciana (Gerente) coordenou Cerimônia de Velório
    (1, 3, '2026-04-03', '01:30:00'), -- Carlos (Sepultador) realizou Sepultamento Standard
    (5, 5, '2026-05-16', '03:00:00'), -- Ricardo (Jardineiro) realizou Jardinagem Anual
    (1, 3, '2026-06-21', '01:45:00'); -- Carlos (Sepultador) realizou segundo Sepultamento Standard

-- =========================================================================
-- Cenário 6 — Inovação Digital e Memorial Interativo com Inteligência Artificial:
-- Buscando diferenciar-se da concorrência, a equipe de marketing do Cemitério 
-- Carvalho Sagrado lançou um serviço web exclusivo de duração contínua em 
-- parceria com a Big Tech fictícia "EternumAI". O serviço, disponível no plano 
-- funerário mais completo por R$ 100,00 mensais, eterniza a personalidade do 
-- ente querido em um chatbot de IA para que a família possa "revisitá-lo".
-- =========================================================================

INSERT INTO Servico (idServico, nome, descricao, preco)
VALUES
    (6, 'Memorial Interativo EternumAI (Assinatura Mensal)', 'Serviço web exclusivo em parceria com a Big Tech EternumAI: recriação conversacional do ente querido via chatbot de IA (plano contínuo).', 100.00);

INSERT INTO Contrata (idCliente, idServico, data_contratacao, desconto)
VALUES
    (1, 6, '2026-07-15', 0.00); -- Ana Silva (cliente do plano premium) contratou o chatbot memorial por R$ 100,00/mês

INSERT INTO Execucao (idFuncionario, idServico, data_execucao, duracao)
VALUES
    (2, 6, '2026-07-16', '01:00:00'); -- Beatriz (Atendente Comercial) realizou a ativação e integração web do perfil na plataforma EternumAI