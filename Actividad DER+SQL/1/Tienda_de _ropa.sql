drop database Tienda_Ropa;
create database Tienda_Ropa;
use Tienda_Ropa;
create table Clientes(
ID_Cliente int auto_increment primary key,
Nombre varchar(15),
Apellido varchar(20),
Direccion varchar(50),
Telefono varchar(15),
Email varchar(70)
);

create table Vendedores (
ID_Vendedor int auto_increment primary key,
Nombre varchar(20),
Apellido varchar(20),
Antiguedad int(2)
);
create table Repartidores (
ID_Repartidor int auto_increment primary key,
Nombre varchar(20),
Apellido varchar(20),
Telefono varchar(15)
);


create table Productos (
ID_Producto int auto_increment primary key,
Categoria varchar(20),
Color varchar(15),
Talle varchar(15),
Tela varchar(15),
Precio_uni decimal(10,2)
);

create table Pedidos (
ID_Pedido int auto_increment primary key,
Estado varchar(50),
ID_Cliente int,
foreign key (ID_Cliente) references Clientes(ID_Cliente)
);

create table Ventas ( 
ID_Venta int auto_increment primary key,
fecha date,
Tipo_Factura text,
ID_Vendedor int,
ID_Repartidor int,
ID_Pedido int,
foreign key (ID_Vendedor) references Vendedores(ID_Vendedor),
foreign key (ID_Repartidor) references Repartidores(ID_Repartidor),
foreign key (ID_Pedido) references Pedidos(ID_Pedido)
);

create table Pedidos_Productos ( 
ID_Pedido_Producto int auto_increment primary key,
ID_Pedido int,
ID_Producto int,
cantidad int,
foreign key (ID_Pedido) references Pedidos(ID_Pedido),
foreign key (ID_Producto) references Productos(ID_Producto)
);


insert into Clientes(Nombre, Apellido, Direccion, Telefono, Email) values
('Isabela','Gomez','2345 Haedo','1126344567','isabela.gomez@gmail.com'),
('Julieta','Gonzalez','2345 Belgrano','1145639858','julieta.gonzalez@gmail.com'),
('Jose','Perez','9087 Cabildo','1136472536','jose.perez@gmail.com');
insert into Vendedores(Nombre, Apellido,Antiguedad) values
('Jeremias','Alvarez',3),
('Tomas','Martinez',10),
('Sofia','Barrio',2);
insert into Repartidores(Nombre, Apellido,Telefono) values
('Julian','Gutierrez','1123447687'),
('Pedro','Huerta','1156749298'),
('Analia','Castro','1132489042');
insert into Productos(Categoria, Color, Talle, Tela, Precio_uni) values
('Remera','Rojo','S','Algodon',10500),
('Pantalon','Gris','X','Poliester',20000),
('Calzado','Negro','36','Cuero',35090.56);
insert into Pedidos(Estado, ID_Cliente) values
('Entregado',1),
('En Preparacion',2),
('Pendiente',3);
insert into Ventas(Fecha, Tipo_Factura, ID_Vendedor, ID_Repartidor, ID_Pedido) values
('2026-03-10','a',1,1,1),
('2026-04-24','b',2,2,2),
('2026-03-29','c',3,3,3);
insert into Pedidos_Productos(ID_Pedido, ID_Producto, Cantidad) values
(1,1,23),
(2,2,24),
(3,3,9);
select Categoria, Precio_uni from Productos;

select ID_Venta, Fecha, Nombre, Apellido, Categoria, Cantidad from Ventas, Vendedores, Pedidos_Productos, Productos
where Ventas.ID_Vendedor = Vendedores.ID_Vendedor
and Ventas.ID_Pedido = Pedidos_Productos.ID_Pedido
and Pedidos_Productos.ID_Producto = Productos.ID_Producto;