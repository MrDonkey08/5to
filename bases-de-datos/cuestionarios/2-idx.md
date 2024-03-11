# Cuestionario: Índices

1. **¿Cuáles son los tipos de índices?**

- Índices B-Tree
- Índices Hash
- Índices de texto completo
- Índices R-Tree (para datos espaciales)
- Índices bitmap

2. **Explica las características de un tipo de índice: Índice B-Tree**

- Estructura jerárquica de árbol balanceado.
- Eficiente para rangos de búsquedas y consultas de igualdad.
- Adecuado para bases de datos relacionales.
- Buen rendimiento en operaciones de inserción, eliminación y búsqueda.

3. **¿Cuál es la sintaxis para crear un tipo de índice común?**

```sql
CREATE INDEX nombre_indice ON nombre_tabla (columna);
```

4. **¿Cuál es la sintaxis para crear un tipo de índice primario?**

```sql
CREATE UNIQUE INDEX nombre_indice ON nombre_tabla (columna);
```

5. **¿Cuál es la sintaxis para borrar un índice?**

```sql
DROP INDEX nombre_indice;
```

6. **¿Cómo se puede consultar los índices creados en una tabla?**

Puedes usar consultas específicas al sistema de gestión de bases de datos, como:

```sql
SHOW INDEX FROM nombre_tabla;
```

7. **¿Cuál es la sintaxis para insertar un registro?**

```sql
INSERT INTO nombre_tabla (columna1, columna2, ...) VALUES (valor1, valor2, ...);
```

8. **¿Cuál es la sintaxis para eliminar un registro?**

```sql
DELETE FROM nombre_tabla WHERE condicion;
```

9. **¿Cuál es la sintaxis para modificar un registro?**

```sql
UPDATE nombre_tabla SET columna1 = valor1, columna2 = valor2, ... WHERE condicion;
```
