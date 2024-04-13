# Postgresql: Importación y Exportación de Datos en CSV

## Importación desde CSV

### Importación de registro

1. Abrir psql:
  
```shell
psql
```

2. Crear base de datos `educacion_superior`:

```sql
CREATE DATABASE educacion_superior;
```

3. Establecer `educacion_superior` como base de datos actual:

```sql
\c educacion_superior
```

4. Crear tabla `registro`:

```sql
CREATE TABLE registro (
	nombre VARCHAR(80) NOT NULL,
	bd VARCHAR(20)
);
```

5. Utilizar el comando `\COPY` para realizar la importación del CSV en la tabla `registro`:

```sql
\COPY registro
FROM '/home/alan08/Desktop/imports/registro.csv'
WITH DELIMITER ',';
```

<div style="page-break-after: always;"></div>

### Resultados

![ | center](img/1-tabla_registro.jpg)

<center>Fig 1: Descripción de la tabla registro</center>

![ | center](img/2-tabla_registro.jpg)

<center>Fig. 2: Datos de la tabla registro</center>

<div style="page-break-after: always;"></div>

### Importación de matriculaciones

1. Abrir psql:
  
```shell
psql
```

2. Crear base de datos `educacion_superior`:

```sql
CREATE DATABASE educacion_superior;
```

3. Establecer `educacion_superior` como base de datos actual:

```sql
\c educacion_superior
```

4. Crear tabla `matriculaciones`:

```sql
CREATE TABLE matriculaciones (
	anio INT NOT NULL,
	codigo_establecimiento INT NOT NULL,
	codigo_departamento INT NOT NULL,
	nombre_departamento VARCHAR(30) NOT NULL,
	codigo_distrito INT NOT NULL,
	nombre_distrito VARCHAR(40) NOT NULL,
	codigo_zona INT NOT NULL,
	nombre_zona VARCHAR(25) NOT NULL,
	codigo_barrio_localidad INT NOT NULL,
	nombre_barrio_localidad VARCHAR(60) NOT NULL,
	codigo_institucion INT NOT NULL,
	nombre_institucion VARCHAR(60) NOT NULL,
	sector_o_tipo_gestion VARCHAR(30) NOT NULL,
	anio_cod_geo INT NOT NULL,
	matricula_ets_hombre INT NOT NULL,
	matricula_ets_mujer INT NOT NULL,
	matricula_fed_hombre INT NOT NULL,
	matricula_fed_mujer INT NOT NULL,
	matricula_fdes_hombre INT NOT NULL,
	matricula_fdes_mujer INT NOT NULL,
	matricula_pd_hombre INT NOT NULL,
	matricula_pd_mujer INT NOT NULL
);
```

5. Utilizar el comando `\COPY` para realizar la importación del CSV en la tabla `registro`:

```sql
\COPY matriculaciones
FROM '/home/alan08/Desktop/imports/matriculaciones_educacion_superior_2012.csv'
WITH DELIMITER ',' CSV HEADER;
```

> [!NOTE]
> 
> Como en este caso el csv cuenta con _headers_ se le agregó el parámetro `CSV HEADER` al _flag_ `WITH` para que ignore la primera fila:

<div style="page-break-after: always;"></div>

### Resultados

![ | center](img/3_tabla_matriculaciones.jpg)

<center>Fig 3: Descripción de la tabla matriculaciones</center>

![ | center](img/4-tabla_matriculaciones.jpg)

<center>Fig. 4: Datos de la tabla matriculaciones</center>

<div style="page-break-after: always;"></div>

## Exportación a CSV

### Exportación de registro

1. Abrir psql:
  
```shell
psql
```

2. Establecer `educacion_superior` como base de datos actual:

```sql
\c educacion_superior
```

3. Hacer exportación de la tabla `registro` con el siguiente comando:

```sql
\COPY (SELECT * FROM registro) 
TO '/home/alan08/Desktop/exports/registro.csv' 
WITH DELIMITER ',' CSV HEADER;
```

<div style="page-break-after: always;"></div>

### Resultado

![ | center](img/5-export_registro.jpg)

<center>Fig. 5: Visualización del CSV exportado en texto plano</center>

<div style="page-break-after: always;"></div>

### Exportación de registro

1. Abrir psql:
  
```shell
psql
```

2. Establecer `educacion_superior` como base de datos actual:

```sql
\c educacion_superior
```

3. Hacer exportación de la tabla `registro` con el siguiente comando:

```sql
\COPY (SELECT * FROM matriculaciones) 
TO '/home/alan08/Desktop/exports/matriculaciones.csv' 
WITH DELIMITER ',' CSV HEADER;
```

<div style="page-break-after: always;"></div>

### Resultado

![ | center](img/6-erport_matriculaciones.jpg)

<center>Fig. 6: Visualización del CSV exportado en texto plano</center>