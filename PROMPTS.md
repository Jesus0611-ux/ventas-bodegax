# Registro de prompts utilizados en Kiro

## Fase 1: Documento base (D0.md)

**Prompt 1 — Crear D0.md**

Kiro, estoy haciendo un proyecto para un minimarket llamado La Esquina, ubicado en San Vicente de Cañete.

Actualmente el negocio anota las ventas en un cuaderno y revisa el stock mirando los estantes. Esto hace que no sepan cuánto vendieron durante el día y que algunos productos se agoten sin darse cuenta.

Necesito una aplicación web interna para que el cajero pueda:

1. Registrar productos con código, nombre, categoría, precio, stock actual y stock mínimo.
2. Ver la lista de productos y cuáles tienen stock bajo.
3. Registrar ventas indicando el producto y la cantidad. El sistema debe calcular el total con el precio actual, guardar la fecha y hora, y descontar el stock.
4. Consultar las ventas del día y el total vendido.

Las reglas son: no vender cantidades menores o iguales a cero, no vender más del stock disponible, no permitir precios negativos, no repetir códigos de productos y asegurar que la venta y el descuento de stock se realicen juntos.

Con esta información, crea el archivo D0.md con el problema, usuario, proceso actual, requisitos funcionales y no funcionales, reglas de negocio, alcance y supuestos.

No agregues inicio de sesión, roles, clientes, facturación ni funciones adicionales.

Explícame brevemente cómo organizaste el documento.

**Prompt 2 — Corregir D0.md**

Kiro, revisé el documento D0.md y encontré algunas cosas que quiero mejorar.

Primero, corrige los errores de redacción que aparecen en el problema.

También agrega un requisito no funcional de seguridad para evitar consultas SQL inseguras y validar los datos ingresados.

Por último, revisa que los supuestos estén claramente identificados y que no se confundan con requisitos obligatorios.

Mantén el resto del documento como está y no agregues nuevas funcionalidades. Explícame qué cambiaste.

**Prompt 3 — Aplicar correcciones**
Kiro, los cambios anteriores no se guardaron en D0.md. Necesito que edites directamente el archivo que está en la carpeta del proyecto.

Haz solamente estos cambios:
1. Cambia "impite" por "impide".
2. Cambia "Los productos se agoten sin darse cuenta" por "Los productos se agotan sin darse cuenta".
3. En requisitos no funcionales, agrega: "Seguridad de datos. El sistema debe validar los datos ingresados y utilizar consultas SQL preparadas para evitar inyecciones SQL".
4. Al inicio de la sección Supuestos, agrega una aclaración indicando que son condiciones asumidas para el diseño y no requisitos obligatorios.

No cambies el resto del documento.

Guarda los cambios en D0.md, vuelve a leer el archivo y confirma que las cuatro modificaciones aparecen realmente.

Si no puedes editar o guardar el archivo, dímelo claramente en lugar de indicar que ya está corregido.

## Fase 2: Especificación del sistema

**Prompt 4 — Generar requirements.md**

Kiro, ya tengo el documento D0.md de mi proyecto del minimarket La Esquina. Léelo antes de comenzar.

Ahora necesito crear requirements.md a partir de esa información.

Organiza los requisitos funcionales (RF) y no funcionales (RNF) con criterios de aceptación en formato EARS, usando frases como: CUANDO ocurra algo, EL SISTEMA DEBERÁ realizar una acción.

Asegúrate de incluir el registro de productos, el listado con stock bajo, el registro de ventas con descuento de stock y la consulta de ventas del día.

También incluye las cinco reglas de negocio de D0.md en los criterios de aceptación, sin dejar ninguna fuera.

No agregues inicio de sesión, roles, clientes ni facturación.

Crea el archivo requirements.md y explícame brevemente cómo organizaste los requisitos. Si encuentras alguna contradicción con D0.md, avísame antes de cambiarla.

**Prompt 5 — Revisar requirements.md**

Kiro, revisé requirements.md y encontré algunos detalles que quiero mejorar.

En RF-1, agrega una validación para que el stock actual y el stock mínimo no puedan ser negativos.

En RF-3, agrega un criterio para rechazar una venta si el producto no existe.

En RNF-3, aclara que el tiempo de respuesta menor a 2 segundos es una meta propuesta para el proyecto, no un requisito indicado directamente en el caso.

No cambies los demás requisitos ni agregues nuevas funcionalidades.

Aplica los cambios directamente en requirements.md, guarda el archivo y vuelve a leerlo para confirmar que se modificó.

Al terminar, explícame brevemente qué corregiste.

**Prompt 6 — Generar design.md**
Kiro, ya tengo D0.md y requirements.md corregidos. Léelos antes de empezar.

Ahora necesito crear design.md para el sistema de ventas del minimarket La Esquina.

El diseño debe usar PHP 8 orientado a objetos, MySQL de XAMPP y PDO con consultas preparadas, sin frameworks.

Incluye las cinco capas: Model, Repository, Service, Controller y Views. Explica de forma sencilla qué hace y qué no debe hacer cada una.

Diseña las tablas producto y venta con sus campos, tipos de datos, claves y restricciones.

También necesito las clases principales con sus métodos y parámetros tipados, el proceso de registrar una venta usando una transacción para guardar la venta y descontar el stock juntos, y cómo se manejarán los errores.

Asegúrate de que el diseño cumpla con RF-1 hasta RF-4 y las cinco reglas de negocio.

No agregues inicio de sesión, roles, clientes, facturación ni otras funciones fuera del alcance.

Genera design.md, guarda el archivo y explícame brevemente las decisiones principales.

No generes todavía código PHP ni archivos SQL.

**Prompt 7 — Corregit design.md**

Kiro, revisé design.md y quiero hacer dos correcciones.

En el registro de ventas, la verificación del stock debe ser segura incluso si se intentan registrar dos ventas al mismo tiempo. Ajusta el flujo para que la comprobación y el descuento del stock se realicen de manera segura dentro de la transacción.

Simplifica la estrategia de pruebas. No quiero depender de PHPUnit, Eris ni pruebas PBT. Para este examen usaré pruebas sencillas en PHP mediante tests/run.php.

Mantén las cinco capas y los requisitos actuales. No generes código todavía.

Haz únicamente estas correcciones directamente en design.md, sin subagentes ni revisiones extensas si es posible. Guarda el archivo y confirma brevemente los cambios.