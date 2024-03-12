// MongoDB Playground
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.

// The current database to use.
use('supermercado');
db.categorias.find();
db.categorias.drop();
// Create a new document in the collection.

use('supermercado');
db.categorias.insertMany([
    {id: 1, categoria: "carne"},
    {id: 2, categoria: "panaderia"},
    {id: 3, categoria: "higiene y belleza"},
    {id: 4, categoria: "snaks"},
    {id: 5, categoria: "condimentos"},
    {id: 6, categoria: "conservas"},
    {id: 7, categoria: "bebidad alcoholicas"},
    {id: 8, categoria: "productos de limpieza"},
    {id: 9, categoria: "lacteos"},
    {id: 10, categoria: "legumbreria"}
]);

use('supermercado');
db.productos.insertMany([
    {id: 1, producto: "pollo", precio_producto: 10000, cantidad_producto: 10, categorias_id: 1},
    {id: 2, producto: "pan salchicha", precio_producto: 2000, cantidad_producto: 8, categorias_id: 2},
    {id: 3, producto: "hidratante", precio_producto: 15000, cantidad_producto: 4, categorias_id: 3},
    {id: 4, producto: "chocolatina", precio_producto: 3500, cantidad_producto: 20, categorias_id: 4},
    {id: 5, producto: "paprica", precio_producto: 2000, cantidad_producto: 50, categorias_id: 5},
    {id: 6, producto: "atun", precio_producto: 6000, cantidad_producto: 10, categorias_id: 6},
    {id: 7, producto: "club colombia", precio_producto: 35000, cantidad_producto: 8, categorias_id: 7},
    {id: 8, producto: "suavitel", precio_producto: 12000, cantidad_producto: 9, categorias_id: 8},
    {id: 9, producto: "yougurt", precio_producto: 2000, cantidad_producto: 11, categorias_id: 9},
    {id: 10, producto: "tomate", precio_producto: 2000, cantidad_producto: 5, categorias_id: 10}
]);

use('supermercado');
db.pedidos.insertMany([
    {id: 1, productos_id: 2},
    {id: 2, productos_id: 4},
    {id: 3, productos_id: 6},
    {id: 4, productos_id: 8},
    {id: 5, productos_id: 10},
]);

use('supermercado');
db.facturas.insertMany([
    {id: 1, fecha: "2024-03-05", pedidos_id: 1},
    {id: 2, fecha: "2024-03-05", pedidos_id: 2},
    {id: 3, fecha: "2024-03-05", pedidos_id: 3},
    {id: 4, fecha: "2024-03-05", pedidos_id: 4},
    {id: 5, fecha: "2024-03-05", pedidos_id: 5}
]);

use('supermercado');
db.detalles_facturas.insertMany([
    {id: 1, cliente_id: 2, estado_id: 3, facturas_id: 4},
    {id: 4, cliente_id: 1, estado_id: 2, facturas_id: 3},
    {id: 3, cliente_id: 4, estado_id: 1, facturas_id: 2}
]);

use('supermercado');
db.estado.insertMany([
    {id: 1, estado: "iniciado"},
    {id: 2, estado: "procesado"},
    {id: 3, estado: "terminado"},
]);

use('supermercado');
db.clientes.insertMany([
    {id: 1, nombres: "maria camila", apellidos: "sepulveda giraldo", correo: "sepulveda@gmail.com", telefono
}
]);