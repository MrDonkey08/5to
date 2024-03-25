# Implementación de Operaciones de Actualización

## Sistema de Gestión de Derrumbes

### Inserción

```sql
INSERT INTO Contacto (Nombre, Telefono)
VALUES
	('Juan Pérez', '1234567890'),
	('María García', '9876543210'),
	('Pedro López', '5555555555'),
	('Ana Martínez', '7777777777'),
	('Sofía Hernández', '3333333333');

INSERT INTO Direccion (Calle, Numero_exterior, Colonia, Entidad, Tipo_de_Residencia, Ubicacion)
VALUES
	('Calle 123', 100, 'Colonia Centro', 'Ciudad de México', 'Casa', 'CDMX'),
	('Avenida Principal', 500, 'Colonia Norte', 'Guadalajara', 'Departamento', 'Jalisco'),
	('Calle Secundaria', 250, 'Colonia Sur', 'Monterrey', 'Casa', 'Nuevo León'),
	('Paseo de las Flores', 1500, 'Colonia Este', 'Puebla', 'Casa', 'Puebla'),
	('Calle 456', 300, 'Colonia Oeste', 'Querétaro', 'Departamento', 'Querétaro');

INSERT INTO Derrumbe (Descripcion, Necesidades, Tipo_de_Dano, Estatus, ID_Contacto, ID_Direccion)
VALUES
	('Derrumbe en la zona norte', 'Rescate urgente', 'Estructural', 'Pendiente', 1, 1),
	('Derrumbe parcial en edificio', 'Equipo de demolición', 'Estructural', 'En proceso', 2, 2),
	('Derrumbe en construcción', 'Rescate de trabajadores', 'Estructural', 'Pendiente', 3, 3),
	('Deslizamiento de tierra', 'Evacuación de zona afectada', 'Naturaleza', 'En proceso', 4, 4),
	('Derrumbe en casa abandonada', 'Limpieza de escombros', 'Estructural', 'Resuelto', 5, 5);
```

### Actualización

```sql
UPDATE Contacto
SET Nombre = 'Juan Pérez Pérez', Telefono = '1111111111'
WHERE ID_Contacto = 1;

UPDATE Direccion
SET Calle = 'Avenida Reforma', Numero_exterior = 250
WHERE ID_Direccion = 2;

UPDATE Derrumbe
SET Descripcion = 'Derrumbe en construcción abandonada', Estatus = 'En proceso'
WHERE ID_Derrumbe = 3;
```

### Eliminación

```sql
DELETE FROM Derrumbe
WHERE ID_Contacto = 4 OR ID_Direccion = 5;

DELETE FROM Contacto
WHERE ID_Contacto = 4;

DELETE FROM Direccion
WHERE ID_Direccion = 5;
```

### Muestreo

```sql
\dt
```

```sql
SELECT * FROM Contacto;
SELECT * FROM Direccion;
SELECT * FROM Derrumbe;
```

### Vaciado

```sql
DELETE FROM Derrumbe;
DELETE FROM Contacto;
DELETE FROM Direccion;
```

```sql
ALTER SEQUENCE contacto_id_contacto_seq RESTART WITH 1;
ALTER SEQUENCE direccion_id_direccion_seq RESTART WITH 1;
ALTER SEQUENCE derrumbe_id_derrumbe_seq RESTART WITH 1;
```