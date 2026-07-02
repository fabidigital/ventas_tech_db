--CREACION DE BASE DE DATOS TECH STORE 
CREATE DATABASE VENTAS_TECH_STORE;
USE VENTAS_TECH_STORE;

--CREACION TABLA CATEGORIAS
CREATE TABLE categorias (id_categoria INT not null identity(1,1) PRIMARY KEY,
nombre_categoria VARCHAR(50) not null,
descripcion	VARCHAR(200) not null);	​

--CREACION TABLA CLIENTES
CREATE TABLE clientes(
id_cliente int not null identity (1,1) primary key,
Nombre varchar(100) not null, email varchar(100) unique, Ciudad varchar(50) not null,
fecha_de_registro date not null);

--CREACION TABLA PRODUCTOS
CREATE TABLE productos(
id_producto int not null identity (1,1) primary key,
nombre_producto varchar(100) not null,
precio decimal (10,2) not null,
stock int default (0),
activa tinyint default (1),
id_categoria int not null
--definimos la conexion
foreign key(id_categoria) references categorias(id_categoria));

--CREACION TABLA VENTAS
create table ventas(
id_ventas int not null identity(1,1) primary key,
id_clientes int not null foreign key(id_clientes) references clientes(id_cliente),
id_producto int not null foreign key(id_producto) references productos(id_producto),
cantidad int not null,
precio_unitario decimal(10,2) not null,
fecha_venta date not null);

--INSERTAR REGISTROS A TABLA CATEGORIAS 
INSERT INTO categorias (nombre_categoria, descripcion)
VALUES ('Computación', 'Laptops, PCs y monitores'),
 ('Accesorios', 'Periféricos y complementos'),
 ('Audio', 'Auriculares y parlantes'),
 ('Almacenamiento', 'Discos y memorias');

 --INSERTAR REGISTROS A TABLA CLIENTES
 INSERT INTO clientes (Nombre, email, Ciudad, fecha_de_registro)
 VALUES ('María López', 'maria@mail.com', 'Buenos Aires','2024-01-05'),
 ('Carlos Ruiz', 'carlos@mail.com',  'Córdoba',      '2024-01-10'),
 ('Ana Gómez', 'ana@mail.com','Rosario', '2024-02-01'),
 ('Pedro Sanz', 'pedro@mail.com', 'Mendoza', '2024-02-15'),
 ('Laura Torres', 'laura@mail.com','Tucumán','2024-03-01');

 --INSERTAR REGISTROS A TABLA PRODUCTOS
 INSERT INTO productos (nombre_producto, precio, stock, activa,id_categoria)
 VALUES ('Laptop Pro 15', 1, 1200.00, 15, 1),
        ('Mouse Inalámbrico',   2,   28.00, 80, 1),
        ('Monitor 4K 27"',      1,  450.00, 12, 1),
        ('Auriculares BT Pro',  3,  120.00, 35, 1),
        ('SSD Externo 1TB',     4,  130.00, 18, 1),
        ('Teclado Mecánico',    2,   95.00, 40, 1);

--INSERTAR REGISTROS VENTAS
INSERT INTO ventas (id_clientes, id_producto, cantidad, precio_unitario, fecha_venta)
 VALUES (  1, 1, 2, 1200.00, '2024-03-05'),
        (  2, 2, 5,   28.00, '2024-03-06'),
        (  3, 3, 1,  450.00, '2024-03-07'),
        (  1, 4, 2,  120.00, '2024-03-08'),
        (  4, 5, 3,  130.00, '2024-03-10'),
        (  2, 6, 4,   95.00, '2024-03-11'),
        (  5, 1, 1, 1200.00, '2024-03-12'),
        (  3, 2, 8,   28.00, '2024-03-13'),
        (  4, 4, 1,  120.00, '2024-03-14'),
        (  5, 3, 2,  450.00, '2024-03-15');

        --SELECCIONAMOS Y VISUALIZAMOS TABLAS
        SELECT * FROM categorias,clientes, productos,ventas;
      
      --BORRAMOS TABLAS CON DROP
        DROP TABLE ventas;
        DROP TABLE productos;
        DROP TABLE clientes;
        Drop TABLE categorias;

       --fin practico modulo 3 fabiana aguirre.

        
       



        }






