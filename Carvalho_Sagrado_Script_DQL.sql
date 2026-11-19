-- =========================================================================
-- SCRIPT SQL DQL: MODELO FÍSICO - CEMITÉRIO CARVALHO SAGRADO
-- =========================================================================

USE CemiterioCarvalhoSagradoDB; -- Seleciona o banco de dados CemiterioCarvalhoSagradoDB para consulta de dados

-- Consultando todas as tabelas
SHOW TABLES;

DESCRIBE Falecido; -- Exibindoo tabela


DESCRIBE Execucao; -- Exibindoo tabela
SELECT * FROM Execucao; -- Exibindo a tabela Execução

-- =========================================================================
-- SELECT: SELECIONANDO DADOS PARA CONSULTA
-- =========================================================================

-- CONSULTA 1: Listar todos os clientes cadastrados
SELECT * FROM Cliente; -- Seleciona todas as colunas de Cliente 
SELECT nome FROM Cliente; -- Seleciona a coluna nome
SELECT IdCliente AS 'Código do Cliente', nome AS 'Nome' FROM Cliente; -- Seleciona ambos idCliente e nome, e fornece um "apelido"

-- CONSULTA 2: Listar todos os serviços cadastrados
SELECT * FROM Servico;
SELECT nome FROM Servico; -- Seleciona a coluna nome
SELECT IdServico AS 'Código do Servico', nome AS 'Servico' FROM Servico; -- Seleciona ambos idServico e nome, e fornece um "apelido"

-- -------------------------------------------------------------------------
-- CONSULTA 3: Cruzamento de Dados (INNER JOIN)
-- Exibe apenas os servicos que possuem um cliente associado 
-- e apenas os clientes que contrataram serviços.
-- -------------------------------------------------------------------------

SELECT 
    c.idCliente AS 'Código do Cliente',
    c.nome AS 'Nome do Cliente',
    s.idServico AS 'Código do Serviço',
    s.nome AS 'Serviço Contratado',
    s.preco AS 'Valor (R$)'
FROM Cliente c
INNER JOIN Contrata co ON c.idCliente = co.idCliente
INNER JOIN Servico s   ON co.idServico = s.idServico;

SELECT 
	f.idFuncionario AS 'Código do Funcionario',
    f.nome AS 'Nome Funcionario',
    s.idServico AS 'Código do Serviço',
    s.nome AS 'Nome do Serviço'
FROM Funcionario f
INNER JOIN Execucao ex ON f.idFuncionario = ex.idFuncionario
INNER JOIN Servico s ON ex.idServico = s.idServico;

SELECT 
    f.idFalecido AS 'Código do Falecido',
    f.nome AS 'Nome do Falecido',
    j.idJazigo AS 'Código do Jazigo',
    j.numero AS 'Número do Jazigo',
    j.tipo AS 'Tipo de Jazigo'
FROM Falecido f
INNER JOIN Jazigo j ON f.idJazigo = j.idJazigo;
