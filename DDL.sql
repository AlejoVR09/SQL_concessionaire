create database concesionario;
use concesionario;

create table domicilio (
	id int primary key auto_increment, 
    calle varchar(3), 
    carreara varchar(3), 
    numero varchar(3)
);

drop table domicilio;

create table empresa (
	nit int primary key auto_increment, 
    name varchar(30),
    domicilio int,
    constraint foreign key (domicilio) references domicilio(id)
);


create table concesionario (
	nit int primary key, 
    constraint foreign key (nit) references empresa(nit)
);

drop table concesionario;

create table servicio (
	nit int primary key, 
    constraint foreign key (nit) references empresa(nit),
	concesionario int, 
    constraint foreign key (concesionario) references concesionario(nit)
);

drop table servicio;

create table marca (
	nit int auto_increment primary key,
    name varchar(30)
);

drop table marca;

create table vehiculo (
	id int primary key auto_increment, 
    name varchar(20),
    localizacion int, 
    constraint foreign key (localizacion) references empresa(nit),
    marca int,
    constraint foreign key (marca) references marca(nit),
    modelo int,
    constraint foreign key (modelo) references modelo(id)
);

drop table vehiculo;


drop table localizacion_vehiculo;

create table modelo (
	id int auto_increment primary key,
    paq_serie int,
    constraint foreign key (paq_serie) references paquete_serie(id),
    paq_ext int,
    constraint foreign key (paq_ext) references paquete_extra(id)
);

drop table modelo;

create table tecnico_modelo (
	id int auto_increment primary key,
    modelo int,
    constraint foreign key (modelo) references modelo(id),
    tecnico int,
    constraint foreign key (tecnico) references tecnico(id)
);

drop table tecnico_modelo;

create table tecnico (
	id int auto_increment primary key,
	name varchar(30)
);

drop table tecnico;

create table paquete_serie (
	id int auto_increment primary key
);

create table paquete_extra (
	id int auto_increment primary key
);

create table serie_comp (
	id int auto_increment primary key,
    paq_serie int,
    constraint foreign key (paq_serie) references paquete_serie(id),
    componente int,
    constraint foreign key (componente) references componente(id)
);

create table extra_comp (
	id int auto_increment primary key,
    paq_ext int,
    constraint foreign key (paq_ext) references paquete_extra(id),
    componente int,
    constraint foreign key (componente) references componente(id)

);

create table componente (
	id int auto_increment primary key,
    name varchar(30),
    precio int
);

drop table componentes;