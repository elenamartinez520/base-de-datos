create database Clinica;
use Clinica;
create table Pacientes (
ID_Paciente int auto_increment primary key,
Nombre varchar(20),
Apellido varchar(20),
DNI int(8)
);
create table Especialidades (
ID_Especialidad int auto_increment primary key,
Nombre varchar(30)
);

create table Medicos(
ID_Medico int auto_increment primary key,
Nombre varchar(20),
Apellido varchar(20)
);

create table Especialidades_Medicos (
ID_Especialidad_Medico int auto_increment primary key,
ID_Medico int,
ID_Especialidad int,
foreign key (ID_Medico) references Medicos(ID_Medico),
foreign key (ID_Especialidad) references Especialidades(ID_Especialidad)
);

create table Turnos (
ID_Turno int auto_increment primary key,
Fecha date,
Horario time,
Estado Varchar(20),
ID_Especialidad int,
ID_Paciente int,
ID_Medico int,
foreign key (ID_Especialidad) references Especialidades(ID_Especialidad),
foreign key (ID_Paciente) references Pacientes(ID_Paciente),
foreign key (ID_Medico) references Medicos(ID_Medico)
);

insert into Pacientes (Nombre, Apellido, DNI) values
('Juan', 'Perez', 40123456),
('Maria', 'Gomez', 38987654),
('Lucas', 'Fernandez', 42111222);

insert into Especialidades (Nombre) values
('Cardiologia'),
('Pediatria'),
('Traumatologia');

insert into Medicos (Nombre, Apellido) values
('Carlos', 'Lopez'),
('Ana', 'Martinez'),
('Diego', 'Sanchez');

insert into Especialidades_Medicos (ID_Medico, ID_Especialidad) values
(1, 1),
(2, 2),
(3, 3);

insert into Turnos (Fecha, Horario, Estado, ID_Especialidad, ID_Paciente, ID_Medico) values
('2026-06-10', '09:00:00', 'Confirmado', 1, 1, 1),
('2026-06-11', '10:30:00', 'Pendiente', 2, 2, 2),
('2026-06-12', '15:00:00', 'Cancelado', 3, 3, 3);

SELECT Medicos.Nombre, Medicos.Apellido, Especialidades.Nombre
FROM Medicos, Especialidades, Especialidades_Medicos
WHERE Medicos.ID_Medico = Especialidades_Medicos.ID_Medico
AND Especialidades.ID_Especialidad = Especialidades_Medicos.ID_Especialidad;

SELECT *
FROM Turnos;