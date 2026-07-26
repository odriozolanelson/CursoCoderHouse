-- ══════════════════════════════════════════
-- Ventas_Tech — Creando la base de datos
-- Autor: Nelson Odriozola
-- Fecha: 18/06/2026
-- ══════════════════════════════════════════

-- ── 1. Definición del Esquema (DDL) y 2. Restricciones de Integridad ──────────────────────────

--CREATE DATABASE Ventas_Tech_DB;

--USE Ventas_Tech_DB;

DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Categorias;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Ventas;

CREATE TABLE Categorias(
id_categoria INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
nombre_categoria VARCHAR(50) NOT NULL,
descripcion VARCHAR(200)
);

CREATE TABLE Clientes(
id_cliente INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
nombre VARCHAR (100) NOT NULL,
email VARCHAR (100) UNIQUE,
ciudad VARCHAR (50),
fecha_registro DATE NOT NULL
);

CREATE TABLE Productos(
id_producto INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
nombre_producto VARCHAR (100) NOT NULL,
id_categoria INT NOT NULL FOREIGN KEY REFERENCES Categorias(id_categoria),
precio DECIMAL (10,2) NOT NULL,
stock INT DEFAULT 0 NOT NULL,
activo TINYINT DEFAULT 1 NOT NULL
);


CREATE TABLE Ventas(
id_venta INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
id_cliente INT NOT NULL FOREIGN KEY REFERENCES Clientes (id_cliente),
id_producto INT NOT NULL FOREIGN KEY REFERENCES Productos (id_producto),
cantidad INT NOT NULL,
precio_unitario	DECIMAL(10,2) NOT NULL,
fecha_venta	DATE NOT NULL
);


-- ── 3. Carga Inicial de Datos (DML) ──────────────────────────

INSERT INTO Categorias VALUES 
('Computación', 'Laptops, PCs y monitores'),
('Accesorios', 'Periféricos y complementos'),
('Audio', 'Auriculares y parlantes'),
('Almacenamiento', 'Discos y memorias');

INSERT INTO Clientes VALUES
('María López',   'maria@mail.com',   'Buenos Aires', '2024-01-05'),
('Carlos Ruiz',   'carlos@mail.com',  'Córdoba',      '2024-01-10'),
('Ana Gómez',     'ana@mail.com',     'Rosario',      '2024-02-01'),
('Pedro Sanz',    'pedro@mail.com',   'Mendoza',      '2024-02-15'),
('Laura Torres',  'laura@mail.com',   'Tucumán',      '2024-03-01');


INSERT INTO Productos VALUES
('Laptop Pro 15',       1, 1200.00, 15, 1),
('Mouse Inalámbrico',   2,   28.00, 80, 1),
('Monitor 4K 27"',      1,  450.00, 12, 1),
('Auriculares BT Pro',  3,  120.00, 35, 1),
('SSD Externo 1TB',     4,  130.00, 18, 1),
('Teclado Mecánico',    2,   95.00, 40, 1);


INSERT INTO Ventas VALUES
(1, 1, 2, 1200.00, '2024-03-05'),
(2, 2, 5,   28.00, '2024-03-06'),
(3, 3, 1,  450.00, '2024-03-07'),
(1, 4, 2,  120.00, '2024-03-08'),
(4, 5, 3,  130.00, '2024-03-10'),
(2, 6, 4,   95.00, '2024-03-11'),
(5, 1, 1, 1200.00, '2024-03-12'),
(3, 2, 8,   28.00, '2024-03-13'),
(4, 4, 1,  120.00, '2024-03-14'),
(5, 3, 2,  450.00, '2024-03-15');



-- Ver todas las ventas con nombre de cliente y producto
SELECT v.id_venta, c.nombre, p.nombre_producto, v.cantidad, v.fecha_venta
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN productos p ON v.id_producto = p.id_producto;

-- Verificar que las FK funcionan correctamente
SELECT COUNT(*) AS total_ventas FROM ventas;
