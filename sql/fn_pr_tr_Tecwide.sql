-- ------------------------------------------------------------------------------
-- implementação de procedimentos, funções e gatilhos na base de dados da Tecwide
-- ------------------------------------------------------------------------------

USE Tecwide; 

-- calcular o custo total das viagens por obra 
DELIMITER $$
CREATE FUNCTION fn_custo_total_viagens_obra (p_idObra int) 
RETURNS DECIMAL (10,2) 
READS SQL DATA 
BEGIN 
	DECLARE v_total DECIMAL (10,2); 
    
    SELECT SUM(CustoTotal) INTO v_total
	FROM viagem WHERE Obra = p_idObra; 
    
    RETURN IFNULL(v_total, 0.00); -- assim se não houver viagens retorna 0 
END $$ 
DELIMITER ; 

-- drop function if exists fn_custo_total_viagens_obra; 
-- para usar faziamos,p.e.: 
-- SELECT fn_custo_total_viagens_obra(2); 


-- criar um procedimento para submeter um novo registo de viagem/obra (uma viagem e um relatorio)
DELIMITER $$
CREATE PROCEDURE pr_novo_registo_viagem_obra (
	IN p_MeioTransporte VARCHAR(45),
    IN p_CustoTotal DECIMAL(10, 2),
    IN p_Lingua_Local VARCHAR(45),
    IN p_DataViagem DATE,
    IN p_Obra INT,
    IN p_Tecnico INT,
    IN p_ConteudoRelatorio TEXT
)
BEGIN 
    DECLARE novoRelatorioId INT; 
    
    -- 1 inserir o novo Relatório (a chave primaria do relatório é AUTO_INCREMENT)
    INSERT INTO relatório (ConteúdoRelatório, DataHoraRegisto, Técnico)
    VALUES (p_ConteudoRelatorio, NOW(), p_Tecnico);
    
    
    SET novoRelatorioId = LAST_INSERT_ID(); -- obter o id do relatório recém-criado 

    -- 2 inserir a nova viagem, ligando-a ao relatório e à obra
    INSERT INTO viagem (MeioTransporte, CustoTotal, Lingua_local, DataViagem, Obra, Técnico, Relatório_idRelatório)
    VALUES (p_MeioTransporte, p_CustoTotal, p_Lingua_Local, p_DataViagem, p_Obra, p_Tecnico, novoRelatorioId);

    -- 3 "devolver" o id da viagem criada
    SELECT LAST_INSERT_ID() AS idViagemGerada;
    
END $$
DELIMITER ; 

-- drop procedure if exists pr_novo_registo_viagem_obra; 
-- para usar faziamos p.e.: 
-- Exemplo de utilização:
/*
CALL pr_novo_registo_viagem_obra(
    'Carro', 
    25.50, 
    'espanhol',
    '2025-12-20', 
    3,    -- Obra ID 
    5,    -- Técnico ID
    'Relatório de inspeção final da semana.'
);
*/ 


DELIMITER $$
CREATE TRIGGER tr_atualizar_estagio_obra
BEFORE UPDATE ON obra 
FOR EACH ROW 
BEGIN
	IF OLD.DataConclusao IS NULL AND NEW.DataConclusao IS  NOT NULL THEN 
		SET NEW.Estágio = 'concluído';
	END IF; 
END $$
DELIMITER ;

-- drop trigger if exists tr_atualizar_estagio_obra; 
/*
para usar, p.e.: 
UPDATE obra
SET 
    DataConclusao = '2026-01-01' -- Definir uma data de conclusão (não alteramos o estagio, obviamente) 
WHERE 
    idObra = 2;
---
    SELECT idObra, Estágio, DataConclusao
FROM obra
WHERE idObra = 2;
(fazemos isto para confirmar se o estagio passou a concluído) 
*/


-- todos os drops 
/* 
drop function if exists fn_custo_total_viagens_obra; 
drop procedure if exists pr_novo_registo_viagem_obra; 
drop trigger if exists tr_atualizar_estagio_obra;  
*/ 
