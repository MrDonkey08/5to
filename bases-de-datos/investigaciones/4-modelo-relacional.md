---
title: Modelo Relacional
author: Alan Yahir Juárez Rubio
type: Nota

creation date: 07-02-2024
last modification date: 07-02-2024
---

# Modelo Relacional

El **modelo relacional** consiste en un conjunto de tablas que están relacionadas entre sí. Estas tablas no son mas que una lista de valores con un nombre, donde cada valor es una fila o registro compuesto por una o más columnas o campos.

## Composición de una Tabla

### Primarias

- **Columnas**: Contienen los distintos atributos o campos en los que se desglosará la información.
- **Filas**: Almacenarán las distintas estancias denominadas "registros".

### Adicionales

- **Claves**:
	- **Primaria o Principal**: Campo que realiza la función de *identificador*. Cada *identificador* debe ser único para cada registro.
	- **Ajena**: Campos de la tabla en las que se establecen la relación con otra tabla.

```mermaid
graph TD;
    ModeloRelacional[Modelo Relacional]-->Tablas[Tablas];
    Tablas-->ComposicionTabla[Composición de una Tabla];
    ComposicionTabla-->Columnas[Columnas];
    ComposicionTabla-->Claves[Claves];
    Claves-->PrimariaPrincipal[Primaria o Principal];
    Claves-->Ajena[Ajena];
    Columnas-->Atributos[Atributos];
    Filas-->Registros[Registros];

	Columnas-->Filas
	PrimariaPrincipal-->Identificador;
	Ajena-->OtraTabla[Otra tabla];
	Atributos-->Filas
```

<div style="page-break-after: always;"></div>

## Referencias

- Jiménez Capel, M. Y. (2015). _Bases de datos relacionales y modelado de datos_ (UF1471): (ed.). Antequera, Málaga, Spain: IC Editorial. Recuperado de https://elibro-net.wdg.biblio.udg.mx:8443/es/ereader/udg/44139?page=32.