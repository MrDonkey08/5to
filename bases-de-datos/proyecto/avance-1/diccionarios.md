# Diccionario del Sistema de Derrumbes

## Contacto

| Atributo | Null? | Tipo    | Llave |
| -------- | ----- | ------- | ----- |
| Nombre   | No    | VARCHAR |       |
| Teléfono | No    | VARCHAR |       |
| ID       | No    | INT     | PK    |

## Dirección

| Atributo           | Null? | Tipo    | Llave |
| ------------------ | ----- | ------- | ----- |
| Calle              | No    | VARCHAR |       |
| Número_Interior    | No    | INT     |       |
| Colonia            | No    | VARCHAR |       |
| Entidad            | No    | VARCHAR |       |
| ID                 | No    | INT     | PK    |
| Tipo_de_Residencia | Sí    | VARCHAR |       |
| Ubicación          | No    | VARCHAR |       |

## Derrumbe

| Atributo     | Null? | Tipo    | Llave |
| ------------ | ----- | ------- | ----- |
| Descripción  | No    | VARCHAR |       |
| Necesidades  | No    | VARCHAR |       |
| Tipo_de_Daño | No    | VARCHAR |       |
| ID           | No    | INT     | PK    |
| Estatus      | No    | VARCHAR |       |
| ID_Contacto  | No    | INT     | FK    |
| ID_Direccion | No    | INT     | FK    |