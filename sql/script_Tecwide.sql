/* 
Script para a criação do esquema físico da BD da Tecwide 
versão 1 
*/

-- Criação da Base de Dados 

CREATE database IF NOT exists Tecwide; 
-- drop database if exists Tecwide; 

USE Tecwide; 

-- Criar as tabelas: 

CREATE TABLE IF NOT EXISTS chefe_Adm (
	idChefe_Adm Int auto_increment primary key NOT NULL, 
    Nome varchar (75) NOT NULL, 
    Email varchar (45) NOT NULL, 
    Cargo varchar (45) NOT NULL
); 
-- drop table if exists chefe_Adm; 

CREATE TABLE IF NOT EXISTS técnico (
	idTécnico Int auto_increment primary key NOT NULL, 
    Nome varchar (75), 
    Email varchar (45)
); 
-- drop table if exists técnico; 

CREATE TABLE IF NOT EXISTS telemóvel (
	idtelemóvel Int auto_increment primary key NOT NULL,
    Contacto varchar (20), 
    técnico_idTécnico Int NOT NULL, 
    FOREIGN KEY (técnico_idTécnico) REFERENCES técnico (idTécnico)
); 
-- drop table if exists telemóvel; 

CREATE TABLE IF NOT EXISTS obra (
	idObra Int auto_increment primary key NOT NULL,
    País varchar (45) NOT NULL,
    Cidade varchar (45) NOT NULL, 
    Tipo_Obra varchar (45) NOT NULL,
    Estágio enum ('inicial', 'intermédio', 'concluído') NOT NULL,
    DataConclusao date,
    Chefe_Adm int  NOT NULL, 
    Técnico int  NOT NULL, 
    FOREIGN KEY (Chefe_Adm) REFERENCES chefe_Adm (idChefe_Adm), 
    FOREIGN KEY (Técnico) REFERENCES técnico (idTécnico)
); 
-- drop table if exists obra; 

CREATE TABLE IF NOT EXISTS relatório (
	idRelatório Int auto_increment primary key NOT NULL, 
    ConteúdoRelatório text NOT NULL, 
    DataHoraRegisto datetime NOT NULL, 
    Técnico Int NOT NULL, 
    FOREIGN KEY (Técnico) REFERENCES técnico (idTécnico)
);
-- drop table if exists relatório; 

CREATE TABLE IF NOT EXISTS viagem (
	idViagem Int auto_increment primary key NOT NULL, 
    MeioTransporte varchar (45) NOT NULL, 
    CustoTotal decimal (6,2), 
    Lingua_local varchar (45), 
    DataViagem date NOT NULL, 
    Obra INT NOT NULL,
    Técnico INT NOT NULL,
    Relatório_idRelatório INT NOT NULL,
    FOREIGN KEY (Obra) REFERENCES obra (idObra),
    FOREIGN KEY (Técnico) REFERENCES técnico (idTécnico),
    FOREIGN KEY (Relatório_idRelatório) REFERENCES relatório (idRelatório)
); 
-- drop table if exists viagem; 

CREATE TABLE IF NOT EXISTS multimédia (
	idMultimédia varchar (45) primary key NOT NULL, 
    TipoFicheiro varchar (10) NOT NULL,
    Descrição varchar (100) NOT NULL, 
    PathFicheiro varchar (255) NOT NULL,
    Viagem Int NOT NULL, 
    FOREIGN KEY (Viagem) REFERENCES viagem (idViagem)
); 
-- drop table if exists multimédia; 







-- todos os drops: 
/* 
drop database if exists Tecwide;
drop table if exists chefe_Adm;
drop table if exists técnico; 
drop table if exists telemóvel; 
drop table if exists obra; 
drop table if exists relatório; 
drop table if exists viagem; 
drop table if exists multimédia; 
*/ 

