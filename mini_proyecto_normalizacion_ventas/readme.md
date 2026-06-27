# Mini Proyecto Modulo 2 - Normalizacion Sistema de Ventas
 
Aprendiz: Johan Daniel Millan  
Instructor: Jeisson Contreras  
Curso: Bases de Datos Relacionales con PostgreSQL  
 
## Como ejecutar
 
Primero levantar el contenedor con Docker:
 
```
docker compose up -d
```
 
Luego abrir pgAdmin en http://localhost:8081 y ejecutar los scripts en este orden:
 
1. sql/00_tabla_cruda.sql
2. sql/01_modelo_normalizado.sql
3. sql/02_datos_normalizados.sql
4. sql/03_consultas_validacion.sql
## Decisiones del modelo
 
- Los datos del cliente se separaron en su propia tabla porque se repetian en cada venta.
- Lo mismo con vendedores y categorias.
- El precio unitario se guarda en el detalle de cada venta y no en el producto, porque el precio puede cambiar y el historico no debe verse afectado.
- El total de la venta no se guarda como columna porque se puede calcular desde el detalle.
- Se usaron claves foraneas para que no se puedan ingresar datos que no existan en las tablas relacionadas.
