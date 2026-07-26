# Ventas_Tech_DB

## Descripción

**Ventas_Tech_DB** es una base de datos relacional desarrollada en SQL Server para la gestión de ventas de productos tecnológicos.

La base de datos permite administrar:

* Categorías de productos.
* Clientes registrados.
* Productos disponibles.
* Ventas realizadas.

El objetivo es centralizar la información comercial y facilitar consultas sobre productos, clientes y transacciones de venta.

## Autor

**Nelson Odriozola**

## Fecha

18/06/2026

## Estructura de la Base de Datos

La base de datos está compuesta por las siguientes tablas:

### Categorias

Almacena las categorías de los productos.

**Campos principales:**

* id_categoria (PK)
* nombre_categoria
* descripcion

### Clientes

Contiene la información de los clientes registrados.

**Campos principales:**

* id_cliente (PK)
* nombre
* email
* ciudad
* fecha_registro

### Productos

Almacena los productos disponibles para la venta.

**Campos principales:**

* id_producto (PK)
* nombre_producto
* id_categoria (FK)
* precio
* stock
* activo

### Ventas

Registra las ventas realizadas.

**Campos principales:**

* id_venta (PK)
* id_cliente (FK)
* id_producto (FK)
* cantidad
* precio_unitario
* fecha_venta

## Restricciones de Integridad

La base de datos implementa las siguientes restricciones:

* Claves primarias (PRIMARY KEY) en todas las tablas.
* Claves foráneas (FOREIGN KEY) para mantener la integridad referencial.
* Restricciones NOT NULL en campos obligatorios.
* Restricción UNIQUE sobre el campo email de la tabla Clientes.
* Valores por defecto para stock y activo en la tabla Productos.




## Instrucciones de Ejecución

1. Abrir SQL Server Management Studio.
2. Conectarse a una instancia de SQL Server.
3. Crear una nueva base de datos o descomentar las siguientes líneas del script:

```sql
CREATE DATABASE Ventas_Tech_DB;
USE Ventas_Tech_DB;
```

4. Abrir el archivo `script.sql`.
5. Ejecutar el script completo presionando **F5** o seleccionando **Execute**.
6. Verificar que las tablas y los datos hayan sido creados correctamente.

## Contenido del Script

El archivo SQL realiza las siguientes tareas:

1. Elimina tablas existentes si ya fueron creadas.
2. Crea el esquema de la base de datos.
3. Define claves primarias y foráneas.
4. Inserta datos de ejemplo para pruebas.
5. Deja la base lista para realizar consultas y análisis.

