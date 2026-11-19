-- =========================================================================
-- SCRIPT SQL DDL: MODELO FÍSICO - CEMITÉRIO CARVALHO SAGRADO
-- =========================================================================

-- Destruição do banco de dados
DROP DATABASE IF EXISTS CemiterioCarvalhoSagradoDB;

-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS CemiterioCarvalhoSagradoDB;
USE CemiterioCarvalhoSagradoDB; -- Seleciona o banco de dados CemiterioCarvalhoSagradoDB para criação de tabelas

-- =========================================================================
-- 1. TABELA UNIDADE REGIONAL (Entidade Forte)
-- =========================================================================

CREATE TABLE IF NOT EXISTS UnidadeRegional (
    idUnidadeRegional INT UNSIGNED NOT NULL PRIMARY KEY,
    nome VARCHAR(125) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

-- =========================================================================
-- 2. TABELA CLIENTE (Entidade Forte - Identificada por ID)
-- =========================================================================

CREATE TABLE IF NOT EXISTS Cliente (
	idCliente INT UNSIGNED NOT NULL PRIMARY KEY,
    cpfCliente VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(125) NOT NULL,
    dataNascimento DATE NOT NULL,
    dataInscricao DATE NOT NULL DEFAULT (CURRENT_DATE) CHECK (dataInscricao >= dataNascimento),
    email VARCHAR(125) NOT NULL UNIQUE,
    endereco VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

-- =========================================================================
-- 3. TABELA FUNCIONÁRIO (Lado N da Unidade Regional)
-- =========================================================================

CREATE TABLE IF NOT EXISTS Funcionario (
	idFuncionario INT UNSIGNED NOT NULL PRIMARY KEY,
    cpfFuncionario VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(125) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    ocupacao VARCHAR(50) NOT NULL,
    status_funcionario VARCHAR(20) NOT NULL DEFAULT 'Inativo',
    idUnidadeRegional INT UNSIGNED NOT NULL,
    
    CONSTRAINT fk_funcionario_unidade
        FOREIGN KEY (idUnidadeRegional)
        REFERENCES UnidadeRegional(idUnidadeRegional)
);

-- =========================================================================
-- 4. TABELA SERVIÇO (Entidade Forte)
-- =========================================================================

CREATE TABLE IF NOT EXISTS Servico (
    idServico INT UNSIGNED NOT NULL PRIMARY KEY,
    nome VARCHAR(125) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL CHECK (preco >= 0)
);

-- =========================================================================
-- 5. TABELA PRODUTO (Entidade Forte)
-- =========================================================================

CREATE TABLE IF NOT EXISTS Produto (
    idProduto INT UNSIGNED NOT NULL PRIMARY KEY,
    nome VARCHAR(125) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL CHECK (preco >= 0),
    categoria VARCHAR(20) NOT NULL
);

-- =========================================================================
-- 6. TABELA JAZIGO (Lado N da Unidade Regional)
-- =========================================================================

CREATE TABLE IF NOT EXISTS Jazigo (
    idJazigo INT UNSIGNED NOT NULL PRIMARY KEY,
    numero INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    status_jazigo VARCHAR(20) NOT NULL DEFAULT 'Indisponível',
    vagas INT NOT NULL check (vagas >= 0),
    idUnidadeRegional INT UNSIGNED NOT NULL,
    
    CONSTRAINT fk_jazigo_unidade
        FOREIGN KEY (idUnidadeRegional)
        REFERENCES UnidadeRegional(idUnidadeRegional)
);

-- =========================================================================
-- 7. TABELA FALECIDO (Relaciona-se com Cliente e Jazigo)
-- =========================================================================

CREATE TABLE IF NOT EXISTS Falecido (
	idFalecido INT UNSIGNED NOT NULL PRIMARY KEY,
    certObito VARCHAR(50) NOT NULL UNIQUE,
    nome VARCHAR(125) NOT NULL,
    dataNascimento DATE NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    idCliente INT UNSIGNED NOT NULL,
    idJazigo INT UNSIGNED NOT NULL,
    
    CONSTRAINT fk_falecido_cliente
        FOREIGN KEY (idCliente)
        REFERENCES Cliente(idCliente),
        
    CONSTRAINT fk_falecido_jazigo
        FOREIGN KEY (idJazigo)
        REFERENCES Jazigo(idJazigo)
);

-- =========================================================================
-- 8. TABELA ASSOCIATIVA: EXECUÇÃO (Relacionamento M:N - Funcionário e Serviço)
-- =========================================================================

CREATE TABLE IF NOT EXISTS Execucao (
    idFuncionario INT UNSIGNED NOT NULL,
    idServico INT UNSIGNED NOT NULL,
    data_execucao DATE NOT NULL,
    duracao TIME NOT NULL,
    
    PRIMARY KEY (idFuncionario, idServico, data_execucao),
    
    CONSTRAINT fk_exec_funcionario
        FOREIGN KEY (idFuncionario)
        REFERENCES Funcionario(idFuncionario),
        
    CONSTRAINT fk_exec_servico
        FOREIGN KEY (idServico)
        REFERENCES Servico(idServico)
);

-- =========================================================================
-- 9. TABELA ASSOCIATIVA: CONTRATA (Relacionamento M:N - Cliente e Serviço)
-- =========================================================================

CREATE TABLE IF NOT EXISTS Contrata (
    idCliente INT UNSIGNED NOT NULL,
    idServico INT UNSIGNED NOT NULL,
    data_contratacao DATE NOT NULL,
    desconto DECIMAL(10, 2) NOT NULL DEFAULT 0.00 CHECK (desconto >= 0),

    PRIMARY KEY (idCliente, idServico, data_contratacao),
    
    CONSTRAINT fk_contrata_cliente
        FOREIGN KEY (idCliente)
        REFERENCES Cliente(idCliente),
        
    CONSTRAINT fk_contrata_servico
        FOREIGN KEY (idServico)
        REFERENCES Servico(idServico)
);

-- =========================================================================
-- 10. TABELA ASSOCIATIVA: COMPRA (Relacionamento M:N - Cliente e Produto)
-- =========================================================================

CREATE TABLE IF NOT EXISTS Compra (
    idCliente INT UNSIGNED NOT NULL,
    idProduto INT UNSIGNED NOT NULL,
    data_compra DATE NOT NULL,
    quantidade INT UNSIGNED NOT NULL DEFAULT 1 CHECK (quantidade > 0),

    PRIMARY KEY (idCliente, idProduto, data_compra),
    
    CONSTRAINT fk_compra_cliente
        FOREIGN KEY (idCliente)
        REFERENCES Cliente(idCliente),
        
    CONSTRAINT fk_compra_produto
        FOREIGN KEY (idProduto)
        REFERENCES Produto(idProduto)
);