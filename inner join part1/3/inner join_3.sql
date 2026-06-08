create database Tecnologia;
use Tecnologia;

create table Categorias (
ID_Categoria int auto_increment primary key,
Nombre varchar(20)
);

create table Productos (
ID_Producto int auto_increment primary key,
Nombre varchar(35),
Modelo varchar(35),
Marca varchar(15),
Precio decimal(10, 2),
ID_Categoria int,
foreign key (ID_Categoria) references Categorias(ID_Categoria)
);

create table Detalles_ventas (
ID_Detalle_Venta int auto_increment primary key,
Precio_uni decimal(10,2),
Cantidad int,
ID_Producto int,
foreign key (ID_Producto) references Productos(ID_Producto)
);

insert into Categorias(Nombre) values
('Celulares'),
('Notebooks'),
('Tablets'),
('Monitores'),
('Accesorios');

insert into Productos(Nombre, Modelo, Marca, Precio, ID_Categoria) values
('Galaxy S24', 'S24', 'Samsung', 12000, 1),
('ThinkPad E14', 'E14', 'Lenovo', 1800, 2),
('iPad Air', 'Air M2', 'Apple', 1500, 3),
('UltraGear', '27GN800', 'LG', 650, 4),
('Mouse Gamer', 'G203', 'Logitech', 45, 5);

insert into Detalles_Ventas(Precio_uni, Cantidad, ID_Producto) values
(12000, 450, 1),
(1800, 600, 2),
(1500, 3, 3),
(650, 1, 4),
(45, 5, 5);

select Categorias.Nombre,sum(Detalles_Ventas.Cantidad) as Total_Vendido
from Categorias
inner join Productos
on Categorias.ID_Categoria = Productos.ID_Categoria
inner join Detalles_Ventas
on Productos.ID_Producto = Detalles_Ventas.ID_Producto
group by Categorias.Nombre
having sum(Detalles_Ventas.Cantidad) > 500;

select Categorias.Nombre, avg(Productos.Precio) as Promedio_Precio,sum(Detalles_Ventas.Cantidad) as Productos_Vendidos
from Categorias 
inner join Productos 
on Categorias.ID_Categoria = Productos.ID_Categoria
inner join Detalles_ventas 
on Productos.ID_Producto = Detalles_Ventas.ID_Producto
group by Categorias.Nombre
having avg(Productos.Precio) > 1500
and sum(Detalles_ventas.Cantidad) >= 10;

select Categorias.Nombre,sum(Detalles_Ventas.Precio_uni * Detalles_Ventas.Cantidad) as Recaudacion
from Categorias 
inner join Productos 
on Categorias.ID_Categoria = Productos.ID_Categoria
inner join Detalles_ventas 
on Productos.ID_Producto = Detalles_Ventas.ID_Producto
where Productos.Precio < 100
group by Categorias.Nombre
having SUM(Detalles_ventas.Precio_uni * Detalles_Ventas.Cantidad) < 5000;

