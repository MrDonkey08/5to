# Implementación de Índices

## Sistema de Gestión de Bibiloteca

### Creación

```sql
CREATE INDEX idx_titulo_libro ON Libro USING btree (Titulo);
```

### Resultado

![](img/3-idx_libro.jpg)

## Sistema de Gestión de Empleados

### Creación

```sql
CREATE INDEX idx_nombre_empleado ON Empleado USING btree (Nombre);
```

### Resultado

![](img/3-idx_empleado.jpg)