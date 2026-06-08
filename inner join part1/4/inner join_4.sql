create database Consorcio;
use Consorcio;

create table Edificios (
ID_Edificio int auto_increment primary key,
Nombre varchar(20),
Direccion varchar(40)
);

create table Unidades (
ID_Unidad int auto_increment primary key,
Nro_piso int,
ID_Edificio int,
foreign key (ID_Edificio) references Edificios(ID_Edificio)
);

create table Expensas (
ID_Expensa int auto_increment primary key,
ID_Unidad int,
Estado varchar(20),
Monto decimal(10,2),
foreign key (ID_Unidad) references Unidades(ID_Unidad)
);

insert into Edificios (Nombre, Direccion) values
('Torre Norte', 'Av. San Martin 123'),
('Torre Sur', 'Belgrano 456'),
('Las Flores', 'Rivadavia 789'),
('Los Robles', 'Mitre 321'),
('Altos del Sol', 'Sarmiento 654');

insert into Unidades (Nro_piso, ID_Edificio) values
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(1,2),
(2,2),
(1,3),
(1,4),
(1,5);
insert into Expensas (ID_Unidad, Estado, Monto) values
(1,'Pagada',25000),
(2,'Pendiente',30000),
(3,'Pendiente',200000),
(4,'Pendiente',180000),
(5,'Pendiente',170000),
(6,'Pendiente',160000),
(7,'Pendiente',300000),
(8,'Pagada',45000),
(9,'Pagada',28000),
(10,'Pagada',55000),
(11,'Pagada',32000),
(12,'Pagada',60000);
select Edificios.Nombre,sum(Expensas.Monto) as Total_Deuda,count(Unidades.ID_Unidad) as Unidades_Mora
from Edificios 
inner join Unidades 
on Edificios.ID_Edificio = Unidades.ID_Edificio
inner join Expensas 
on Unidades.ID_Unidad = Expensas.ID_Unidad
where Expensas.Estado = 'Pendiente'
group by Edificios.Nombre
having sum(Expensas.Monto) > 1000000
and count(Unidades.ID_Unidad) > 5;

select Edificios.Nombre,
       avg(Expensas.Monto) as Promedio_Expensas
from Edificios 
inner join Unidades 
on Edificios.ID_Edificio = Unidades.ID_Edificio
inner join Expensas 
on Unidades.ID_Unidad = Expensas.ID_Unidad
where Expensas.Estado = 'Pagada'
group by Edificios.Nombre
having avg(Expensas.Monto) >= 20000;

select Edificios.Nombre, sum(Expensas.Monto) as Recaudacion
from Edificios 
inner join Unidades 
on Edificios.ID_Edificio = Unidades.ID_Edificio
inner join Expensas 
on Unidades.ID_Unidad = Expensas.ID_Unidad
where Expensas.Estado = 'Pagada'
group by Edificios.Nombre
order by sum(Expensas.Monto) desc
limit 3;