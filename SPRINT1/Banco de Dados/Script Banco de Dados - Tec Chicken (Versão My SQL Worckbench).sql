create database tecchicken;
use tecchicken;

-- Criação da tabela cliente, com os campos: id, nome, cpf, telefone, email e senha.
create table cliente(
idCliente int primary key auto_increment,
Nome varchar (40) not null,
CPF char (11) not null,
Telefone varchar (50) not null,
Email varchar (50) not null,
Senha varchar (50) not null
);

-- Criação da tabela sensor, com os campos: id, tipoSensor, temperatura e diaTemp. 
create table sensor(
idSensor int primary key auto_increment,
tipoSensor varchar (10),
temperatura varchar (20),
diaTemp datetime default current_timestamp,
check (tipoSensor = 'LM35'));

-- Criação da tabela granja, com os campos: id, logradouro, complemento, cidade, cep e estado.
create table granja(
idGranja int primary key auto_increment,
logradouro varchar (50),
complemento varchar (50),
cidade varchar (40),
cep char (8),
estado varchar (40));

-- Inserindido dados na tabela cliente.
insert into cliente values (null, 'João Silva', '45120114785','11 - 958412565','joaosilva@gmail.com','102030'), 
(null,'Mariana','50007415245','11 - 965201532','mariana@gmail.com','212223'),
            (null,'Marcelo Lima','72185844410','11 - 972065128','marcelolima@gmail.com','424344');

-- Inserindido dados na tabela sensor.          
insert into sensor (idSensor, tipoSensor, temperatura) values
            (null, 'LM35', '21ºC'),
            (null, 'LM35', '18ºC'),
            (null, 'LM35', '30ºC');
            
-- Inserindido dados na tabela granja.
insert into granja values 
            (null, 'Marques', 'Rua', 'São Paulo', '08055854', 'São Paulo' ),
            (null, 'Taquaras', 'Rua', 'São Paulo', '08047842', 'Iguape' ),
            (null, 'Bagdá', 'Rua', 'Belo Horizonte', '08014785', 'Minas Gerais' );

-- Comando para mostrar a tabela cliente.
select * from cliente;

-- Comando para mostrar a tabela sensor.
select * from sensor;
          
-- Comando para mostrar a tabela granja.
select * from granja;
