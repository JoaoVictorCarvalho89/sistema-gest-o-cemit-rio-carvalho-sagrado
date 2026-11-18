-- =========================================================================
-- SCRIPT SQL DML: MODELO FÍSICO - CEMITÉRIO CARVALHO SAGRADO
-- =========================================================================

-- =========================================================================
-- INSERTS: INSERINDO DADOS NAS PRINCIPAIS TABELAS
-- Inserções de dados fictícios para manipulação 
-- =========================================================================

USE CemiterioCarvalhoSagradoDB; -- Seleciona o banco de dados CemiterioCarvalhoSagradoDB para inserção de dados

INSERT INTO UnidadeRegional (idUnidadeRegional, nome, endereco) 
VALUES 
	-- 1. idUnidadeRegional: Identificador único de UnidadeRegional
    -- 2. nome: Nome completo da unidade
    -- 3. endereço da unidade
    (1, 'Unidade Central - São Paulo', 'Av. das Orquídeas, 500 - São Paulo/SP'),
    (2, 'Unidade Fluminense - Rio de Janeiro', 'Rua dos Ciprestes, 120 - Rio de Janeiro/RJ'),
    (3, 'Unidade Mineira - Belo Horizonte', 'Alameda dos Ipês, 80 - Belo Horizonte/MG');

-- =========================================================================
-- =========================================================================

INSERT INTO Cliente (idCliente, cpfCliente, nome, dataNascimento, email, endereco, senha, telefone) 
VALUES 
	-- Insere 5 registros de teste na tabela Cliente
	-- 1. idCliente: Identificador único numérico do cliente
	-- 2. cpfCliente: String de 11 dígitos (único no sistema)
	-- 3. nome: Nome completo do cliente
	-- 4. dataNascimento: Data no formato 'AAAA-MM-DD'
	-- 5. email: Endereço de e-mail de contacto
	-- 6. endereco: Logradouro completo com número e cidade/estado
	-- 7. senha: Hash ou texto criptografado da palavra-passe do cliente
	-- 8. telefone: Número de telefone com DDD
    (1, '12345678901', 'Ana Silva', '1985-04-12', 'ana.silva@email.com', 'Rua das Flores, 123 - São Paulo/SP', 'hash_senha_123', '11987654321'),
    (2, '23456789012', 'Carlos Eduardo Santos', '1990-08-25', 'carlos.santos@email.com', 'Av. Paulista, 1000 - São Paulo/SP', 'hash_senha_456', '11976543210'),
    (3, '34567890123', 'Mariana Oliveira', '1995-11-03', 'mariana.oliveira@email.com', 'Rua dos Pinheiros, 45 - Rio de Janeiro/RJ', 'hash_senha_789', '21988887777'),
    (4, '45678901234', 'Roberto Souza', '1978-01-30', 'roberto.souza@email.com', 'Rua Bahia, 500 - Belo Horizonte/MG', 'hash_senha_abc', '31999998888'),
    (5, '56789012345', 'Fernanda Lima', '2001-06-18', 'fernanda.lima@email.com', 'Av. das Américas, 250 - Rio de Janeiro/RJ', 'hash_senha_def', '21977776666');
    
-- =========================================================================
-- =========================================================================

INSERT INTO Funcionario (idFuncionario, cpfFuncionario, nome, telefone, ocupacao, status_funcionario, idUnidadeRegional)
VALUES
    -- 1. idFuncionario: Identificador único do funcionário
    -- 2. cpfFuncionario: CPF com 11 dígitos
    -- 3. nome: Nome completo do colaborador
    -- 4. telefone: Telefone para contato profissional
    -- 5. ocupacao: Cargo/função desempenhada
    -- 6. status: Situação cadastral (Ativo, Licença, Inativo)
    -- 7. idUnidadeRegional: ID da Unidade Regional onde trabalha (Chave Estrangeira)
    (1, '11122233344', 'Carlos Alberto Ramos', '11911112222', 'Sepultador', 'Ativo', 1),
    (2, '22233344455', 'Beatriz Souza Cruz', '11922223333', 'Atendente Comercial', 'Ativo', 1),
    (3, '33344455566', 'João Paulo Ferreira', '21933334444', 'Tanatopractor', 'Ativo', 2),
    (4, '44455566677', 'Luciana Maria Mendonça', '21944445555', 'Gerente Operacional', 'Ativo', 2),
    (5, '55566677788', 'Ricardo Augusto Lima', '31955556666', 'Jardineiro', 'Ativo', 3);

-- =========================================================================
-- =========================================================================

INSERT INTO Servico (idServico, nome, preco)
VALUES
    -- 1. idServico: Identificador único do serviço
    -- 2. nome: Descrição completa do serviço funerário oferecido
    -- 3. preco: Valor cobrado em Reais (DECIMAL 10,2)
    (1, 'Tanatopraxia e Preparação de Corpo', 1200.00),
    (2, 'Organização de Cerimônia de Velório (Salão Nobre)', 1500.00),
    (3, 'Serviço de Sepultamento Standard', 850.00),
    (4, 'Exumação e Manutenção de Ossuário', 950.00),
    (5, 'Manutenção e Jardinagem Anual de Jazigo', 450.00);

