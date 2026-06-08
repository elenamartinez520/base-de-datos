create database Control_Vuelos;
use Control_Vuelos;

create table Aviones (
ID_Avion int auto_increment primary key,
Modelo varchar(20),
Capacidad int
);

create table Pasajeros (
ID_Pasajero int auto_increment primary key,
Nombre varchar(20),
Apellido varchar(20),
DNI varchar(25)
);

create table Vuelos (
ID_Vuelo int auto_increment primary key,
Nro_Vuelo int,
Origen varchar(200),
Destino varchar(200),
Fecha_Vuelo date,
Horario time,
ID_Avion int,
foreign key (ID_Avion) references Aviones(ID_Avion)
);

create table Tickets (
ID_Tickets int auto_increment primary key,
Tipo varchar(15),
Precio decimal(10,2),
ID_Vuelo int,
ID_Pasajero int,
Foreign key (ID_Vuelo) references Vuelos(ID_Vuelo),
Foreign key (ID_Pasajero) references Pasajeros(ID_Pasajero)
);

insert into Aviones (Modelo, Capacidad) values
('Boeing 737', 180),
('Airbus A320', 200),
('Embraer 190', 120),
('Boeing 777', 350),
('Airbus A330', 300);

insert into Pasajeros (Nombre, Apellido, DNI) values
('Juan', 'Perez', '50160105'),
('Maria', 'Gomez', '23493832'),
('Lucas', 'Fernandez', '18293034'),
('Ana', 'Lopez', '34325869'),
('Sofia', 'Martinez', '84763478');

insert into Vuelos (Nro_Vuelo, Origen, Destino, Fecha_Vuelo, Horario, ID_Avion) values
(1001, 'EZEIZA', 'Madrid', '2026-05-15', '08:30:00', 1),
(1002, 'EZEIZA', 'Roma', '2026-05-20', '14:15:00', 2),
(1003, 'Cordoba', 'Mendoza', '2026-05-25', '10:00:00', 3),
(1004, 'EZEIZA', 'Miami', '2026-06-01', '22:45:00', 4),
(1005, 'Bariloche', 'Buenos Aires', '2026-06-03', '16:20:00', 5);

insert into Tickets (Tipo, Precio, ID_Vuelo, ID_Pasajero) values
('Economy', 800000, 1, 1),
('Economy', 850000, 1, 2),
('Business', 600000, 2, 3),
('Economy', 700000, 2, 4),
('First', 1200000, 4, 5);

select Aviones.Modelo, sum(Tickets.Precio) as TotalRecaudado, count(Tickets.ID_Pasajero) as TotalPasajeros
from Aviones
inner join Vuelos
on Aviones.ID_Avion=Vuelos.ID_Avion
inner join Tickets
on Vuelos.ID_Vuelo=Tickets.ID_Vuelo
group by Aviones.Modelo
having Sum(Tickets.Precio) > 2000000
and count(Tickets.ID_Pasajero) > 100;

select Vuelos.Nro_vuelo, avg(Tickets.Precio) 
from Vuelos 
inner join Tickets
on Vuelos.ID_Vuelo=Tickets.ID_Vuelo
where Vuelos.Origen = 'ezeiza'
group by Vuelos.Nro_Vuelo
Having avg(Tickets.Precio) > 500;

select Aviones.Modelo, count(Vuelos.ID_Vuelo) as Cantidad_Vuelos
from Aviones
inner join Vuelos
on Vuelos.ID_Avion=Aviones.ID_Avion
where Vuelos.Fecha_Vuelo between '2026-05-01' and '2026-05-31'
group by Aviones.Modelo
having count(Vuelos.ID_Vuelo)>50;
