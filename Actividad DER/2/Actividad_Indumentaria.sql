create database Tienda_Ropa;
use Tienda_Ropa;

create table Categorias (
ID_Categoria int auto_increment primary key,
Tipo varchar(15)
);

create table Clientes (
ID_Cliente int auto_increment primary key,
Nombre varchar(15),
Apellido varchar(20),
Telefono varchar(15)
);

create table Vendedores (
ID_Vendedor int auto_increment primary key,
Nombre varchar(15),
Area varchar(20)
);

create table Productos (
ID_Producto int auto_increment primary key,
Nombre varchar(15),
precio decimal(10, 2),
Codigo varchar(10),
ID_Categoria int,
foreign key (ID_Categoria) references Categorias(ID_Categoria)
);

create table Ventas (
ID_Venta int auto_increment primary key,
Fecha datetime,
ID_Cliente int,
ID_Vendedor int,
ID_Producto int,
foreign key (ID_Cliente) references Clientes(ID_Cliente),
foreign key (ID_Vendedor) references Vendedores(ID_Vendedor),
foreign key (ID_Producto) references Productos(ID_Producto)
);

insert into Categorias(Tipo) values
('pantalones'),
('remeras'),
('Buzos');

insert into Clientes(Nombre,Apellido,Telefono) values
('Sofia','Gonzalez','1123345675'),
('Catalina','Gimenez','1134562345'),
('Christian','Gomez','1133445676');

insert into Vendedores(Nombre,Area) values
('Jorge','Ropa Masculina'),
('Camila','Ropa Femenina'),
('Jose','Ropa Femenina');

insert into Productos(Nombre,Precio,codigo, ID_Categoria) values
('Estella',10000,'345678455', 1),
('Luna',20000,'344566423', 2),
('Sol',34000,'384577324', 3);

insert into Ventas(Fecha, ID_Cliente,ID_Vendedor,ID_Producto) values
('2026-03-10',1,3, 1),
('2025-03-08',2,2, 2),
('2026-03-01',3,1, 3);