-- ----------------------------------------------------
-- Vistas de Utilização da base de dados da Tecwide 
-- ----------------------------------------------------

USE Tecwide; 

-- mostrar todos os contactos dos técnicos, ordenado pelos nomes dos técnicos 
CREATE VIEW vista_Contactos_Tecnicos AS
SELECT
    t.Nome AS Nome_Tecnico,
    t.Email,
    tel.Contacto AS Contacto_Telemovel
FROM
    técnico t
JOIN
    telemóvel tel ON t.idTécnico = tel.técnico_idTécnico
ORDER BY
    t.Nome;
    

-- mostrar todas as obras que estão a ser feitas em portugal 
CREATE VIEW vista_Obras_Portugal AS 
SELECT 
	idObra,
    Cidade,
    Tipo_Obra,
    Estágio,
    DataConclusao,
    Chefe_Adm,
    Técnico
FROM 
	obra
WHERE 
	País = 'Portugal'; 
-- a instrução para consultar esta vista seria: SELECT * FROM vista_Obras_Portugal;

-- vista que agrega o custo total das viagens por obra 
CREATE VIEW vista_Resumo_Financeiro_Obra AS
SELECT
    o.idObra,
    o.País,
    o.Cidade,
    o.Estágio,
    SUM(v.CustoTotal) AS Custo_Total_Viagens   -- agrega o custo total de todas as viagens associadas à obra
FROM
    obra o 
LEFT JOIN -- usamos LEFT JOIN para incluir obras que ainda não tiveram viagens
    viagem v ON o.idObra = v.Obra
GROUP BY
    o.idObra, o.País, o.Cidade, o.Estágio
ORDER BY 
	Custo_Total_Viagens ASC; 
    

-- vista para sabermos todos os detalhes + importantes de um relatorio (tecnico que escreveu, informações da obra a que se refere e data de resgisto) 
CREATE VIEW vista_Registo_Atividade_Detalhado AS
SELECT
    r.idRelatório,
    r.DataHoraRegisto AS Data_do_Relatorio,
    t.Nome AS Nome_Tecnico,
    o.País AS País_Obra,
    o.Cidade AS Cidade_Obra,
    r.ConteúdoRelatório,
    v.CustoTotal AS Custo_Viagem -- pode ser NULL se não houver nenhuma viagem associada
FROM
    relatório r
INNER JOIN -- INNER JOIN pq um relatório tem sempre um técnico
    técnico t ON r.Técnico = t.idTécnico
INNER JOIN -- INNER JOIN pq um relatório está sempre associado a uma viagem
    viagem v ON r.idRelatório = v.Relatório_idRelatório
INNER JOIN -- INNER JOIN pq uma viagem é sempre para visitar uma obra
    obra o ON v.Obra = o.idObra
ORDER BY
    r.DataHoraRegisto DESC; -- ordem decrescente da data de registo do relatorio 
    
    
    
-- apagar todas as vistas: 
/* 
DROP VIEW IF EXISTS vista_Contactos_Tecnicos; 
DROP VIEW IF EXISTS vista_Obras_Portugal; 
DROP VIEW IF EXISTS vista_Resumo_Financeiro_Obra; 
DROP VIEW IF EXISTS vista_Registo_Atividade_Detalhado; 
*/ 