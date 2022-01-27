-- Tablas
-- - Cursos
--      Id          1
--      Titulo      SQL Básico
--      Duracion
--      Importe
-- - Empresas
--      Id      17
--      Nombre  Manpower
--      CIF
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
) ENGINE INNODB; 

-- Tablas
CREATE TABLE Empresas (
    Id SMALLINT NOT NULL PRIMARY KEY,               -- 2 byte
    Nombre VARCHAR(100) NOT NULL,
    CIF CHAR(10) NOT NULL               -- 10 caracteres... y en bytes, cuanto es?
                                        -- Depende... de qué? Del juego de 
                                        -- caracteres con el que haya creado la BBDD
                                        -- UFT-8? 10 bytes - 40 bytes (En este caso 10)
                                        -- UFT-16? 20 bytes
) ENGINE INNODB;

CREATE TABLE Personas (
    Id INT NOT NULL PRIMARY KEY,                    -- 4 bytes
    Nombre VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    DNI INT NOT NULL UNIQUE,
    Email VARCHAR(100),
    EmpresaId SMALLINT,
    FOREIGN KEY (EmpresaId) REFERENCES Empresas(Id)
) ENGINE INNODB;

CREATE TABLE Inscripciones (
    CursoId SMALLINT NOT NULL,
    PersonaId INT NOT NULL,
    Fecha DATE NOT NULL,
    Aprobado BOOLEAN,
    PRIMARY KEY (CursoId, PersonaId),    -- Esa combinación debe ser única... 
                                        -- es la clave de la tabla
    FOREIGN KEY (CursoId) REFERENCES Cursos(Id),
    FOREIGN KEY (PersonaId) REFERENCES Personas(Id)
) ENGINE INNODB;

-- DATOS

INSERT INTO Cursos (Id,Titulo,Duracion,Importe) 
    VALUES ( 1, "SQL Basico", 20, "1000.05");
INSERT INTO Cursos (Id,Titulo,Duracion, Importe) 
    VALUES ( 2, "Horticultura", 17, 800.05);
INSERT INTO Cursos (Id,Titulo,Duracion, Importe) 
    VALUES ( 3, "Python Básico", 60, 1353.50);
INSERT INTO Cursos (Id,Titulo,Duracion, Importe) 
    VALUES ( 4, "Netflix Avanzado", 50, 8500.99);
INSERT INTO Cursos (Id,Titulo,Duracion, Importe) 
    VALUES ( 5, "SQL Medio", 20, 1000.05);
INSERT INTO Cursos (Id,Titulo,Duracion, Importe) 
    VALUES ( 6, "JAVA Básico", 50, 995);
INSERT INTO Cursos (Id,Titulo,Duracion, Importe) 
    VALUES ( 7, "PHP Basico", 35, 2000.05);
INSERT INTO Cursos (Id,Titulo,Duracion, Importe)
    VALUES ( 8 , "Access Basico" , 20 , 500.00 );
INSERT INTO Cursos (Id,Titulo,Duracion, Importe) 
    VALUES ( 9, "Cobol", 80, 1000.05);
INSERT INTO Cursos (Id, Titulo,Duracion, Importe) 
    VALUES ( 10, "SQL Básico", 20, 1000.05);
INSERT INTO Cursos (Id,Titulo,Duracion, Importe) 
    VALUES ( 11, "Curso bicicleta", 30, 3000.00);



INSERT INTO Empresas (Id,Nombre, CIF) 
    VALUES ( 1, "Manpower", "A12345678");
INSERT INTO Empresas (Id,Nombre, CIF) 
    VALUES ( 2, "Flower Power", "B765098777");
INSERT INTO Empresas (Id,Nombre, CIF) 
    VALUES ( 3, "IBM", "Y8968960");
INSERT INTO Empresas (Id,Nombre, CIF) 
    VALUES ( 4, "MatSoft", "A69435871");
INSERT INTO Empresas (Id,Nombre, CIF) 
    VALUES ( 5, "Oracle", "A12345678");
INSERT INTO Empresas (Id,Nombre, CIF) 
    VALUES ( 6, "Kyndryl", "A6532653");
INSERT INTO Empresas (Id,Nombre, CIF) 
    VALUES ( 7, "Filemon", "B89101112");
INSERT INTO Empresas (Id,Nombre, CIF)
    VALUES ( 8 , "Mortadelo" , "A1445555" );
INSERT INTO Empresas (Id, Nombre, CIF) 
    VALUES ( 9, "ITNOW", "A12345678");
INSERT INTO Empresas (Id, Nombre, CIF) 
    VALUES ( 10, "Esperis", "A12345678");
