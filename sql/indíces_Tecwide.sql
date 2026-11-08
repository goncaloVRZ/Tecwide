-- ----------------------------------------------------
-- indexação do sistema de dados da Tecwide
-- ----------------------------------------------------

USE Tecwide; 

-- otimizar a procoura de obras por localização 
CREATE INDEX idx_obra_localizacao ON obra(País, Cidade); 
-- drop index  idx_obra_localizacao on obra; 


-- otimizar a procura de viagens por data 
CREATE INDEX idx_viagem_data ON viagem(DataViagem);
-- drop index idx_viagem_data on viagem; 

-- otimizar a procura de viagens que tivream um custo elevado (superior a 100€ p.e.) 
CREATE INDEX idx_viagem_custo_alto ON viagem(CustoTotal);  
-- drop index idx_viagem_custo_alto on viagem; 



-- drop de todos os indìces: 
/* 
drop index  idx_obra_localizacao on obra;
drop index idx_viagem_data on viagem;
drop index idx_relatorio_autor_data on relatório; 
drop index idx_viagem_custo_alto on viagem; 
*/ 



-- otimizar a procura de relatórios por técnico e data 
-- CREATE INDEX idx_relatorio_autor_data ON relatório(Técnico, DataHoraRegisto); 
-- drop index idx_relatorio_autor_data on relatório; 
