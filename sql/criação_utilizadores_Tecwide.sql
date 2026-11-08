-- ----------------------------------------------------
-- Criação dos Utilizadores da Base de Dados da Tecwide 
-- ----------------------------------------------------

USE Tecwide; 

-- Criar o utilizador "João Ferreira" (chefe do setor de Produção/Obras) 
CREATE USER IF NOT EXISTS 'joao_ferreira'@'localhost' IDENTIFIED BY 'Joao!2025' ; 
-- drop user if exists 'joao_ferreira'@'localhost'; 

-- Atribuir Permissões de (SELECT, INSERT, UPDATE, DELETE) sobre todas as tabelas
GRANT SELECT, INSERT, UPDATE, DELETE ON Tecwide.chefe_Adm TO 'joao_ferreira'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Tecwide.técnico TO 'joao_ferreira'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Tecwide.obra TO 'joao_ferreira'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Tecwide.telemóvel TO 'joao_ferreira'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Tecwide.relatório TO 'joao_ferreira'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Tecwide.viagem TO 'joao_ferreira'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Tecwide.multimédia TO 'joao_ferreira'@'localhost';
FLUSH PRIVILEGES; 

-- também podiamos fazer assim para ser mais simples (fiz da outra forma para "ter mais noção" das permissões que estamos a conceder ao utilizador) 
-- GRANT SELECT, INSERT, UPDATE, DELETE ON Tecwide.* TO 'joao_ferreira'@'localhost'; 

-- Criar o utilizador para o Pessoal Administrativo 
CREATE USER IF NOT EXISTS 'pessoal_adm'@'localhost' IDENTIFIED BY 'Administracao!2025';
-- drop user if exists 'pessoal_adm'@'localhost'; 

-- Atribuir Permissão de leitura sobre todas as tabelas 
GRANT SELECT ON Tecwide.* TO 'pessoal_adm'@'localhost';
FLUSH PRIVILEGES; 

-- Criar o utilizador para os Técnicos de Segurança e Qualidade
CREATE USER IF NOT EXISTS 'tecnicos_sq'@'localhost' IDENTIFIED BY 'Tecnicos!2025';
-- drop user if exists 'tecnicos_sq'@'localhost'; 

-- Atribuir Permissões (SELECT, INSERT, UPDATE) sobre as tabelas obra, viagem, multimédia e relatório
GRANT SELECT, INSERT, UPDATE ON Tecwide.obra TO 'tecnicos_sq'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Tecwide.viagem TO 'tecnicos_sq'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Tecwide.multimédia TO 'tecnicos_sq'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Tecwide.relatório TO 'tecnicos_sq'@'localhost';
FLUSH PRIVILEGES; 

-- Criar o utilizador para os assistentes jurídicos da Tecwide
CREATE USER IF NOT EXISTS 'assistente_juridico'@'localhost' IDENTIFIED BY 'Juridico!2025'; 
-- drop user if exists 'assistente_juridico'@'localhost'; 

-- Atribuir Permissão de leitura (Select) sobre as tabelas: obra, relatorio e multimedia 
GRANT SELECT ON Tecwide.obra TO 'assistente_juridico'@'localhost'; 
GRANT SELECT ON Tecwide.relatório TO 'assistente_juridico'@'localhost'; 
GRANT SELECT ON Tecwide.multimédia TO 'assistente_juridico'@'localhost'; 
FLUSH PRIVILEGES; 

-- Criar o utilizador para os clientes da Tecwide 
CREATE USER IF NOT EXISTS 'cliente'@'localhost' IDENTIFIED BY 'Cliente!2025'; 
-- drop user if exists 'cliente'@'localhost'

-- Atribuir Permissão de leitura (Select) sobre a tabela obra
GRANT SELECT ON Tecwide.obra TO 'cliente'@'localhost'; 
FLUSH PRIVILEGES;  



-- todos os drops 
/*
drop user if exists 'joao_ferreira'@'localhost'; 
drop user if exists 'pessoal_adm'@'localhost'; 
drop user if exists 'tecnicos_sq'@'localhost'; 
drop user if exists 'assistente_juridico'@'localhost'; 
drop user if exists 'cliente'@'localhost'
*/ 
