CREATE DATABASE TecChicken;
USE TecChicken;

CREATE USER 'Consultor'@'localhost'
IDENTIFIED BY '123';
-- GRANT ALL PRIVILEGES ON '.' TO 'Consultor'@'localhost'
FLUSH PRIVILEGES;
SELECT user FROM mysql.user;


CREATE TABLE Empresa(
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    CNPJ CHAR(14) UNIQUE,
    nomeEmpresa VARCHAR(50),
    telefone VARCHAR(15),
    email VARCHAR(50)
     );


CREATE TABLE Usuario (
     idUsuario INT PRIMARY KEY AUTO_INCREMENT,
     nomeUsuario VARCHAR(100),
     email VARCHAR(70),
     senha VARCHAR(20),
     fkEmpresa INT,
     FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
     ) AUTO_INCREMENT = 1000;


CREATE TABLE Granja (
     idGranja INT PRIMARY KEY AUTO_INCREMENT,
     CEP CHAR(8),
     UF CHAR(2),
     cidade VARCHAR(60),
     logradouro VARCHAR(60),
     numero VARCHAR(30),
     bairro VARCHAR(75),
     fkEmpresa INT,
     FOREIGN KEY(fkEmpresa) REFERENCES Empresa(idEmpresa)
     ) AUTO_INCREMENT = 7000;


CREATE TABLE Sensor (
     idSensor INT PRIMARY KEY AUTO_INCREMENT,
     tipoSensor VARCHAR(10) DEFAULT 'LM35',
     local VARCHAR (30) DEFAULT 'Sensor padrão',
     fkGranja INT,
     FOREIGN KEY(fkGranja) REFERENCES Granja(idGranja)
     ) AUTO_INCREMENT = 12000;


CREATE TABLE Captura (
     idCaptura INT AUTO_INCREMENT,
     fkSensor INT,
     FOREIGN KEY(fkSensor) REFERENCES Sensor(idSensor),
     temperatura DOUBLE DEFAULT '999',
     momentoCaptura DATETIME DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (idCaptura, fkSensor)
     );


INSERT INTO Empresa (CNPJ, nomeEmpresa, telefone, email) VALUES
     ('16963465000188', 'Popayos', '11955993105', 'popayos@popayos.com.br'),
     ('65940226000118', 'THC', '11980475409', 'TexasHealthChicken@thc.com.br'),
     ('22354119000103', 'Los Pollos primos','11960723657' , 'BreakingBadebom@lpp.com.br'); 


INSERT INTO Usuario (nomeUsuario, email, senha, fkempresa) VALUES
     ('Otávio da Silva', 'otavio.silva@popayos.com.br', 'renan&pedro', 1),
     ('Cintia Oliveira', 'cintia.oliveira@popayos.com.br','gatoamarelo', 1),
     ('Guilherme Henrique', 'guilherme.silva@popayos.com.br', '1234', 1),
     ('Paulo  Antunes', 'paulo.antunes@thc.com.br', 'oculosverdâ', 2),
     ('Sonia Andrade', 'sonia.andrade@thc.com.br', '250682', 2),
     ('Gertrudio Amaranto', 'gerruidio.amaranto@thc.com.br', 'tiaverinha', 2),
     ('Maria Rodrigues', 'maria.rodrigues@lpp.com.br', '23542m', 3),
     ('Priscila Barros', 'priscila.barros@lpp.com', 'senhadificil', 3);


INSERT INTO Granja (CEP, UF, cidade, logradouro, numero, bairro, fkEmpresa) VALUES
     ('04855275', 'SP', 'São Paulo', 'Avenida dos Lírios', '95', 'Jardim Belcito', 1),
     ('13487268', 'SP', 'Limeira', 'Rua Mário Ferraz', '3', 'Jardim Novo Horizonte', 2),
     ('06387000', 'SP', 'Carapicuíba', 'Rua Farão', '29', 'Parque Sampaio Viana', 3);


INSERT INTO Sensor (local, fkGranja) VALUES
     ('Isa Brown', 7000),
     ('Bovans White', 7000),
     ('Centro granja', 7001),
     ('Bovans & Isa', 7002);


INSERT INTO Captura (fkSensor, temperatura) VALUES
     (12000, 28.2),
     (12000, 29.3),
     (12000, 27.3),
     (12001, 17.2),
     (12001, 12.5),
     (12001, 16.0),
     (12002, 6.3),
     (12002, 10.3),
     (12002, 12.1),
     (12003, 32.9),
     (12003, 32.4),
     (12003, 31.4);


