/*
Created: 07-05-2024
Modified: 07-05-2024
Model: Microsoft SQL Server 2017
Database: MS SQL Server 2017
*/


-- Create tables section -------------------------------------------------

-- Table Persona

CREATE TABLE [Persona]
(
 [id_persona] Int IDENTITY(1,1) NOT NULL,
 [nombre_1] Varchar(50) NOT NULL,
 [nombre_2] Varchar(50) NULL,
 [apellido_1] Varchar(50) NOT NULL,
 [apellido_2] Varchar(50) NULL,
 [rut] Char(1) NULL,
 [id_sexo] Int NULL,
 [Attribute1] Int NULL
)
go

-- Create indexes for table Persona

CREATE INDEX [IX_Relationship2] ON [Persona] ([id_sexo])
go

CREATE INDEX [IX_Relationship4] ON [Persona] ([Attribute1])
go

-- Add keys for table Persona

ALTER TABLE [Persona] ADD CONSTRAINT [PK_Persona] PRIMARY KEY ([id_persona])
go

-- Table Sexo

CREATE TABLE [Sexo]
(
 [id_sexo] Int IDENTITY(1,1) NOT NULL,
 [nom_genero] Varchar(50) NOT NULL
)
go

-- Add keys for table Sexo

ALTER TABLE [Sexo] ADD CONSTRAINT [PK_Sexo] PRIMARY KEY ([id_sexo])
go

-- Table Nacionalidad

CREATE TABLE [Nacionalidad]
(
 [id_pais] Int IDENTITY(1,1) NOT NULL,
 [Pais] Varchar(50) NOT NULL
)
go

-- Add keys for table Nacionalidad

ALTER TABLE [Nacionalidad] ADD CONSTRAINT [PK_Nacionalidad] PRIMARY KEY ([id_pais])
go

-- Table Usuario

CREATE TABLE [Usuario]
(
 [id_usuario] Int IDENTITY(1,1) NOT NULL,
 [nom_user] Varchar(50) NOT NULL,
 [gerencia] Varchar(50) NOT NULL,
 [id_persona] Int NULL
)
go

-- Create indexes for table Usuario

CREATE INDEX [IX_Relationship5] ON [Usuario] ([id_persona])
go

-- Add keys for table Usuario

ALTER TABLE [Usuario] ADD CONSTRAINT [PK_Usuario] PRIMARY KEY ([id_usuario])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [Persona] ADD CONSTRAINT [Relationship2] FOREIGN KEY ([id_sexo]) REFERENCES [Sexo] ([id_sexo]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Persona] ADD CONSTRAINT [Relationship4] FOREIGN KEY ([Attribute1]) REFERENCES [Nacionalidad] ([id_pais]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Usuario] ADD CONSTRAINT [Relationship5] FOREIGN KEY ([id_persona]) REFERENCES [Persona] ([id_persona]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




