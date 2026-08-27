Drop database Carniceria;
create database Carniceria;
use Carniceria;

create table Carniceros(
ID_Carnicero int auto_increment primary key,
Nombre varchar(20),
Apellido varchar(35),
DNI int(8)
);

create table Categorias(
ID_Categoria int auto_increment primary key,
Nombre varchar(20)
);
create table Productos(
ID_Producto int auto_increment primary key,
Corte varchar(50),
Precio decimal(10,2),
ID_Categoria int,
foreign key (ID_Categoria) references Categorias(ID_Categoria)
);

create table Clientes(
ID_Cliente int auto_increment primary key,
Nombre varchar(20),
Apellido varchar(30),
Telefono varchar(10)
);

create table Medios_Pagos(
ID_Medio_Pago int auto_increment primary key,
Nombre varchar(20)
);

create table Ventas(
ID_Venta int auto_increment primary key,
ID_Medio_Pago int,
ID_Cliente int,
ID_Carnicero int,
ID_Producto int, 
foreign key (ID_Medio_Pago) references Medios_Pagos(ID_Medio_Pago),
foreign key (ID_Cliente) references Clientes(ID_Cliente),
foreign key (ID_Carnicero) references Carniceros(ID_Carnicero),
foreign key (ID_Producto) references  Productos(ID_Producto)
);

create table Ventas_Productos(
ID_Venta_Producto int auto_increment primary key,
ID_Venta int,
ID_Producto int,
foreign key(ID_Venta) references Ventas(ID_Venta),
foreign key(ID_Producto) references Productos(ID_Producto)
);
insert into Carniceros(Nombre, Apellido,DNI) values
("Jeremias","Montiel",90128490),
("Facundo","Moron",30493494),
("Rodrigo","Martinez",12738127);
insert into Categorias(Nombre) values
("Carne de Pollo"),
("Carne de Vaca"),
("Carne de Cerdo");
insert into Productos(Corte, Precio, ID_Categoria)values
("Cuadrada",20000.00,3),
("Paleta",23000.00,1),
("Carne Picada",34000.00,2);

insert into Clientes(Nombre, Apellido,Telefono) values
("Sofia","Gimenez","1134567890"),
("Josefina","Hernandez","1123435674"),
("Claudia","Sheinbaum","1123436876");
insert into Medios_Pagos(Nombre) values
("Efectivo"),
("Transferencia"),
("Tarjeta");
insert into Ventas(ID_Medio_Pago,ID_Cliente, ID_Carnicero,ID_Producto) values
(1,1,1,1),
(2,2,2,2),
(3,3,3,3),
(2,1,3,3);
insert into Ventas_Productos(ID_Venta,ID_Producto) values
(1,1),
(2,2),
(3,3),
(4,3);

select Productos.Corte,count(Ventas_Productos.ID_Producto), Categorias.Nombre  -- primero se toma en cuenta la carne mas vendido, el tipo de carne o el corte la encontramos en categoria o productos y necesitamos saber cuanto se vendio por eso vamos a ventas entonces se combina categoria y ventas y productos
from Ventas_Productos
inner join Productos
on Ventas_Productos.ID_Producto=Productos.ID_Producto -- conectamos ventas_productos a productos, para luego hacerlo con categorias 
inner join Categorias 
on Productos.ID_Categoria=Categorias.ID_Categoria
group by productos.ID_Producto,Productos.Corte,Categorias.Nombre
order by count(Ventas_Productos.ID_Producto) desc
limit 1;

select Clientes.Nombre, count(Ventas.ID_Venta)
from Ventas
inner join Clientes
on Ventas.ID_Cliente= Clientes.ID_Cliente
group by Clientes.Nombre, Ventas.ID_Cliente
order by count(Ventas.ID_Venta) desc 
limit 1;


select Carniceros.Nombre, count(Ventas.ID_Cliente)
from Ventas
inner join Carniceros
on Carniceros.ID_Carnicero=Ventas.ID_Carnicero
group by  Carniceros.Nombre
order by count(Ventas.ID_Cliente) desc
limit 1;

select Clientes.Nombre, Productos.Corte, Carniceros.Nombre
from Ventas
inner join Clientes
on Ventas.ID_Cliente = Clientes.ID_Cliente
inner join Productos
on Ventas.ID_Producto = Productos.ID_Producto
inner join Carniceros
on Ventas.ID_Carnicero = Carniceros.ID_Carnicero
where Productos.Precio = (
    select max(Precio)
    from Productos
);

select Productos.corte, count(Ventas_Productos.ID_Venta)
from Ventas_Productos
inner join Productos
on Productos.ID_Producto=Ventas_Productos.ID_Producto
group by Productos.Corte
order by count(Ventas_Productos.ID_Venta) desc
limit 1;