-- =========================================================================
-- =========================================================================

INSERT INTO Produto (idProduto, nome, preco, categoria)
VALUES
    -- 1. idProduto: Identificador único do produto
    -- 2. nome: Descrição do produto funerário
    -- 3. preco: Valor unitário em Reais (DECIMAL 10,2)
    -- 4. categoria: Classificação do produto (Urnas, Flores, Placas, etc.)
    (1, 'Urna Funerária de Madeira Nobre (Carvalho)', 3500.00, 'Urnas'),
    (2, 'Urna Funerária Ecológica Biodegradável', 2200.00, 'Urnas'),
    (3, 'Coroa de Flores Naturais Premium', 450.00, 'Ornamentação'),
    (4, 'Placa Memorial em Bronze Personalizada', 850.00, 'Memoriais'),
    (5, 'Lápide em Mármore Polido', 1800.00, 'Memoriais');

-- =========================================================================
-- =========================================================================

INSERT INTO Jazigo (idJazigo, numero, tipo, status_jazigo, vagas, idUnidadeRegional)
VALUES
    -- 1. idJazigo: Identificador único do jazigo
    -- 2. numero: Número de identificação/localização física da gaveta ou lote
    -- 3. tipo: Categoria do jazigo (Familiar, Individual, Perpétuo)
    -- 4. status: Situação atual de ocupação (Disponível, Ocupado, Reservado, Manutenção)
    -- 5. vagas: Quantidade total de gavetas/capacidade de sepultamentos simultâneos
    -- 6. idUnidadeRegional: ID da Unidade Regional à qual o jazigo pertence (Chave Estrangeira)
    (1, 101, 'Perpétuo Familiar', 'Disponível', 4, 1),
    (2, 102, 'Individual', 'Ocupado', 1, 1),
    (3, 201, 'Perpétuo Familiar', 'Reservado', 3, 2),
    (4, 202, 'Gaveta Individual', 'Disponível', 1, 2),
    (5, 301, 'Jardim Familiar', 'Disponível', 6, 3);

-- =========================================================================
-- =========================================================================

INSERT INTO Falecido (idFalecido, certObito, nome, dataNascimento, cpf, idCliente, idJazigo)
VALUES
    -- 1. idFalecido: Identificador único do falecido
    -- 2. certObito: Número do registo da certidão de óbito
    -- 3. nome: Nome completo do falecido
    -- 4. dataNascimento: Data de nascimento (AAAA-MM-DD)
    -- 5. cpf: CPF do falecido (11 dígitos)
    -- 6. idCliente: ID do cliente/familiar responsável (Chave Estrangeira)
    -- 7. idJazigo: ID do jazigo onde se encontra sepultado (Chave Estrangeira)
    (1, 'OB123456789-01', 'António da Silva', '1942-03-15', '11100099988', 1, 2),
    (2, 'OB987654321-02', 'Maria Francisca Santos', '1938-11-20', '22200099977', 2, 1),
    (3, 'OB456789123-03', 'José Manuel Oliveira', '1950-07-10', '33300099966', 3, 3),
    (4, 'OB789123456-04', 'Helena Maria Souza', '1965-01-25', '44400099955', 4, 4),
    (5, 'OB321654987-05', 'Gabriel Ferreira Lima', '1998-09-05', '55500099944', 5, 5);

-- =========================================================================
-- INSERTS: TABELAS ASSOCIATIVAS ENTRE AS CLASSES PRINCIPAIS
-- =========================================================================

INSERT INTO Execucao (idFuncionario, idServico, duracao)
VALUES
    -- 1. idFuncionario: ID do funcionário responsável pela execução (Chave Estrangeira)
    -- 2. idServico: ID do serviço executado (Chave Estrangeira)
    -- 3. duracao: Tempo gasto na execução no formato 'HH:MM:SS'
    (1, 3, '01:30:00'), -- Carlos (Sepultador) executou Sepultamento Standard (1h 30m)
    (3, 1, '02:00:00'), -- João Paulo (Tanatopractor) executou Tanatopraxia (2h)
    (4, 2, '04:00:00'), -- Luciana (Gerente) organizou Cerimônia de Velório (4h)
    (5, 5, '03:00:00'); -- Ricardo (Jardineiro) executou Jardinagem Anual (3h)

-- =========================================================================
-- =========================================================================

INSERT INTO Compra (idCliente, idProduto)
VALUES
    -- 1. idCliente: ID do cliente comprador (Chave Estrangeira)
    -- 2. idProduto: ID do produto adquirido (Chave Estrangeira)
    (1, 1), -- Ana Silva comprou Urna Funerária de Madeira Nobre
    (1, 3), -- Ana Silva comprou Coroa de Flores Naturais Premium
    (2, 2), -- Carlos Eduardo comprou Urna Funerária Ecológica
    (3, 4), -- Mariana Oliveira comprou Placa Memorial em Bronze
    (4, 5); -- Roberto Souza comprou Lápide em Mármore Polido

-- =========================================================================
-- =========================================================================

INSERT INTO Contrata (idCliente, idServico)
VALUES 
	-- 1. IdCliente
    -- 2. idServiço
    (1, 1), 
    (1, 2), 
    (2, 3),
    (3, 5);