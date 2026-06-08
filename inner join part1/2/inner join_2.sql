drop database Gestion_gym;
create database Gestion_gym;
use Gestion_gym;

create table Socios (
ID_Socio int auto_increment primary key,
Nombre varchar(15),
Apellido varchar(20),
Edad int(2),
Telefono varchar(15),
Contacto_Emergencia varchar(15),
Fecha_alta date
);

create table Planes (
ID_Plan int auto_increment primary key,
Tipo varchar(25),
Costo decimal(10,2)
);

create table Pagos (
ID_Pago int auto_increment primary key,
Fecha datetime,
ID_Socio int,
ID_Plan int,
foreign key (ID_Socio) references Socios(ID_Socio),
foreign key (ID_Plan) references Planes(ID_Plan)
);
insert into Socios(Nombre, Apellido, Edad, Telefono, Contacto_Emergencia, Fecha_alta) values
('Juan', 'Perez', 25, '1122334455', '1199988877', '2025-01-10'),
('Maria', 'Gomez', 30, '1133445566', '1188877766', '2025-02-15'),
('Lucas', 'Fernandez', 19, '1144556677', '1177766655', '2025-03-20'),
('Ana', 'Lopez', 27, '1155667788', '1166655544', '2025-04-05'),
('Sofia', 'Martinez', 35, '1166778899', '1155544433', '2025-05-12');

insert into Planes(Tipo, Costo) values
('Basico', 15000),
('Musculacion', 20000),
('Premium', 30000),
('Crossfit', 25000),
('Personalizado', 40000);

insert into Pagos(Fecha, ID_Socio, ID_Plan) values
('2025-01-10 10:00:00', 1, 2),
('2025-02-15 11:30:00', 1, 2),
('2025-03-20 09:15:00', 1, 2),
('2025-04-05 18:00:00', 1, 2),
('2025-05-12 17:45:00', 5, 1),
('2025-02-15 11:30:00', 2, 2),
('2025-03-20 09:15:00', 3, 3),
('2025-04-05 18:00:00', 4, 4),
('2025-05-12 17:45:00', 5, 5);

select Socios.Nombre, count(Pagos.ID_Pago), sum(Planes.Costo) 
from Socios 
inner join Pagos 
on Socios.ID_Socio = Pagos.ID_Socio
inner join Planes 
on Pagos.ID_Plan = Planes.ID_Plan
group by Socios.ID_Socio, Socios.Nombre
having sum(Planes.Costo) > 30000;

select Planes.Tipo, sum(Planes.Costo) as Recaudado, count(Pagos.ID_Socio)  
from Planes
inner join Pagos
on Pagos.ID_Plan = Planes.ID_Plan
group by Planes.Tipo
having count(Pagos.ID_Socio) > 50
and sum(Planes.Costo) > 100000;

select Socios.Nombre,Planes.Tipo,count(Pagos.ID_Pago) 
from Socios 
inner join Pagos 
on Socios.ID_Socio = Pagos.ID_Socio
Inner join Planes 
on Pagos.ID_Plan = Planes.ID_Plan
group by Socios.Nombre, Planes.Tipo
having count(Pagos.ID_Pago) > 3;
