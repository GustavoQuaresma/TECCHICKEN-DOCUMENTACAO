CREATE TABLE empresa(
    idEmpresa INT IDENTITY(1, 1) PRIMARY KEY,
    CNPJ CHAR(14),
    nomeEmpresa VARCHAR(50),
    telefone VARCHAR(15),
    email VARCHAR(50),
    pagante TINYINT DEFAULT 0
);

CREATE TABLE usuario(
    idUsuario INT IDENTITY(1000, 1),
    nomeUsuario VARCHAR(100),
    email VARCHAR(70),
    senha VARCHAR(20),
    fkEmpresa INT,
    tipoUsuario TINYINT DEFAULT 0,
    PRIMARY KEY (idUsuario),
    FOREIGN KEY(fkEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE granja(
    idGranja INT IDENTITY(7000, 1),
    CEP CHAR(8),
    UF CHAR(2),
    cidade VARCHAR(60),
    logradouro VARCHAR(60),
    numero VARCHAR(30),
    bairro VARCHAR(75),
    fkEmpresa INT,
    PRIMARY KEY (idGranja),
    FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE sensor (
    idSensor INT IDENTITY(12000, 1),
    tipoSensor VARCHAR(10) DEFAULT 'LM35',
    localSensor VARCHAR(30) DEFAULT 'default place',
    fkGranja INT,
    PRIMARY KEY (idSensor),
    FOREIGN KEY (fkGranja) REFERENCES granja(idGranja)
);

CREATE TABLE captura (
    idCaptura INT IDENTITY(1,1),
    temperatura DECIMAL,
    momentoCaptura datetime DEFAULT CURRENT_TIMESTAMP,
    fkSensor INT,
    PRIMARY KEY (idCaptura, fkSensor),
    FOREIGN KEY(fkSensor) REFERENCES sensor(idSensor)
);

-- Add a new column '[NewColumnName]' to table '[TableName]' in schema '[dbo]'
ALTER TABLE [dbo].[usuario]
    ADD [tipoUsuario] /*new_column_name*/ TINYINT /*new_column_datatype*/ NULL /*new_column_nullability*/ DEFAULT 0
GO
SELECT * fROM dbo.captura;


INSERT INTO Empresa (CNPJ, nomeEmpresa, telefone, email) VALUES
     ('16963465000188', 'Popayos', '11955993105', 'popayos@popayos.com.br'),
     ('65940226000118', 'THC', '11980475409', 'TexasHealthChicken@thc.com.br'),
     ('22354119000103', 'Los Pollos primos','11960723657' , 'BreakingBadebom@lpp.com.br'); 

SELECT * FROM empresa;

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

INSERT INTO Sensor (localSensor, fkGranja) VALUES
     ('Isa Brown', 7000),
     ('Bovans White', 7000),
     ('Centro granja', 7001),
     ('Bovans & Isa', 7002);

SELECT * FROM captura;
SELECT * FROM usuario;
SELECT * FROM granja;
SELECT * FROM empresa;
DELETE FROM usuario WHERE idUsuario = 1008;

DELETE FROM granja WHERE idGranja = 7003;
