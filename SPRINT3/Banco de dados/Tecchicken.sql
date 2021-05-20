CREATE TABLE empresa(
    idEmpresa INT IDENTITY(1, 1) PRIMARY KEY,
    CNPJ CHAR(14),
    nomeEmpresa VARCHAR(50),
    telefoneEmpresa VARCHAR(15),
    email VARCHAR(50)
);

CREATE TABLE usuario(
    idUsuario INT IDENTITY(1000, 1),
    nomeUsuario VARCHAR(100),
    email VARCHAR(70),
    senha VARCHAR(20),
    fkEmpresa INT,
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

