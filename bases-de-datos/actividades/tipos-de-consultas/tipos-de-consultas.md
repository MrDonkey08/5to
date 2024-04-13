# Sistema Panaderia

## Tipos de Consultas

```sql
SELECT *
FROM "Empleado"
WHERE "puesto_empleado"='Pastelero' OR "puesto_empleado"='Pastelera';
```

![ | center ](./img/image-1.jpg)

```sql
SELECT "id_sueldo", "total_pago", "pago_dia"
FROM "Sueldo" WHERE "total_pago">=14500;
```

![ | center ](./img/image-2.jpg)

```sql
SELECT *
FROM "Proveedor"
WHERE "email_proveedor"='rogelio_chocolate@gmail.com';
```

![ | center ](./img/image-3.jpg)

```sql
SELECT *
FROM "Pedido" WHERE "fecha_pedido">='2021-04-03' and
"fecha_pedido"<='2021-04-08';
```

![ | center ](./img/image-4.jpg)

```sql
SELECT *
FROM "Empleado"
WHERE "nombre_empleado"='Jorge Sales';
```

![ | center ](./img/image-5.jpg)

```sql
SELECT "Pedido".id_pedido, "Pedido".fecha_pedido, "detalle_pedido".id_producto,
"detalle_pedido".cantidad_pedido, "detalle_pedido".total_pagar

FROM "Pedido" INNER JOIN "detalle_pedido" ON "Pedido".id_pedido

=detalle_pedido.id_pedido;
```

![ | center ](./img/image-6.jpg)

```sql
SELECT *
FROM "Venta" INNER JOIN "detalle_venta"
ON "Venta".id_venta = detalle_venta.id_venta;
```

![ | center ](./img/image-7.jpg)

```sql
SELECT *
FROM "Proveedor"
NATURAL JOIN "detalle_proveedor";
```

![ | center ](./img/image-8.jpg)

```sql
SELECT *
FROM "MateriaPrima"
NATURAL JOIN "detalle_materiaprima";
```

![ | center ](./img/image-9.jpg)

```sql
SELECT "Perdida".id_perdida, "Perdida".nombre_perdida, "Perdida".descripcion,
"Detalle_perdida".id_producto, "Detalle_perdida".fecha_perdida FROM "Perdida"
NATURAL JOIN "Detalle_perdida";
```

![ | center ](./img/image-10.jpg)

```sql
SELECT total_pagar+(total_pagar*0.16)
FROM "detalle_pedido";
```

![ | center ](./img/image-11.jpg)

```sql
SELECT *, "precio_producto"*30
FROM "Producto";
```

![ | center ](./img/image-12.jpg)

```sql
SELECT monto_credito, "monto_credito"+(monto_credito*0.25)
FROM "Credito";
```

![ | center ](img/image-13.jpg)

```sql
select nombre_producto, precio_producto, precio_producto-(precio_producto*0.20)
from "Producto";
```

![ | center ](img/image-14.jpg)

```sql
select id_sueldo, total_pago, ((pago_dia*15)/365)*214 from "Sueldo";
```

![ | center ](img/image-15.jpg)

```sql
SELECT SUM(total_pagar)
FROM "detalle_pedido";
```

![ | center ](img/image-16.jpg)

```sql
SELECT AVG(total_pagar)
FROM "detalle_pedido";
```

![ | center ](img/image-17.jpg)

```sql
SELECT MAX(total_pago)
FROM "Sueldo";
```

![ | center ](img/image-18.jpg)

```sql
SELECT MIN(existencia)
FROM "MateriaPrima";
```

![ | center ](img/image-19.jpg)

```sql
SELECT COUNT(*)
FROM "Pedido";
```

![ | center ](img/image-20.jpg)
