# Sistema de Gestión de Empleados

## Diccionario de Datos

### EMPLEADO

| Nombre de la Columna | NULL? | Tipo |
| :--: | :--: | :--: |
| idEmpleado | NOT NULL | INT |
| nombre | NOT NULL | VARCHAR(40) |
| fechaNacimiento | NULL | DATE |
| direccion | NULL | VARCHAR(40) |
| telefono | NULL | VARCHAR(40) |
| puesto | NULL | VARCHAR(40) |
| fechaContratacion | NOT NULL | DATE |
| salario | NULL | DECIMAL |
| idDepartamento | NULL | INT |

### DEPARTAMENTO

| Nombre de la Columna | NULL? | Tipo |
| :--: | :--: | :--: |
| idDepartamento | NOT NULL | INT |
| nombreDepartamento | NOT NULL | VARCHAR(40) |
| descripcion | NULL | VARCHAR(40) |
| jefeDepartamento | NULL | VARCHAR(40) |

### PROYECTO

| Nombre de la Columna | NULL? | Tipo |
| :--: | :--: | :--: |
| idProyecto | NOT NULL | INT |
| nombreProyecto | NOT NULL | VARCHAR(40) |
| descripcionProyecto | NULL | VARCHAR(40) |
| fechaInicio | NULL | DATE |
| fechaFinalizacionEstimada | NULL | DATE |
