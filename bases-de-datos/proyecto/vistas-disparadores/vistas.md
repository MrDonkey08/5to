# Vistas

## Vistas Horizontales

```sql
CREATE VIEW residencia_casa AS
SELECT * FROM direccion
WHERE tipo_de_residencia = 'Casa';
```

```sql
CREATE VIEW residencia_departamento AS
SELECT * FROM direccion
WHERE tipo_de_residencia = 'Departamento';
```

## Vistas Verticales

```sql
CREATE VIEW direccion_pendiente AS
SELECT d.id_direccion, d.calle, d.numero_exterior, d.colonia, d.entidad, d.tipo_de_residencia, d.ubicacion
FROM direccion d
JOIN derrumbe dr ON d.id_direccion = dr.id_direccion
WHERE dr.estatus = 'Pendiente';
```

```sql
CREATE VIEW direccion_en_proceso AS
SELECT d.id_direccion, d.calle, d.numero_exterior, d.colonia, d.entidad, d.tipo_de_residencia, d.ubicacion
FROM direccion d
JOIN derrumbe dr ON d.id_direccion = dr.id_direccion
WHERE dr.estatus = 'En proceso';
```

```sql
CREATE VIEW status_casa AS
SELECT dr.id_derrumbe, dr.descripcion, dr.necesidades, dr.tipo_de_dano, dr.estatus, dr.id_contacto, dr.id_direccion
FROM derrumbe dr
JOIN direccion d ON dr.id_direccion = d.id_direccion 
WHERE tipo_de_residencia = 'Casa';
```

```sql
CREATE VIEW status_departamento AS
SELECT d.id_direccion, d.calle, d.numero_exterior, d.colonia, d.entidad, d.tipo_de_residencia, d.ubicacion
FROM direccion d
JOIN derrumbe dr ON d.id_direccion = dr.id_direccion
WHERE dr.estatus = 'En proceso';
```

## Vistas Agrupadas

```sql
CREATE VIEW info_derrumbes(id, descripcion, necesidades, tipo_de_dano, estado, id_contacto, id_direccion) AS
SELECT dr.id_derrumbe, dr.descripcion, dr.necesidades, dr.tipo_de_dano, dr.estatus, dr.id_contacto, dr.id_direccion
FROM derrumbe dr GROUP BY id_derrumbe ORDER_BY ASC;
```

```sql
SELECT * FROM direccion_pendiente;
SELECT * FROM direccion_en_proceso;
SELECT * FROM residencia_casa;
SELECT * FROM residencia_departamento;
SELECT * FROM status_casa;
SELECT * FROM status_departamento;
```

<div style="page-break-after: always;"></div>

## Evidencia

![ | center](img/1-vistas.jpg)