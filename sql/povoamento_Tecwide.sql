-- ----------------------------------------------------
-- Povoamento da base de dados da Tecwide 
-- ----------------------------------------------------

USE Tecwide; 


-- tabela chefe_Adm 
INSERT INTO chefe_Adm (Nome, Email, Cargo) VALUES
('João Ferreira', 'joao.f@tecwide.pt', 'Chefe do setor de Produção/Obras'), -- id 1
('Ana Silva', 'ana.s@tecwide.pt', 'Administrador'),                         -- id 2
('Carlos Pereira', 'carlos.p@tecwide.pt', 'Gerente Financeiro'),            -- id 3
('Sofia Neves', 'sofia.n@tecwide.pt', 'Chefe de Recursos Humanos'),         -- id 4 
('Ricardo Costa', 'ricardo.c@tecwide.pt', 'Assistente Administrativo');     -- id 5 


-- tabela técnico 
INSERT INTO técnico (Nome, Email) VALUES
('Marta Gomes', 'marta.g@tecwide.pt'),   -- id 1
('Rui Oliveira', 'rui.o@tecwide.pt'),    -- id 2
('Ana Mendes', 'ana.m@tecwide.pt'),      -- id 3
('Tiago Soares', 'tiago.s@tecwide.pt'),  -- id 4
('Lúcia Pinto', 'lucia.p@tecwide.pt'),   -- id 5
('Hugo Silva', 'hugo.s@tecwide.pt');     -- id 6


-- tabela telemóvel
INSERT INTO telemóvel (Contacto, técnico_idTécnico) VALUES
('+351 912 345 678', 1), 
('+351 978 654 321', 2), 
('+351 960 000 000', 3), 
('+351 921 111 111', 4), 
('+351 932 222 222', 5), 
('+351 945 777 258', 1); -- mesmo id (atributo multi-valor) 


-- tabela obra
INSERT INTO obra (País, Cidade, Tipo_Obra, Estágio, DataConclusao, Chefe_Adm, Técnico) VALUES
('Portugal', 'Braga', 'Infraestrutura', 'concluído', '2025-12-05', 1, 1), -- id 1 (fk's: C1, T1)
('França', 'Toulouse', 'Edificação', 'inicial', NULL, 2, 3),                 -- id 2 (fk's: C2, T3)
('Espanha', 'Madrid', 'Ponte', 'intermédio', NULL, 3, 4),                     -- id 3 (fk's: C3, T4)
('Alemanha', 'Berlim', 'Aeroporto', 'intermédio', NULL, 4, 5),                -- id 4 (fk's: C4, T5)
('Portugal', 'Porto', 'Central Eólica', 'concluído', '2025-11-20', 5, 6);   -- id 5 (fk's: C5, T6)


-- tabela relatório 
INSERT INTO relatório (ConteúdoRelatório, DataHoraRegisto, Técnico) VALUES
('Escavação concluída hoje, com a betonagem do bloco central a iniciar-se sem desvios do plano.', '2025-11-12 15:36:02', 1),
('Atraso na entrega do material impactou a instalação de amanhã mas foram alocadas tarefas alternativas.', '2025-12-12 13:46:51', 2),
('Inspeção de segurança semanal concluída. Encontrados pequenos desvios nos EPIs, corrigidos no local.', '2025-12-15 09:00:00', 3),
('Reunião com fornecedores sobre o atraso do aço. Nova data de entrega agendada para dia 20.', '2025-12-16 10:30:00', 4),
('Registo fotográfico da finalização da montagem das vigas principais no piso 5.', '2025-12-17 14:45:00', 5);


-- tabela viagem 
INSERT INTO viagem (MeioTransporte, CustoTotal, Lingua_local, DataViagem, Obra, Técnico, Relatório_idRelatório) VALUES
('Táxi', 1234.50, 'inglês', '2025-10-06', 1, 1, 1),    -- id 1 (fks: O1, T1, R1)
('Uber', 678.34, 'francês', '2025-06-14', 2, 2, 2),    -- id 2 (fks: O2, T2, R2)
('Comboio', 85.50, 'espanhol', '2025-12-15', 3, 4, 3), -- id 3 (fks: O3, T4, R3)
('Avião', 450.00, 'alemão', '2025-12-16', 4, 5, 4),    -- id 4 (fks: O4, T5, R4)
('Carro', 45.00, 'português', '2025-11-20', 5, 6, 5);  -- id 5 (fks: O5, T6, R5)
 

-- tabela multimédia 
INSERT INTO multimédia (idMultimédia, TipoFicheiro, Descrição, PathFicheiro, Viagem) VALUES
('v123', 'mp4', 'laje do terceiro piso', 'Tecwide/viagens/v123.mp4', 1),
('f11', 'png', 'escavação concluída', 'Tecwide/viagens/f11.png', 2),
('f20', 'jpg', 'Inspeção do guindaste', 'Tecwide/viagens/h20.jpg', 3),
('v10', 'mov', 'Plano de montagem', 'Tecwide/viagens/g10.mov', 4),
('f15', 'bmp', 'Teste de resistência', 'Tecwide/viagens/j15.bpm', 5); 






-- caso haja necessidade de apagar todos os dados das tabelas: 
/* 
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE chefe_Adm;
TRUNCATE TABLE técnico; 
TRUNCATE TABLE telemóvel; 
TRUNCATE TABLE obra; 
TRUNCATE TABLE relatório; 
TRUNCATE TABLE viagem;
TRUNCATE TABLE multimédia; 
SET FOREIGN_KEY_CHECKS = 1;
*/ 