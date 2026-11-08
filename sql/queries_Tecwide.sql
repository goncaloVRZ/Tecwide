-- ----------------------------------------------------
-- interrogações do utilizador em SQL (queries) 
-- ----------------------------------------------------

USE Tecwide; 

-- Obter os dados de obras não concluídas
SELECT *
FROM obra
WHERE Estágio IN ('inicial', 'intermédio');


-- Calcular o número de obras concluídas por mês 
SELECT 
    MONTH(DataConclusao) AS Mes, 
    COUNT(idObra) AS NrObras
FROM obra
WHERE Estágio = 'concluído'
GROUP BY Mes
ORDER BY Mes DESC;
    

-- obter detalhes acerca dos relatorios inseridos hoje
SELECT *
FROM relatório
WHERE DATE(DataHoraRegisto) = CURDATE();
    

-- Calcular o total das despesas em viagens (por mês e ano) 
SELECT 
    YEAR(DataViagem) AS Ano, 
    MONTH(DataViagem) AS Mes, 
    SUM(CustoTotal) AS TotalDespesas
FROM viagem
GROUP BY Ano, Mes
ORDER BY Ano ASC, Mes ASC;

    
-- Calcular o número de viagens feitas a cada país (por mês) 
SELECT 
    YEAR(DataViagem) AS Ano, 
    MONTH(DataViagem) AS Mes, 
    País, 
    COUNT(obra.idObra) AS NrVisitas
FROM viagem
JOIN obra ON viagem.Obra = obra.idObra
GROUP BY Ano, Mes, País
ORDER BY Ano DESC, Mes DESC, NrVisitas DESC;

