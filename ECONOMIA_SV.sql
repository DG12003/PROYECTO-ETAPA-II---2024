-- =============================================================================
-- Author:		<GRUPO 4>
-- Create date: <09-06-2024>
-- Description:	<Base de Datos de Economia de El Salvador>
-- ============================================================================
USE Master
GO
--------------------------------------------------------------------------------
/*
Creamos la BD + Habilitacion de Carpeta Filestream, para guardar archivos
*/
CREATE DATABASE ECONOMIA_SV
ON
PRIMARY ( NAME = Arch1,
    FILENAME = 'C:\BD_HDP_2024\archdat1.mdf'),
FILEGROUP FileStreamGroup1 CONTAINS FILESTREAM ( NAME = Arch3,
    FILENAME = 'C:\BD_HDP_2024\filestream1')
LOG ON  ( NAME = Archlog1,
    FILENAME = 'C:\BD_HDP_2024\archlog1.ldf')
GO
-----------------------------------------------------------------------------
USE  ECONOMIA_SV
GO
/*
Creamos la tabla que llevara el contenido y registros de los archivos
*/
CREATE TABLE TB_INPUT_DOC
(
    [Id] [uniqueidentifier] ROWGUIDCOL NOT NULL UNIQUE, 
    [SerialNumber] INTEGER UNIQUE,
    [Chart] VARBINARY(MAX) FILESTREAM NULL
);
GO
-- =============================================================================
-- CREAMOS LA TABLAS EN DONDE ALMACENAREMOS LA INFORMACION
-- =============================================================================
CREATE TABLE  TB_ECONOMIA(
ID_ECO INT NOT NULL PRIMARY KEY ,
FEC_ORG DATE NOT NULL,
ID_SAL INT NOT NULL,
ID_HOG INT NOT NULL,
ID_EMP INT NOT NULL,
ID_GOB INT NOT NULL
)
GO
CREATE TABLE TB_SALARIO(
ID_SAL INT NOT NULL PRIMARY KEY ,
FEC_ORG_SAL DATE NOT NULL,
CANT_SAL MONEY NOT NULL
)
GO
CREATE TABLE  TB_HOGAR(
ID_HOG INT NOT NULL PRIMARY KEY ,
ING_HOG MONEY NOT NULL,
GAS_HOG MONEY NOT NULL,
INT_HOG INT NOT NULL,
FEC_ORG DATE NOT NULL, 
)
CREATE TABLE  TB_EMPRESA(
ID_EM INT NOT NULL PRIMARY KEY,
ING_VEN_EM MONEY NOT NULL,
REM_EM MONEY NOT NULL,
EMPL_ACT_EMP INT NOT NULL,
FEC_ORG DATE NOT NULL
)
CREATE TABLE  TB_GOBIERNO(
ID_GOB INT NOT NULL PRIMARY KEY,
ING_GOB MONEY NOT NULL,
GAS_GOB MONEY NOT NULL,
SUB_GOB MONEY NOT NULL,
FEC_ORG DATE NOT NULL, 
)
-- =============================================================================
--CREAMOS LA INTEGRIDAD REFERENCIA PK y FK
-- =============================================================================
--FK ECONOMIA | SALARIO
-- =============================================================================
-- CREAMOS FK
ALTER TABLE [dbo].[TB_ECONOMIA] WITH NOCHECK
ADD CONSTRAINT FK_ECONOMIA_SALARIO_IDSAL FOREIGN KEY(ID_SAL)
REFERENCES [dbo].[TB_SALARIO] (ID_SAL)
GO
-- ACTIVAMOS FK
ALTER TABLE [dbo].[TB_ECONOMIA]
CHECK CONSTRAINT FK_ECONOMIA_SALARIO_IDSAL
-- =============================================================================
--FK ECONOMIA | HOGAR
-- =============================================================================
-- CREAMOS FK
ALTER TABLE [dbo].[TB_ECONOMIA] WITH NOCHECK
ADD CONSTRAINT FK_ECONOMIA_HOGAR_IDHOG FOREIGN KEY(ID_HOG)
REFERENCES [dbo].[TB_HOGAR] (ID_HOG)
GO
-- ACTIVAMOS FK
ALTER TABLE [dbo].[TB_ECONOMIA]
CHECK CONSTRAINT FK_ECONOMIA_HOGAR_IDHOG
-- =============================================================================
--FK ECONOMIA | EMPRESA
-- =============================================================================
-- CREAMOS FK
ALTER TABLE [dbo].[TB_ECONOMIA] WITH NOCHECK
ADD CONSTRAINT FK_ECONOMIA_GOBIERNO_IDEM FOREIGN KEY(ID_EMP)
REFERENCES [dbo].[TB_EMPRESA] (ID_EM)
GO
-- ACTIVAMOS FK
ALTER TABLE [dbo].[TB_ECONOMIA]
CHECK CONSTRAINT FK_ECONOMIA_EMPRESA_IDEM
-- =============================================================================
--FK ECONOMIA | GOBIERNO
-- =============================================================================
ALTER TABLE [dbo].[TB_ECONOMIA] WITH NOCHECK
ADD CONSTRAINT FK_ECONOMIA_GOBIERNO_IDGOB FOREIGN KEY(ID_GOB)
REFERENCES [dbo].[TB_GOBIERNO] (ID_GOB)
GO
-- ACTIVAMOS FK
ALTER TABLE [dbo].[TB_ECONOMIA]
CHECK CONSTRAINT FK_ECONOMIA_GOBIERNO_IDGOB
-- =============================================================================