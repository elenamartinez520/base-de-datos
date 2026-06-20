create database Veterinaria;
use Veterinaria;

create table Duenios (
ID_Duenio int auto_increment primary key,
Nombre varchar(20),
Apellido varchar(20),
DNI int(8),
Telefono varchar(15)
);

create table Veterinarios (
ID_Veterinario int auto_increment primary key,
Nombre varchar(20),
Apellido varchar(20),
Turno enum ('Mañana','Tarde','Noche'),
Especialidad varchar(35),
Legajo varchar(20)
);

create table Mascotas (
ID_Mascota int auto_increment primary key,
Nombre varchar(20),
Especie varchar(40),
Edad int(2),
Raza varchar(30),
Tamanio varchar(20),
ID_Duenio int,
foreign key (ID_Duenio) references Duenios(ID_Duenio)
);

create table Turnos(
ID_Turno int auto_increment primary key,
Fecha date,
Horario time,
Motivo text,
ID_Mascota int,
ID_Veterinario int,
foreign key (ID_Mascota) references Mascotas(ID_Mascota),
foreign key (ID_Veterinario) references Veterinarios(ID_Veterinario)
);

insert into Duenios(Nombre, Apellido, DNI, Telefono) values
('Federico','Suarez',50160105,'1134563454'),
('Isabela','Garcia','34665323','1127884413');
insert into Veterinarios(Nombre, Apellido, Turno, Especialidad, Legajo) values
('Rodrigo','Fernandez','Mañana','Nutriologo','v-4553'),
('Ricardo','gonzalez','Tarde','Cardiologia','v-3442');
insert into Mascotas(Nombre, Especie,Edad,Raza,Tamanio, ID_Duenio) values
('Estrella','Perro',3,'rotwiller','Mediano', 1),
('Luna','Gato',10,'Siames','Mediano', 2);
insert into Turnos(Fecha,Horario,Motivo,ID_Mascota,ID_Veterinario) values
('2026-03-21','09:10:00','Control de peso', 2,1),
('2026-05-23','16:30:00','Chequeo diario', 1,2);

select * 
from Mascotas;

select Nombre, Apellido
from Duenios;

select Turnos.Fecha, Turnos.Horario, Turnos.Motivo, Mascotas.Nombre, Veterinarios.Apellido 
from Turnos , Mascotas , Veterinarios 
where turnos.ID_Mascota = Mascotas.ID_Mascota 
and Turnos.ID_Veterinario = Veterinarios.ID_Veterinario
and Turnos.Fecha > '2024-05-01';

