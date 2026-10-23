-- Datos de prueba para el minimarket "La Esquina"
USE bodega_ventas;

INSERT INTO producto (codigo, nombre, categoria, precio, stock_actual, stock_minimo) VALUES
('P001', 'Arroz superior 5 kg',    'Abarrotes', 22.50, 20,  5),
('P002', 'Azucar rubia 1 kg',      'Abarrotes',  4.20, 30, 10),
('P003', 'Aceite vegetal 1 L',     'Abarrotes',  9.90, 12,  4),
('P004', 'Leche evaporada 400 g',  'Lacteos',    4.00, 48, 12),
('P005', 'Fideo spaghetti 500 g',  'Abarrotes',  3.50, 25,  8),
('P006', 'Atun en trozos 170 g',   'Conservas', 6.50,  3,  6),
('P007', 'Gaseosa 1.5 L',          'Bebidas',   7.00, 18,  6),
('P008', 'Detergente 1 kg',       'Limpieza', 11.80,  2,  4);