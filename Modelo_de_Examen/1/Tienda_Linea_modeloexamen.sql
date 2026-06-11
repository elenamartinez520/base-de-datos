drop database Tienda_linea;
create database Tienda_linea;
use Tienda_linea;

create table Productos (
ID_Productos int auto_increment primary key,
Nombre varchar(20),
Descripcion text,
Precio decimal(10, 2),
Stock_disponible int
);

create table Clientes (
ID_Cliente int auto_increment primary key,
Nombre varchar(15),
Apellido varchar(20),
Correo_electronico varchar(30),
Direccion varchar(50)
);

create table Pedidos (
ID_Pedido int auto_increment primary key,
Fecha_Pedido datetime,
Estado enum('Pendiente', 'En proceso', 'Enviado', 'Entregado'),
ID_Cliente int,
foreign key (ID_Cliente) references Clientes(ID_Cliente)
);


insert into Productos (Nombre, Descripcion, Precio, Stock_disponible) values
('collar gris','Hermoso collar gris con diamantes material fantasia',60,50),
('anillo rosa','Hermoso anillo con diamante rosa material fantasia', 80, 60),
('pulsera rosa japonesa', 'dorado con flores rosas, colores brillantes hecho de material fantasia',30, 90),
('vincha blanca','Especial para peinados faciles color blanca de material algodon, resistente', 90, 100),
('aritos diamantes', 'Especial para ocasiones brillantes de material fantasia',49,70);
insert into Clientes (Nombre, Apellido, Correo_electronico, Direccion) values
('Carlos','Gozalez', 'carlos.gonzalez@gmail.com', 'belgrano234'),
('Christina','Barrio', 'Christina.Barrio@gmail.com','Urquiza847'),
('Josefina', 'Gomez', 'josefina.gomez@gmail.com','Guido Spano364'),
('Sofia','Alvarez','sofia.alvarez123@gmail.com', 'santotomoe8485'),
('Valentina','Flores','valentina.flores@gmail.com', 'Haedo476');
insert into Pedidos (Fecha_pedido, Estado, ID_Cliente) values
('2026-05-24 12:30:35', 'Enviado', 1),
('2026-07-22 12:56:23', 'En proceso', 2),
('2026-04-12 15:26:32','Entregado', 3),
('2026-08-23 18:30:24','Pendiente',4 ),
('2026-09-16 19:00:00', 'Pendiente', 5),
('2026-09-14 18:00:00', 'Pendiente', 5);

select Nombre, Precio
From Productos
where precio>50;

select Clientes.Nombre, count(Pedidos.ID_Pedido)
from Clientes
inner join Pedidos
on Clientes.ID_Cliente = Pedidos.ID_Cliente
group by Clientes.nombre
having  count(Pedidos.ID_Pedido) >1;

select Pedidos.Estado, Clientes.nombre, Pedidos.Fecha_pedido 
from Pedidos
inner join Clientes
on Clientes.ID_Cliente = Pedidos.ID_Cliente
where Pedidos.Estado='Entregado';

select Pedidos.Estado, Clientes.Correo_electronico
from Pedidos
inner join Clientes
on Clientes.ID_Cliente = Pedidos.ID_Cliente;

select Clientes.Nombre, Pedidos.Fecha_pedido
from Pedidos
inner join Clientes
on Pedidos.ID_Cliente = Clientes.ID_Cliente
order by Pedidos.Fecha_pedido desc
limit 1; 

select Pedidos.Estado, Clientes.nombre, Pedidos.Fecha_pedido 
from Pedidos
inner join Clientes
on Clientes.ID_Cliente = Pedidos.ID_Cliente
where Pedidos.Estado='Pendiente';

select Nombre, Precio
from Productos
order by Precio desc
limit 1; 