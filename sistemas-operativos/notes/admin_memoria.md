# Administración de Memoria

## Jerarquia de Memoria

| Nivel | Memoria | Gestión |
|:-:|:-:|:-:|
|0|Registros| 
|1|Memoria Cache|
|2|Memoria Principal|
|3|Memoria Expandida|
|4|Discos|

## Objetivos

- Proporcionar protección entre los procesos.
- Oferecr a cada proceso un espacio lógico propio
- Permitir que los procesos compartan memoria
- Dar soporte a las distintas regiones del proceso
- Maximizar el rendimiento del sistema
- Proporcionar a los procesos mapas de memoria muy grande

> Mapa de Memoria

## Reubicación

Traducción de lógico a fisico:

Parte física: Espacio en donde se ubica la "variable"

Proceso de traducción de las direcciones de memoria a las que hacen referencia...

Necesaria en SO con multiprogramación
Reubicar: Traducir direcciones lógicar a físicas

---
## Protección

## Compartición

Facilita el que los procesos compartan el código

La memoria compartida permite una comunicación muy rápida entre proceso compartidos

## Soporte de regiones

## Maximizar rendimiento

Reparto de memoria maximizando el grado de multiprogramación

Se "desperdicia" memoria debido a:

- "Restos" inutilizables (fragmentación)
- Tablas requeridas por el gestor de Memoria
- Uso de Memoria Virtual para aumentar grado de multiprogramación

## Particiones

### Estáticas

### Dinámica

Proceso completo debe de quedar junto. La partición se crea cuando se necesita 

Las particiones se crean dinámicamente, de forma que cada proces se carga en un espacio de exactamente el mismo tamaño que el procesoA

Existe Fragmentación externa

Lo que contrarresta la fragmentación externa es la compactacion

La fragmentación externa sí tiene solución, se llama compactar

#### Técnicas de Ajuste y Colocación

- Primer ajuste: Se va al inicio de la memoria, y en donde encuentre Espacio
- Siguiente ajuste: Donde fue el último accesos
- Mejor ajuste: El espacio más pequeño
- Peor ajuste: El espacio más grande.

Es necesario tener ordenado ascendente o descendentemente o buscar el menor o el mayor respectivamente

> Overlays

#### Paginación Simple

Corrige los errores que hubieron en particiones

Todos los frames son del mismo tamaño

El proceso necesita dividirse en páginas

Para que un proceso entre en memoria, es necesario dividirlo en páginas


