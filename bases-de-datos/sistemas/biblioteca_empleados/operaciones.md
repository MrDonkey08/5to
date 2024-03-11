# Implementación de Operaciones de Actualización

## Sistema de Gestión de Biblioteca

### Inserción

#### Código

```sql
INSERT INTO Usuario (Identificacion, Nombre, Correo_Electronico, Telefono, Tipo_Usuario)
VALUES
	('1', 'Andrés', 'andrew22@gmail.com', '33 3242 1242', 'Maestro'),
	('2', 'Magdalena', 'rios.magdalena@yahoo.com', '521 234 2234', 'Maestro'),
	('3', 'Elena', 'chikiboomboom@hotmail.com', '78 2341 7402', 'Estudiante');


INSERT INTO Libro (isbn, titulo, autor, anio_publicacion, num_ejemplares_disponibles, genero)
VALUES
	('9788498387088', 'Cien años de soledad', 'Gabriel García Márquez', 1967, 3, 'Drama'),
	('9788403099742', 'El Principito', 'Antoine de Saint-Exupéry', 1943, 5, 'Reflexión'),
	('9780307277679', '1984', 'George Orwell', 1949, 2, 'Distopica');

INSERT INTO Prestamo (num_prestamo, isbn, identificacion_usuario, fecha_prestamo, fecha_devolucion, estado_libro)
VALUES
	('1', '9788498387088', '1', '2024-02-01', '2024-02-15', 'En préstamo'),
	('2', '9788403099742', '2', '2024-02-02', '2024-02-16', 'En préstamo'),
	('3', '9780307277679', '3', '2024-02-03', '2024-02-17', 'En préstamo');
```

#### Resultado

![libro](img/1-insert_libro.jpg)<br>

![prestamo](img/1-insert_prestamo.jpg)<br>

![usuario](img/1-insert_usuario.jpg)<br>

<div style="page-break-after: always;"></div>

### Actualización

#### Código

```sql
UPDATE Usuario
SET Correo_Electronico = 'elena_nueva@hotmail.com'
WHERE Identificacion = '2';
```

#### Resultado

![](img/1-update_usuario.jpg)

### Eliminación

#### Código

```sql
DELETE FROM Prestamo
WHERE Num_Prestamo = 3;
```

#### Resultado

![](img/1-delete_prestamo.jpg)

<div style="page-break-after: always;"></div>

## Sistema de Gestión de Empleados

### Inserción

#### Código

```SQL
INSERT INTO Empleado (nombre, fecha_de_nacimiento, "direcci¢n", "t‚lefono", puesto, "fecha_de_contrataci¢n", salario, "n£mero_de_identificaci¢n")
VALUES
	('Ana García', '1990-05-15', 'Calle Principal 123', '555-123-4567', 'Desarrollador', '2023-02-10', 50000, 1),
	('Juan López', '1985-10-20', 'Avenida Central 45', '555-987-6543', 'Diseñador', '2022-07-05', 45000, 2),
	('María Pérez', '1988-03-30', 'Calle Secundaria 67', '555-222-3333', 'Gerente de Proyecto', '2021-11-15', 65000, 3);

INSERT INTO Departamento (Nombre, "descripci¢n", Jefe, id, "n£mero_de_identificaci¢n")
VALUES
	('Desarrollo', 'Departamento encargado del desarrollo de software', 'Juan Pérez', '1', '1'),
	('Marketing', 'Encargado de estrategias de marketing', 'María Gómez', '2', '2'),
	('Recursos Humanos', 'Encargado de la gestión de personal', 'Carlos Ruiz', '3', '3');

INSERT INTO Proyecto (nombre, "descripci¢n", fecha_de_inicio, "fecha_de_finalizaci¢n_estimada", id)
VALUES
	('Sistema de Gestión de Empleados', 'Desarrollo de un sistema para gestionar la información del personal', '2023-03-15', '2023-09-15', '1'),
	('Campaña Publicitaria de Verano', 'Diseño y ejecución de una campaña publicitaria de verano', '2024-05-01', '2024-08-30', '2'),
	('Actualización de Base de Datos', 'Actualización y optimización de la base de datos de clientes', '2023-08-10', '2023-11-30', '3');
```

#### Resultado

![libro](img/2-insert_empleado.jpg)

![prestamo](img/2-insert_departamento.jpg)

![usuario](img/2-insert_proyecto.jpg)

<div style="page-break-after: always;"></div>

### Actualización

#### Código

```sql
UPDATE Departamento
SET Nombre = 'Publicidad'
WHERE Nombre = 'Marketing';
```

#### Resultado

![](img/2-update_departamento.jpg)


### Eliminación

#### Código

```sql
DELETE FROM Proyecto
WHERE ID = 3;
```

#### Resultado

![](img/2-delete_proyecto.jpg)