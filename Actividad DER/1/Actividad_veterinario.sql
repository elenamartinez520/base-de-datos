create database Clinica;
use Clinica;

create table Veterinarios (
ID_Veterinario int auto_increment primary key,
Nombre varchar(20),
Apellido varchar(20),
Telefono varchar(15),
especialidad varchar(20)
);

create table Duenios(
ID_Duenio int auto_increment primary key,
Nombre varchar(15),
Apellido varchar(20),
Direccion varchar(50),
Telefono  varchar(10)
);

create table Mascotas(
ID_Mascota int auto_increment primary key,
Nombre varchar(15),
Tipo varchar(15),
Tamanio varchar(15),
Edad int(2),
sexo enum ('femenino', 'masculino'), 
Color varchar(10),
ID_Duenio int,
foreign key (ID_Duenio) references Duenios(ID_Duenio)
);

create table Consultas (
ID_Consulta int auto_increment primary key,
Fecha date,
diagnostico text,
ID_Veterinario int,
ID_Mascota int,
foreign key (ID_Veterinario) references Veterinarios(ID_Veterinario),
foreign key (ID_Mascota) references Mascotas(ID_Mascota)
);


insert into Veterinarios(Nombre, Apellido, Telefono, Especialidad) values
('Roberto','Martinez','11423345656','Odontologo'),
('Gabriel','Uriarte','1144132788','Nutriologo'),
('Julieta','Espinoza','1144145634','Clinico');

insert into Duenios(Nombre, Apellido, Direccion, Telefono) values
('Fernando','Martinez','Belgano 1232' ,'1166574829'),
('Mauricio','Alvarez','Santos Lugares 3435','1199382773'),
('Lucas','Velasco','Moreno 1342','1123849302');
 
insert into Mascotas(Nombre, Tipo, Tamanio, Edad, Sexo, Color, ID_Duenio) values
('Rocket','Canino','pequeño', 2 , 'Masculino','Blanco',1),
('Loqui','Canino','mediano',8 , 'Masculino','Marron',2),
('Coqui','Canino','mediano',10, 'Masculino','Negro',3);
insert into Consultas(Fecha, Diagnostico, ID_Veterinario, ID_Mascota) values
('2026-03-21','diarrea',2 ,1),
('2026-03-10','ortitis',3 , 2),
('2026-03-05','indisgestion',1 ,3);

