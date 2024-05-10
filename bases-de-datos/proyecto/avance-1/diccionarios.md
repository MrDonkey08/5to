# Diccionario del Sistema de Derrumbes

## Contacto

| Atributo | Null? | Tipo        | Llave |
| -------- | ----- | ----------- | ----- |
| ID       | No    | SERIAL      | PK    |
| Nombre   | No    | VARCHAR(80) | -     |
| Telefono | No    | VARCHAR(25) | -     |

## Ubicacion

| Atributo | Null? | Tipo           | Llave |
| -------- | ----- | -------------- | ----- |
| ID       | No    | SERIAL         | PK    |
| Enlace   | Sí    | VARCHAR(200)   | -     |
| Latitud  | -     | DECIMAL(10, 8) | -     |
| Longitud | -     | DECIMAL(11, 8) | -     |

## Municipio

| Atributo | Null? | Tipo        | Llave |
| -------- | ----- | ----------- | ----- |
| ID       | No    | SERIAL      | PK    |
| Nombre   | No    | VARCHAR(40) | -     |

## Estado

| Atributo | Null? | Tipo        | Llave |
| -------- | ----- | ----------- | ----- |
| ID       | No    | SERIAL      | PK    |
| Nombre   | No    | VARCHAR(40) | -     |

## Direccion

| Atributo           | Null? | Tipo         | Llave |
| ------------------ | ----- | ------------ | ----- |
| ID                 | No    | SERIAL       | PK    |
| Calle              | No    | VARCHAR(100) | -     |
| Numero_exterior    | No    | INT          | -     |
| Colonia            | Sí    | VARCHAR(50)  | -     |
| Tipo_de_Residencia | No    | VARCHAR(30)  | -     |
| ID_Ubicacion       | No    | INT          | FK    |
| ID_Municipio       | No    | INT          | FK    |
| ID_Estado          | No    | INT          | FK    |

## Derrumbe

| Atributo     | Null? | Tipo         | Llave |
| ------------ | ----- | ------------ | ----- |
| ID           | No    | SERIAL       | PK    |
| Descripcion  | No    | VARCHAR(200) | -     |
| Necesidades  | Sí    | VARCHAR(100) | -     |
| Tipo_de_Dano | Sí    | VARCHAR(40)  | -     |
| Estatus      | Sí    | VARCHAR(30)  | -     |
| ID_Contacto  | No    | INT          | FK    |
| ID_Direccion | No    | INT          | FK    |

## Rescatista

| Atributo | Null? | Tipo        | Llave |
| -------- | ----- | ----------- | ----- |
| ID       | No    | SERIAL      | PK    |
| Nombre   | No    | VARCHAR(80) | -     |
| Telefono | No    | VARCHAR(25) | -     |
| Horas    | Sí    | INT         | -     |
| Puesto   | Sí    | VARCHAR(80) | -     |
