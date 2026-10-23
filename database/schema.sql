-- Esquema de base de datos para el Sistema de Gestión de Ventas e Inventario
-- Minimarket "La Esquina"
-- Motor: MySQL (XAMPP) con InnoDB

CREATE DATABASE IF NOT EXISTS bodega_ventas
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE bodega_ventas;

-- --------------------------------------------------------------------------
-- Tabla: producto
-- --------------------------------------------------------------------------
CREATE TABLE producto (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    codigo        VARCHAR(50)  NOT NULL,
    nombre        VARCHAR(100) NOT NULL,
    categoria     VARCHAR(50)  NOT NULL,
    precio        DECIMAL(10,2) NOT NULL,
    stock_actual  INT          NOT NULL,
    stock_minimo  INT          NOT NULL,
    CONSTRAINT uk_producto_codigo     UNIQUE (codigo),
    CONSTRAINT chk_producto_precio    CHECK (precio >= 0),
    CONSTRAINT chk_producto_stock_act CHECK (stock_actual >= 0),
    CONSTRAINT chk_producto_stock_min CHECK (stock_minimo >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------------------------
-- Tabla: venta
-- --------------------------------------------------------------------------
CREATE TABLE venta (
    id             INT AUTO_INCREMENT PRIMARY KEY,
    producto_id    INT           NOT NULL,
    cantidad       INT           NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    total          DECIMAL(10,2) NOT NULL,
    fecha_hora     DATETIME      NOT NULL,
    CONSTRAINT fk_venta_producto        FOREIGN KEY (producto_id) REFERENCES producto(id),
    CONSTRAINT chk_venta_cantidad       CHECK (cantidad > 0),
    CONSTRAINT chk_venta_precio_unit    CHECK (precio_unitario >= 0),
    CONSTRAINT chk_venta_total          CHECK (total >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;