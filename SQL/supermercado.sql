SHOW DATABASES;
-- ELIMINAR TABLAS
DROP TABLE categorias, productos, pedidos, facturas, detalles_factura, estado, clientes;

-- CREACION DE ENTIDADES
CREATE TABLE categorias (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    categoria VARCHAR(30)
);

CREATE TABLE productos (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    producto VARCHAR(35), 
    precio_producto INT, 
    cantidad_producto INT, 
    categorias_id INT
);

CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    productos_id INT
);

CREATE TABLE facturas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    suma_precio DECIMAL(10, 2),
    cantidad INT,
    usuarios_id INT,
    pedidos_id INT
);

CREATE TABLE detalles_factura (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuarios_id INT,
    estado_id INT,
    facturas_id INT
);

CREATE TABLE estado (
    id INT PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR(25)
);

CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(45),
    apellidos VARCHAR(45),
    correo VARCHAR(150),
    telefono INT,
    direccion VARCHAR(50)
);


-- INSERTAR INFORMACION
INSERT INTO categorias (categoria) VALUES
    ("carne"),
    ("panaderia"),
    ("higiene y belleza"),
    ("snacks"),
    ("condimentos"),
    ("conservas"),
    ("bebidas alcoholicas"),
    ("productos de limpieza"),
    ("lacteos"),
    ("Legumbreria");

INSERT INTO productos (producto, precio_producto, cantidad_producto, categorias_id ) VALUES
    ("pollo", 10000, 10, 1),
    ("pan de salchicha", 2000, 8, 2),
    ("hidratante", 15000, 4, 3),
    ("chocolatina jumbo", 3500, 20, 4),
    ("paprica", 2000, 50, 5),
    ("atun", 6000, 10, 6),
    ("ron viejo de caldas", 35000, 8, 7),
    ("suavitel", 12000, 9, 8),
    ("yogurt", 2000, 11, 9),
    ("tomate", 2000, 5, 10);

INSERT INTO pedidos (productos_id) VALUES
    (2),
    (4),
    (10);

INSERT INTO facturas (fecha, cantidad, usuarios_id, pedidos_id) VALUES
    ("2024-05-03", 4, 1, 1),
    ("2024-05-03", 11, 2, 2),
    ("2024-05-03", 2, 3, 3);

INSERT INTO detalles_factura (usuarios_id, estado_id, facturas_id) VALUES
    (1, 3, 2),
    (2, 1, 3),
    (3, 2, 1);

INSERT INTO estado (estado) VALUES
    ("iniciado"),
    ("proceso"),
    ("finalizado");

INSERT INTO clientes (nombres, apellidos, correo, telefono, direccion) VALUES
    ("maria camila", "sepulveda giraldo", "sepulveda.giraldo.camila@gmail.com", 31360205, "cll 24 nro 54-55"),
    ("angelica", "gonzales garcia", "angelica@gmail.com", 31395132, "cll 88 nro 24-25"),
    ("luz bibiana", "londoño lopez", "luz@gmail.com", 31830249, "cll 15 nr 14-15");

-- RELACION DE ENTIDADES
ALTER TABLE productos ADD FOREIGN KEY (categorias_id) REFERENCES categorias(id);
ALTER TABLE pedidos ADD FOREIGN KEY (productos_id) REFERENCES productos(id);
ALTER TABLE facturas ADD FOREIGN KEY (pedidos_id) REFERENCES pedidos(id);
ALTER TABLE detalles_factura ADD FOREIGN KEY (usuarios_id) REFERENCES clientes(id);
ALTER TABLE detalles_factura ADD FOREIGN KEY (estado_id) REFERENCES estado(id);
ALTER TABLE detalles_factura ADD FOREIGN KEY (facturas_id) REFERENCES facturas(id);

-- JOINS DE LAS ENTIDADES
SELECT productos.id, productos.producto, productos.precio_producto, productos.cantidad_producto, categorias.categoria  FROM productos
INNER JOIN categorias
WHERE productos.categorias_id = categorias.id;

SELECT clientes.nombres, clientes.telefono, clientes.direccion, estado.estado, productos.producto FROM detalles_factura
INNER JOIN clientes INNER JOIN estado INNER JOIN facturas INNER JOIN productos
WHERE detalles_factura.facturas_id = facturas.id AND detalles_factura.estado_id = estado.id 
AND facturas.pedidos_id = pedidos.id AND detalles_factura.usuarios_id = clientes.id AND pedidos.productos_id = productos.id;
