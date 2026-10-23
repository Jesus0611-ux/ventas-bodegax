# Requirements Document

## Introduction

Este documento define los requisitos del Sistema de gestión de ventas e inventario para el minimarket "La Esquina", ubicado en San Vicente de Cañete. Actualmente, el minimarket registra sus ventas en un cuaderno de papel y controla el inventario inspeccionando visualmente los estantes. Esto impide saber cuánto se vendió durante el día y provoca que los productos se agoten sin aviso temprano.

El Sistema es una aplicación web interna que permitirá al Cajero registrar productos, registrar ventas a medida que ocurren y consultar lo vendido en el día. El único usuario del Sistema es el Cajero del minimarket.

## Glossary

- **Sistema**: La aplicación web de gestión de ventas e inventario del minimarket "La Esquina".
- **Cajero**: Único usuario del Sistema, encargado de registrar Productos, registrar Ventas y consultar las Ventas del día.
- **Producto**: Artículo vendido en el minimarket, identificado por un Código único, con Nombre, Categoría, Precio, Stock_Actual y Stock_Mínimo.
- **Código**: Identificador único de un Producto.
- **Nombre**: Descripción textual del Producto.
- **Categoría**: Grupo al que pertenece el Producto (por ejemplo: abarrotes, bebidas, limpieza).
- **Precio**: Precio de venta unitario actual de un Producto.
- **Stock_Actual**: Cantidad de unidades disponibles de un Producto en un momento dado.
- **Stock_Mínimo**: Cantidad a partir de la cual se considera que un Producto tiene stock bajo.
- **Stock_Bajo**: Estado de un Producto cuyo Stock_Actual es menor o igual al Stock_Mínimo.
- **Venta**: Transacción en la que se vende una Cantidad de un Producto a un Precio determinado en un momento dado.
- **Cantidad**: Número de unidades vendidas en una Venta.
- **Total_Venta**: Resultado de multiplicar la Cantidad por el Precio del Producto en el momento de la Venta.
- **Total_Día**: Suma acumulada de los Total_Venta de todas las Ventas del día actual.

## Requirements

### Requisitos Funcionales

#### RF-1: Registrar producto

**Historia de usuario:** Como cajero, quiero registrar un producto nuevo, para que quede disponible para las ventas.

##### Criterios de aceptación

1. CUANDO el Cajero ingrese los datos de un Producto nuevo (Código, Nombre, Categoría, Precio, Stock_Actual y Stock_Mínimo), EL SISTEMA DEBERÁ guardar el Producto en la base de datos.
2. SI el Cajero ingresa un Precio negativo, ENTONCES EL SISTEMA DEBERÁ rechazar el registro del Producto y mostrar un mensaje de error. (RN-3)
3. SI el Cajero ingresa un Código que ya existe en otro Producto, ENTONCES EL SISTEMA DEBERÁ rechazar el registro y mostrar un mensaje indicando que el Código debe ser único. (RN-4)
4. SI el Cajero deja uno o más campos obligatorios vacíos, ENTONCES EL SISTEMA DEBERÁ rechazar el registro e indicar los campos faltantes.
5. SI el Cajero ingresa un Stock_Actual o Stock_Mínimo negativo, ENTONCES EL SISTEMA DEBERÁ rechazar el registro del Producto y mostrar un mensaje de error.

#### RF-2: Listar productos y detectar stock bajo

**Historia de usuario:** Como cajero, quiero ver la lista de productos con marca de stock bajo, para saber qué productos reabastecer.

##### Criterios de aceptación

1. CUANDO el Cajero solicite la lista de productos, EL SISTEMA DEBERÁ mostrar todos los Productos registrados con su Código, Nombre, Categoría, Precio, Stock_Actual y Stock_Mínimo.
2. MIENTRAS el Stock_Actual de un Producto sea menor o igual al Stock_Mínimo, EL SISTEMA DEBERÁ marcar visualmente ese Producto como Stock_Bajo.

#### RF-3: Registrar venta

**Historia de usuario:** Como cajero, quiero registrar una venta, para que quede registrada y se descuente del inventario.

##### Criterios de aceptación

1. CUANDO el Cajero seleccione un Producto registrado e ingrese una Cantidad válida, EL SISTEMA DEBERÁ calcular el Total_Venta multiplicando la Cantidad por el Precio actual del Producto.
2. CUANDO se registre una Venta, EL SISTEMA DEBERÁ guardar la fecha y hora del sistema en el momento del registro.
3. CUANDO se registre una Venta, EL SISTEMA DEBERÁ descontar del Stock_Actual del Producto la Cantidad vendida.
4. SI el Cajero ingresa una Cantidad menor o igual a cero, ENTONCES EL SISTEMA DEBERÁ rechazar la Venta y mostrar un mensaje de error. (RN-1)
5. SI el Cajero ingresa una Cantidad mayor al Stock_Actual disponible del Producto, ENTONCES EL SISTEMA DEBERÁ rechazar la Venta y mostrar un mensaje indicando que no hay suficiente stock. (RN-2)
6. CUANDO se registre una Venta, EL SISTEMA DEBERÁ ejecutar el guardado de la Venta y el descuento de Stock de forma atómica: si la Venta se guarda, el Stock se descuenta; si algo falla, la Venta no se guarda y el Stock no cambia. (RN-5)
7. SI el Cajero intenta registrar una Venta con un Producto que no existe en la base de datos, ENTONCES EL SISTEMA DEBERÁ rechazar la Venta y mostrar un mensaje indicando que el Producto no fue encontrado.

