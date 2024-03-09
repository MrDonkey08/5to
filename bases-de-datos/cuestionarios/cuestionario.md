# Entregable 2 U4

- ¿Cuál es el proceso para crear una base de datos en PG Admin? 

1. Abrir PGAdmin4
2. Ingresar contraseña
3. Ingresar al apartado de Bases de Datos
4. Click derecho en el grupo y seleccionar crear base de datos
5. Ingresar los campos correspondientes (nombre, puerto, etc.)
6. Confirmar y guardar



- ¿Cuál es el proceso para crear una tabla de una base de datos en sql shell?

1. Ingresar a SQL SHell
2. Crear base de datos (de ser necesario)
3. Ingresar a la base de datos con el comando 

`\c <nombre_de_base_de_datos`
6. Ingresar el comando `CREATE TABLE <nombre_de_tabla> (<nombre_campo>, >tipo_de_dato>...);`

-  ¿Qué es el tipo de datos serial?


Es un campo utilizado para generar un número único para cada registro nuevo agregado a la tabla.

- ¿Cómo se definen los tipos de datos serial a un atributo de una base de datos?

`<nombre_de_atributo SERIAL PRIMARY KEY`

- ¿Cuáles son los constraints y para qué sirven?

- Primary Key Constraint
- Foreign Key
- Unique Constrint
- Check Constraint
- Not Null Constraint

Los constraints se utilizan para imponer ciertas condiciones o restricciones en los datos almacenados en las tablas.


- ¿Cómo implementar Constraints?

Puedes agregarlos al definir la estructura de una tabla o modificar una tabla existente para incluir los constraints necesarios

- ¿Cuál es el proceso para respaldar una base de datos en PG Admin?

1. Click derecho sobre la base de datos a respaldar
2. Seleccionar opción de respaldo
3. Llenar los campos correspondientes
4. Guardar

- ¿Cuál es el proceso para restaurar una base de datos en PGAdmin?

1. Seleccionar una base de datos nueva.
2. Click derecho en la base de datos
3. Seleccionar opción de restaurar
4. Abres el archivo de respaldo
5. Aplicar y guardar

- Explica el propósito de la restricción UNIQUE en una columna de una tabla y proporciona un ejemplo.

La restricción UNIQUE en una columna de una tabla garantiza que todos los valores en esa columna sean únicos, es decir, no puede haber duplicados. 

- ¿Cómo se puede agregar una restricción FOREIGN KEY a una tabla y cuál es su función en una base de datos?

Primero debes asegurarte de que la columna a la que quieres hacer referencia como clave externa exista en otra tabla como clave primaria o UNIQUE. Luego, puedes agregar la restricción FOREIGN KEY durante la creación de la tabla o mediante una sentencia ALTER TABLE.


-  Describe el proceso de creación de una nueva tabla en una base de datos PostgreSQL, incluyendo la definición de columnas y restricciones.

```SQL
CREATE TABLE nombre_tabla (
    columna1 tipo_dato1,
    columna2 tipo_dato2,
    ...
    CONSTRAINT nombre_restriccion restriccion,
    ...
);
```


- Enumera al menos tres tipos de restricciones que se pueden aplicar a nivel de columna en una tabla y explica cuándo se deben utilizar.

1. **PRIMARY KEY**: Se utiliza para identificar de manera única cada fila en una tabla. Debe usarse cuando necesitas una clave única para cada fila.

2. **FOREIGN KEY**: Se utiliza para mantener la integridad referencial entre dos tablas. Debe usarse cuando necesitas establecer relaciones entre tablas basadas en valores de columna.

3. **CHECK**: Se utiliza para aplicar una condición a los valores en una columna. Debe usarse cuando necesitas asegurarte de que los valores en una columna cumplan con ciertos criterios.

- ¿Qué son las secuencias (sequences) en PostgreSQL y cómo se utilizan para generar valores automáticos en una columna?


 Las secuencias son objetos de base de datos que generan secuencias de números únicos. Se pueden utilizar para generar valores automáticos en una columna, como valores de clave primaria

 ```SQL
 CREATE SEQUENCE nombre_secuencia START 1;
 ```

 Luego, puedes usar esta secuencia al definir una columna con el tipo de dato SERIAL o al establecer el valor predeterminado de una columna:

 ```SQL
 CREATE TABLE ejemplo (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    otra_columna INT DEFAULT nextval('nombre_secuencia')
);
 ```