INSERT INTO Empresas (Id,Nombre, CIF) 
    VALUES ( 11, "BICICLETA", "A12345666");


INSERT INTO Personas (Id,Nombre, Apellidos, DNI, Email, EmpresaId) 
    VALUES ( 1, "Iván", "Osuna Ayuste", 23000, "ivan.osuna.ayuste@gmail.com", NULL );
INSERT INTO Personas (Id,Nombre, Apellidos, DNI, Email, EmpresaId) 
    VALUES ( 2, "Mario", "Novi Rod", 00296666, "novirod@gmail.com", 7);
INSERT INTO Personas (Id,Nombre, Apellidos, DNI, Email) 
    VALUES ( 3, "Juan", "Garcia Garcia", 2346800, "Juan.Garcia@gmail.com");
INSERT INTO Personas (Id,Nombre, Apellidos, DNI, Email, EmpresaId) 
    VALUES ( 4, "Mateusz Aleksander", "Duda", 3694485, "mateusz.aleksander@gmail.com", 2);
INSERT INTO Personas (Id,Nombre, Apellidos, DNI, Email, EmpresaId) 
    VALUES ( 5, "Manuel", "Cantos Sanjuan", 7777777, "mcantos@gmail.com", 1);
INSERT INTO Personas (Id,Nombre, Apellidos, DNI, Email, EmpresaId) 
    VALUES ( 6, "Marta", "Pérez Arribas", 05844692, "marta.perez.arribas@gmail.com", NULL);
INSERT INTO Personas (Id,Nombre, Apellidos, DNI, Email, EmpresaId) 
    VALUES ( 7, "Vicente", "Codina Soler", 30000, "vcs@gmail.com", 3);
INSERT INTO Personas (Id,Nombre, Apellidos, DNI, Email, EmpresaId)
    VALUES ( 8 , "Pedro" , "Oviedo Miedo" , 665444, "Oviedo.Miedo@pepe.es" , 1 );
INSERT INTO Personas (Id, Nombre, Apellidos, DNI, Email, EmpresaId) 
    VALUES ( 9, "Manuel", "Cantos Sanjuan", 77771177, "mcantos@gmail.com", 1);
INSERT INTO Personas (Id, Nombre, Apellidos, DNI, Email, EmpresaId) 
    VALUES ( 10, "Luis", "Antonio", 2300120, "primeragl@gmail.com", 5);
INSERT INTO Personas (Id,Nombre, Apellidos, DNI, Email, EmpresaId) 
    VALUES ( 11, "Mateo", "Libra", 71620135, "Reparar.bici@gmail.com", 2);






INSERT INTO Inscripciones (CursoId, PersonaId, Fecha, Aprobado) 
    VALUES (1, 1, "2021-11-21", 1);
INSERT INTO Inscripciones (CursoId, PersonaId, Fecha, Aprobado) 
    VALUES (2, 2, "2021-10-30", 1);
INSERT INTO Inscripciones (CursoId, PersonaId, Fecha, Aprobado) 
    VALUES (1, 3, "2022-12-30", 1);
INSERT INTO Inscripciones (CursoId, PersonaId, Fecha, Aprobado) 
    VALUES (1, 4, "2022-01-20", 1);
INSERT INTO Inscripciones (CursoId, PersonaId, Fecha, Aprobado) 
    VALUES (4, 4, "2022-01-24", 0);
INSERT INTO Inscripciones (CursoId, PersonaId, Fecha, Aprobado) 
    VALUES (1, 5, "2021-10-23", 1);
INSERT INTO Inscripciones (CursoId, PersonaId, Fecha, Aprobado) 
    VALUES (1, 6, "2021-12-05", 0);
INSERT INTO Inscripciones (CursoId, PersonaId, Fecha, Aprobado) 
    VALUES (1, 7, "2022-01-23", 1);
INSERT INTO Inscripciones (CursoId, PersonaId, Fecha, Aprobado)
    VALUES (8 , 1 , "2021-12-31" , 1 );
INSERT INTO Inscripciones (CursoId, PersonaId, Fecha, Aprobado) 
    VALUES (10, 2, "2021-11-12", 1);
INSERT INTO Inscripciones (CursoId, PersonaId, Fecha, Aprobado) 
    VALUES (11, 11, "2022-04-12", 1);
INSERT INTO Inscripciones (CursoId, PersonaId, Fecha, Aprobado) 
    VALUES (1, 11, "2022-01-05", 0);

CREATE INDEX IDX_Nombres ON Personas(Nombre);