#### RF-4: Consultar ventas del día

**Historia de usuario:** Como cajero, quiero consultar las ventas del día, para saber cuánto se vendió.

##### Criterios de aceptación

1. CUANDO el Cajero solicite las ventas del día, EL SISTEMA DEBERÁ mostrar todas las Ventas realizadas en el día actual ordenadas por fecha y hora.
2. CUANDO el Cajero solicite las ventas del día, EL SISTEMA DEBERÁ mostrar cada Venta con su Producto, Cantidad y Total_Venta.
3. CUANDO el Cajero solicite las ventas del día, EL SISTEMA DEBERÁ mostrar el Total_Día acumulado de todas las Ventas del día.

### Requisitos No Funcionales

#### RNF-1: Aplicación web interna

**Historia de usuario:** Como cajero, quiero usar la aplicación desde un navegador, para no instalar software adicional.

##### Criterios de aceptación

1. EL SISTEMA DEBERÁ ejecutarse en un navegador web dentro del local del minimarket.

#### RNF-2: Funcionamiento sin conexión externa

**Historia de usuario:** Como cajero, quiero que la aplicación funcione sin internet, para no depender de servicios externos.

##### Criterios de aceptación

1. EL SISTEMA DEBERÁ funcionar en la red local del negocio sin depender de servicios de internet.

#### RNF-3: Rapidez de respuesta

**Historia de usuario:** Como cajero, quiero que las operaciones respondan rápido, para no demorar la atención al cliente.

##### Criterios de aceptación

1. CUANDO el Cajero realice una operación de registro o consulta, EL SISTEMA DEBERÁ responder en menos de 2 segundos (meta propuesta para el proyecto; D0.md solo indica "en segundos" sin fijar un valor concreto).

#### RNF-4: Simplicidad de uso

**Historia de usuario:** Como cajero, quiero una interfaz sencilla, para usarla sin conocimientos técnicos.

##### Criterios de aceptación

1. EL SISTEMA DEBERÁ presentar una interfaz con etiquetas claras y acciones que el Cajero pueda ejecutar sin conocimientos técnicos previos.

#### RNF-5: Persistencia de datos

**Historia de usuario:** Como cajero, quiero que los datos se conserven, para no perderlos al cerrar la aplicación.

##### Criterios de aceptación

1. CUANDO la aplicación se cierre y se reabra, EL SISTEMA DEBERÁ conservar todos los Productos y Ventas registrados.

#### RNF-6: Consistencia de datos

**Historia de usuario:** Como cajero, quiero que la venta y el descuento de stock sean consistentes, para que el inventario nunca quede desactualizado.

##### Criterios de aceptación

1. CUANDO se registre una Venta, EL SISTEMA DEBERÁ ejecutar el registro de la Venta y el descuento de Stock como una transacción atómica de modo que ambos se realicen o ninguno. (RN-5)

#### RNF-7: Seguridad de datos

**Historia de usuario:** Como cajero, quiero que los datos sean seguros, para evitar ataques de inyección SQL.

##### Criterios de aceptación

1. CUANDO el Cajero ingrese datos, EL SISTEMA DEBERÁ validar los datos ingresados antes de procesarlos.
2. CUANDO el Sistema ejecute consultas SQL, EL SISTEMA DEBERÁ utilizar consultas preparadas para evitar inyecciones SQL.

## Notas sobre el documento

- **RNF-3 (Rapidez):** D0.md indica que las operaciones deben responder "en segundos", lo cual es una medida vaga. "Menos de 2 segundos" es una meta propuesta para el proyecto, no un valor establecido en D0.md, y se incorpora como límite concreto y verificable para cumplir con la regla INCOSE de testabilidad.
- **RF-1, criterio 4 (campos vacíos):** D0.md no menciona explícitamente el rechazo de campos vacíos, pero lo implica en el requisito de validación de datos (RNF-7). Se agregó como criterio explícito para garantizar completitud.
- **RN-5 en dos requisitos:** La regla RN-5 (atomicidad) aparece tanto en RF-3 (criterio 6, como comportamiento de la venta) como en RNF-6 (criterio 1, como propiedad de consistencia de datos), siguiendo la estructura de D0.md que la lista tanto como regla de negocio como requisito no funcional.
- **Supuestos de D0.md:** Los supuestos (usuario único, precio variable entre ventas, stock gestionado solo desde la app, fecha del sistema, no editar/eliminar ventas) no se incluyen como requisitos porque son condiciones asumidas, no obligatorias.
