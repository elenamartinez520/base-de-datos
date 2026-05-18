drop database veterinaria;
create database Veterinaria;
Use Veterinaria;
create table veterinarios (
id_veterinario int auto_increment primary key,
nombre varchar(20) not null,
apellido varchar(20) not null,
telefono varchar(20) not null,
especialidad varchar(30) not null
);

create table duenios (
id_duenio int auto_increment primary key,
nombre varchar(20),
apellido varchar(20) not null,
direccion varchar(100) not null,
telefono varchar(30) not null
);

create table mascotas (
id_mascota int auto_increment primary key,
nombre varchar(20) not null,
tipo varchar(20),
tamanio varchar(13),
edad int not null,
sexo ENUM('F', 'M') not null,
color varchar(13),
id_duenio int,
foreign key (id_duenio) references duenios(id_duenio)
);
create table consultas (
id_consulta int auto_increment primary key,
fecha date,
diagnostico text,
id_veterinario int,
id_mascota int,
FOREIGN KEY (id_veterinario) REFERENCES veterinarios(id_veterinario),
FOREIGN KEY (id_mascota) REFERENCES mascotas(id_mascota)
);
INSERT INTO veterinarios (nombre, apellido, telefono, especialidad)
VALUES 
('Juan', 'Perez', '1122345634', 'Cirugia'),
('Ana', 'Lopez', '1123478910', 'cardiologia');
INSERT INTO duenios (nombre, apellido, direccion, telefono)
VALUES 
('Carlos', 'Gomez', 'Calle 123', '1121451111'),
('Maria', 'Fernandez', 'Av 456', '1134222222');
INSERT INTO mascotas (nombre, tipo, tamanio, edad, sexo, color, id_duenio)
VALUES 
('estrella', 'Perro', 'Mediano', 5, 'M', 'Marron', 1),
('luna', 'Gato', 'Pequeño', 3, 'F', 'Blanco', 2);
INSERT INTO consultas (fecha, diagnostico, id_veterinario, id_mascota)
VALUES 
('2026-04-20', 'Control general', 1, 1),
('2026-04-21', 'Vacunacion', 2, 2);


