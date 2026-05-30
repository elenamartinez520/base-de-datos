create database  taquilla;
use taquilla;

create table Actores (
ID_Actor int auto_increment primary key,
Nombre varchar(15),
Apellido varchar(20)
);

create table Estudios (
ID_Estudio int auto_increment primary key,
Nombre varchar(25),
Direccion varchar(50),
AnioFundacion int(4)
);

create table Peliculas (
ID_Pelicula int auto_increment primary key,
Nombre varchar(100),
Tipo Varchar(30),
Duracion time, 
Anio int(4),
ID_Estudio int, 
foreign key (ID_Estudio) references Estudios(ID_Estudio)
);

create table Peliculas_Actores (
ID_Pelicula_Actor int auto_increment primary key,
ID_Pelicula int,
ID_Actor int,
foreign key (ID_Pelicula) references Peliculas(ID_Pelicula),
foreign key (ID_Actor) references Actores(ID_Actor)
);

insert into Actores(Nombre, Apellido) values 
('Carrie','Fisher'),
('Emilio','Estevez'),
('Martha','Scott');

insert into Estudios(Nombre, Direccion, AnioFundacion) values 
('Disney','Buena Vista','1923-10-16'),
('MGM','Hollywood','1924-08-01'),
('FOX','Hollywood','1915-04-16');

insert into Peliculas(Nombre, Tipo, Duracion, Anio, ID_Estudio) values 
('Star Wars','color','02:01:00',1977, 3),
('Mighty Ducks','color','01:46:22',1991,1),
('Ben hur','color','01:56:09',1959,2),
('El retorno de jedi','color','02:04:17',1983,3);

insert into Peliculas_Actores(ID_Pelicula, ID_Actor) values 
(1,1),
(2,2),
(3,3),
(4,1);