insert into domicilio (calle, carreara, numero) values ('1','1','1');
insert into domicilio (calle, carreara, numero) values ('5','15','17');

insert into empresa (name, domicilio) values ("Autolarte central", 1);
insert into empresa (name, domicilio) values ("Autolarte central service", 2);

insert into concesionario (nit) values (1);
insert into servicio (nit, concesionario) values (2,1);

insert into marca (name) values ('Toyota');

insert into vehiculo (name, localizacion) values ('supra', 1);
insert into vehiculo (name, localizacion) values ('supra_r', 1);
insert into vehiculo (name, localizacion) values ('supra_rtx', 2);


insert into modelo (paq_serie, paq_ext) values 
	(1, 2),
    (2, 1);
    
insert into tecnico_modelo (modelo, tecnico) values
	(1, 1),
    (1, 2);

insert into tecnico (name) values 
	('Motor V8'),
    ('Frenos gucci'),
    ('Motor V6'),
    ('Turbo');

insert into paquete_serie () values 
	(),
    ();

insert into serie_comp (paq_serie, componente) values 
	(1, 1),
    (1, 2);

insert into paquete_extra () values 
	(),
    ();

insert into extra_comp (paq_ext, componente) values 
	(1, 4),
    (1, 5);

insert into componente (name, precio) values 
	('airbag', 1000),
    ('luces led', 2000),
    ('extintor', 500),
    ('llantas lujo', 5000),
    ('exploradoras',2500);
    
    
select * from empresa;
select * from concesionario;
select * from paquete_serie;
select * from serie_comp;
select * from paquete_extra;
select * from extra_comp;
select * from componente;

SELECT *
FROM vehiculo v
LEFT JOIN consecionario c ON v.localizacion = c.nit
LEFT JOIN servicio s ON v.localizacion = s.nit;