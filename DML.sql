insert into domicilio (calle, carreara, numero) values ('1','1','1');
insert into domicilio (calle, carreara, numero) values ('5','15','17');
insert into domicilio (calle, carreara, numero) values ('3','1','20');

insert into empresa (name, domicilio) values ("Autolarte central", 1);
insert into empresa (name, domicilio) values ("Autolarte Oriente", 3);
insert into empresa (name, domicilio) values ("Autolarte central service", 2);
insert into empresa (name, domicilio) values ("Autolarte medio service", 3);

insert into concesionario (nit) values (1);
insert into concesionario (nit) values (4);
insert into servicio (nit, concesionario) values (2,1);

insert into marca (name) values ('Toyota');

insert into vehiculo (name, precio, localizacion, marca, modelo) values ('supra',1000, 1, 1, 1);
insert into vehiculo (name, precio, localizacion, marca, modelo) values ('supra',2000, 1, 1, 2);
insert into vehiculo (name, precio, localizacion, marca, modelo) values ('nissan gtr',1000, 2, 1, 1);
insert into vehiculo (name, precio, localizacion, marca, modelo) values ('nissan gtr',1000, 4, 1, 1);


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
    
    
insert into medio_pago (name) values
	('Contado'),
    ('Credito - Bancolombia');
    
insert into vendedor (name, nit, domicilio) values 
	('Alejo', 1,3),
    ('Camilo', 2,3);
    
insert into venta (vehiculo, vendedor, medio_pago) values (1,1,1);
    
insert into venta_componente (importado, extra, venta) values 
    (true,2,1),
    (false,1,1);

select * from empresa;
select * from concesionario;
select * from servicio;
select * from paquete_serie;
select * from serie_comp;
select * from paquete_extra;
select * from extra_comp;
select * from componente;
select * from vehiculo;
select * from tecnico;
select * from tecnico_modelo;
select * from modelo;
select * from marca;
select * from venta;
select * from venta_componente;


-- Query para saber la cantidad de vehiculos en total por localizacion
select COUNT(*) as vehiculos ,localizacion
from vehiculo, empresa where vehiculo.localizacion = empresa.nit
group by vehiculo.localizacion;

-- Query para saber la cantidad de vehiculos de los concesionarios
select COUNT(*) as vehiculos , localizacion
from vehiculo right join concesionario on vehiculo.localizacion = concesionario.nit
where vehiculo.localizacion is not null
group by vehiculo.localizacion;

-- Query para saber la cantidad de vehiculos de los servicios oficiales
select COUNT(*) as vehiculos , localizacion
from vehiculo right join servicio on vehiculo.localizacion = servicio.nit
group by vehiculo.localizacion;

-- Query para ver el precio de un vehiculo
select sum(vehiculo.precio) from venta, vehiculo
where venta.vehiculo=vehiculo.id;

-- Query para saber el precio de lo componentes extras
select precio from venta_componente as vc
inner join extra_comp as xc on vc.extra=xc.id
inner join componente as c on c.id=xc.componente