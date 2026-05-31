drop database Campeonato;
create database Campeonato;
use Campeonato;
create table Equipos (
ID_Equipo int auto_increment primary key,
Nombre varchar(30),
Ciudad varchar(30)
);

create table Estadios (
ID_Estadio int auto_increment primary key,
Nombre varchar(30),
Ciudad_Estadio varchar(30),
Capacidad int
);

create table Jugadores (
ID_Jugador int auto_increment primary key,
Nombre varchar(20),
Apellido varchar(20),
Posicion varchar(20),
ID_Equipo int,
foreign key (ID_Equipo) references Equipos(ID_Equipo)
);

create table Partidos (
ID_Partido int auto_increment primary key,
fecha datetime, 
Estado varchar(20),
ID_Estadio int,
foreign key (ID_Estadio) references Estadios(ID_Estadio)
);

create table Partidos_Equipos (
ID_Partidos_Equipo int auto_increment primary key,
Postura varchar(10),
Goles int,
Resultado varchar(10),
ID_Partido int,
ID_Equipo int,
foreign key (ID_Partido) references Partidos(ID_Partido),
foreign key (ID_Equipo) references Equipos(ID_Equipo)
);
INSERT INTO Equipos (Nombre, Ciudad) VALUES
('River Plate', 'Buenos Aires'),
('Boca Juniors', 'Buenos Aires'),
('Racing Club', 'Avellaneda');

INSERT INTO Estadios (Nombre, Ciudad_Estadio, Capacidad) VALUES
('Monumental', 'Buenos Aires', 84000),
('La Bombonera', 'Buenos Aires', 57000),
('Presidente Peron', 'Avellaneda', 55000);

INSERT INTO Jugadores (Nombre, Apellido, Posicion, ID_Equipo) VALUES
('Franco', 'Armani', 'Arquero', 1),
('Edinson', 'Cavani', 'Delantero', 2),
('Gabriel', 'Rojas', 'Defensor', 3);

INSERT INTO Partidos (Fecha, Estado, ID_Estadio) VALUES
('2026-05-10 18:00:00','Jugado', 1),
('2026-05-17 20:30:00','Suspendido' ,2),
('2026-05-24 16:00:00','Jugado' ,3);

INSERT INTO Partidos_Equipos (Postura, Goles, Resultado, ID_Partido, ID_Equipo) VALUES
('Local', 2, 'Ganador', 1, 1),
('Visitante', 1, 'Perdedor', 1, 2),
('Local', 0, 'Empate', 2, 3);

select * from Partidos
where Estado = 'Jugado';
select Nombre, Apellido, Posicion
from Jugadores;

