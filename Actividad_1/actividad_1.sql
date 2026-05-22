create database Empresa;
use Empresa;

create table Empleados(
IDEmpleado Int auto_increment primary key not null,
Nombre varchar(18),
Apellido varchar(20) not null,
Sector enum("ADM" , "VENTAS" , "COMPRAS" , "RRHH" ),
Edad int(2) not null Default 35,
Sexo  enum("F" , "M" ),
Barrio_vivienda varchar(20) Default "BELGRANO" ,
Codpos Int(4),
Ingreso Year not null,
Sueldo float not null,
Antiguedad float not null Default 250,
Celular varchar(15) not null
);



INSERT INTO Empleados (Nombre, Apellido, Sector, Edad, Sexo, Barrio_Vivienda, Codpos, Ingreso, Sueldo, Antiguedad, Celular) VALUES
('Juan', 'Perez', 'ADM', 40, 'M', 'Belgrano', 1428, 2011, 85000.50, 500, '1144132788'),
('Maria', 'Garcia', 'RRHH', 30, 'F', 'Almagro', 1178, 2011, 90000.00, 300, '1144146278'),
('Pedro', 'Lopez', 'RRHH', 28, 'M', 'Flores', 1406, 2011, 88000.75, 250, '1134471289'),
('Ana', 'Martinez', 'VENTAS', 35, 'F', 'Belgrano', 1428, 2011, 75000.00, 400, '1123456789'),
('Carlos', 'Rodriguez', 'COMPRAS', 45, 'M', 'Flores', 1406, 2011, 95000.00, 600, '1162376893'),
('Lucia', 'Fernandez', 'RRHH', 22, 'F', 'Belgrano', 1428, 2015, 82000.00, 250, '1198387393'),
('Diego', 'Gomez', 'ADM', 50, 'M', 'Almagro', 1178, 2010, 110000.00, 800, '1123874727'),
('Sofia', 'Diaz', 'VENTAS', 26, 'F', 'Flores', 1406, 2012, 72000.00, 250, '1135649092'),
('Jorge', 'Sanchez', 'COMPRAS', 38, 'M', 'Almagro', 1178, 2014, 89000.00, 350, '1123849203'),
('Elena', 'Ruiz', 'RRHH', 33, 'F', 'Almagro', 1178, 2018, 92000.00, 250, '1132859402'),
('Miguel', 'Torres', 'ADM', 29, 'M', 'Flores', 1406, 2019, 87000.00, 250, '1135646782'),
('Laura', 'Suarez', 'VENTAS', 31, 'F', 'Almagro', 1178, 2020, 78000.00, 250, '1138492038'),
('Roberto', 'Castro', 'COMPRAS', 42, 'M', 'Flores', 1406, 2021, 94000.00, 250, '1132693845'),
('Patricia', 'Morales', 'ADM', 37, 'F', 'Almagro', 1178, 2022, 88000.00, 250, '1198348724'),
('Oscar', 'Herrera', 'VENTAS', 25, 'M', 'Flores', 1406, 2023, 70000.00, 250, '1129847478');



Select Nombre, Apellido From Empleados
Where Barrio_vivienda = 'Belgrano';

select Apellido, edad from Empleados
Where Ingreso = 2010 or Ingreso =2011 or Ingreso=2012;

select Nombre,Apellido,edad from Empleados 
where Sexo = 'F' and Sector = 'RRHH';

select Apellido, Sector, Celular from Empleados;

select Nombre, Apellido, Sueldo from Empleados
Where Barrio_vivienda = 'Almagro' or Barrio_vivienda = 'Flores'
order by Apellido Desc;

select count(*) AS Total_empleados from Empleados;

select apellido, edad from Empleados
order by edad desc limit 1;
select nombre, apellido, edad from Empleados
order by edad asc limit 1;

select edad from Empleados;

select edad from Empleados 
where Sector = 'RRHH';