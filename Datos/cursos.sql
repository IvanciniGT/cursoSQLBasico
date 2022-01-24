-- Tablas
-- - Cursos
--      Id          1
--      Titulo      SQL Básico
--      Duracion
--      Importe
-- - Personas
--      Id
--      Nombre      Lucas, Trini
--      Apellidos
--      DNI
--      Email
--      Empresa.Id     17
-- - Inscripciones
--      Curso.Id
--      Persona.Id
--      Fecha
--      Aprobado
-- - Empresas
--      Id      17
--      Nombre  Manpower
--      CIF

-- ¿Cómo se si una persona pertenece a una empresa u otra?
--      Tipo de relación: 1 Empresa - N Personas
-- ¿Cómo se si una persona está apuntada o ha hecho un curso o no?
--      Tipo de relación: N Curso - M Persona

--  Empresas
--      Id      Nombre      CIF
--      17      Manpower    B2985472

--  Personas
--      Id  Empresa     Nombre  Apellidos   DNI     Email
--      1   17          Lucas ..........................
--      2   17          Trini ..........................

--  Cursos
--      Id      Titulo          Duración    Importe
--      1       SQL Basico      20 horas    1789€
--      2       SQL Avanzado    20 horas    1789€

--  Inscripciones
--      Curso.Id    Persona.Id      Fecha               Aprobado
--      1           1               10-octubre-2021     SI
--      1           2               18-octubre-2021     SI
--      2           2               29-octubre-2021     SI
--CREATE DATABASE Formacion;
--USE Formacion;

-- CLAVES!
-- Restricciones sobre los valores que podemos poner en una determinada columna
-- Constrains
--  - UNIQUE
--  - PRIMARY KEY - El campo de una tabla que actua de identificador
--  - FOREIGN KEY - El valor de un campo de una tabla debe existir 
--                  en otro campo de una tabla: Relaciones
-- Tablas
CREATE TABLE Cursos (
    Id SMALLINT NOT NULL PRIMARY KEY,               -- 2 byte
    Titulo VARCHAR(100) NOT NULL,
    Duracion TINYINT NOT NULL,          -- 1 byte
    Importe DOUBLE (6,2) NOT NULL       -- 9999.99
);

-- Tablas
CREATE TABLE Empresas (
    Id SMALLINT NOT NULL PRIMARY KEY,               -- 2 byte
    Nombre VARCHAR(100) NOT NULL,
    CIF CHAR(10) NOT NULL               -- 10 caracteres... y en bytes, cuanto es?
                                        -- Depende... de qué? Del juego de 
                                        -- caracteres con el que haya creado la BBDD
                                        -- UFT-8? 10 bytes - 40 bytes (En este caso 10)
                                        -- UFT-16? 20 bytes
);

CREATE TABLE Personas (
    Id INT NOT NULL PRIMARY KEY,                    -- 4 bytes
    Nombre VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    DNI INT NOT NULL UNIQUE,
    Email VARCHAR(100),
    EmpresaId SMALLINT FOREIGN KEY REFERENCES Empresas(Id)
);

CREATE TABLE Inscripciones (
    CursoId SMALLINT NOT NULL FOREIGN KEY REFERENCES Cursos(Id),
    PersonaId SMALLINT NOT NULL FOREIGN KEY REFERENCES Personas(Id),
    Fecha DATE NOT NULL,
    Aprobado BOOLEAN,
    PRIMARY KEY (CursoId, PersonaId)    -- Esa combinación debe ser única... 
                                        -- es la clave de la tabla
);

-- DATOS

INSERT INTO Cursos (Id,Titulo,Duracion Importe) 
    VALUES ( 1, "SQL Básico", 20, 1000.05);

INSERT INTO Empresas (Id,Nombre, CIF) 
    VALUES ( 1, "Manpower", "A12345678");

INSERT INTO Personas (Id,Nombre, Apellidos, DNI, Email, EmpresaId) 
    VALUES ( 1, "Iván", "Osuna Ayuste", 23000, "ivan.osuna.ayuste@gmail.com", 1);

INSERT INTO Inscripciones (CursoId, PersonaId, Fecha, Aprobado) 
    VALUES (1, 1, "10/30/2021", 1);