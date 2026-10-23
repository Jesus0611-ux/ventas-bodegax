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