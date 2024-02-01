---
title: Algoritmos
author: Alan Yahir Juárez Rubio
type: Investigación
aliases: Análisis de algoritmos
tags: algoritmo, complejidad
creation date: 23-01-2024
last modification date: 23-01-2024
---

# Algoritmos

Un **algoritmo** es una serie de pasos finitos y ordenados que permiten llegar a un resultado. Estos pasos o instrucciones deben de evitar la ambiguedad, deben ser concisos para poder ser interpretados correctamente. Por último, un algoritmo tiene que ser replicable, es decir, al aplicar el algoritmo exactamente igual, deberá dar el mismo resultado.

## Ejemplos

### Reemplazar un neumático

1. Ubicar la llanta a remplazar
2. Sacar la llanta de refacción
3. Con una llave de cruz o maneral afloja cada uno de los birlos de la llanta a quitar (girándolos en sentido antihorario). Sin quitar los birlos
4. Pon el gato hidraúlico debajo del coche. Insertalo en la ranura para poder levantarlo
5. Levanta el vehículo a unos 10-15 cm del suelo, girando la manivela del gato en sentido horario
6. Retira los birlos de la llanta
7. Jala la llanta para retirarla
8. Coloca la llanta de refacción. Toma la llanta e inserta los orificios del rin en los tornillos de los birlos
9. Baja tu vehículo, girando la manívela en sentido antihorario
10. En caso de que la presión del neumático no sea la adecuada, con un compresor de aire nivela la presión del neumático para evitar inconvenientes. De no ser posible en el momento, puedes hacerlo después (en una gasolinería, p. ej),
11. Retire el gato hidráulico debajo del vehículo
12. Apriete bien los birlos del neumático
13. Guarde la llanta reemplazada y la herramienta utilizada

### Limpiar las keycaps de un teclado mecánico

1. Retirar las keycaps del teclado, preferentemente con un removedor de keycaps
2. Poner las keycaps en un recipiente con agua y jabon
3. Talla cuidadosamente las keycaps con tus manos para remover la suciedad
4. Enjuagalas con agua
5. Dejalas secar con aire (encima de una toalla, p. ej.). Evita exponerlas al Sol
6. Una vez secas completamente, coloca cuidadosamente y en la posición correcta cada una de las keycaps en el teclado.

<div style="page-break-after: always;"></div>

## Clasificación de Algoritmos

### Según su función y aplicación

#### Ordenamiento

Son aquellos que buscar ordenar los elementos de una estructura de datos en base a una característica (alfábeticamente, de menor a mayor, más reciente...).

- **Burbuja:** Comparan cada elemento de la lista a ordenar, intercambiando posiciones si no están ordenados correctamente.
- **Por selección:** Ordenan a partir del elemento más pequeño de forma consecutiva.
- **Rápido:** Escogen un elemento del conjunto y reubican el resto en torno a este en función de si son menores o mayores respecto a él.

Un ejemplo sería en ordenar ascendente o descendentemente un arreglo desordenado: \[-3, 8, 2, 43, 6\] en \[ -3, 2, 6, 8, 43\] o en \[43, 8, 6, 2, -3\].
#### Búsqueda

Son aquellos que consisten en encontar uno o varios elementos dentro de una estructura de datos.

- **Secuencial:** Comparar el elemento a buscar con cada uno de los elementos del conjunto hasta encontrarlo o hasta recorrer todos los elementos. El recorrido es secuencial.
- **Binario:** Comparan el elemento a buscar con un elemento ubicado en el medio de una serie ordenada para determinar si son iguales.

Un ejemplo sería en buscar un l número 2 en una lista tal como \[15, 9, 4, 2, 0, 24\] o \[1, 4, 7, 10\]; en el primer caso te indicaría que 2 se encuentra en la 4ta posición (2), mientras que en el segundo te indicaría que 2 no existe en el arreglo.
#### Algoritmos voraces

Consiste en un tipo de algoritmo aplicado a problemas de optimización y se utiliza para la toma de decisiones lógicas para llegar a una solución final global. Estos algoritmos no son reversibles una vez que se toma la decisión de ejecutarlos.

Un ejemplo sencillo sería el redimencionamiento de una imagen.
## Importancia del Análisis de Algoritmos en Informática

En informática, el análisis de algoritmos es de vital importancia debido a que nos permite evaluar la eficiencia y rendimiento de un código, de un programa. El análisis del algoritmo consiste en estimar la cantidad de recursos (tiempo y memoria) que requerira al ser ejecutado.

## Métodos para el Análisis de Eficiencia de Algoritmos

### Medición de tiempo

Consiste en poner un temporizador justo al iniciar el programa y detenerlo justo cuando termina, es decir, medimos el tiempo que tomó en ejecutarse el programa. Si bien este proceso es un tanto sencillo, no es del todo ideal; el tiempo de ejecución puede variar según la cantidad de recursos disponibles en la máquina, la temperatura, entre otros factores. Además, el tiempo de ejecución dependerá del computador utilizado.

### Complejidad Algoritmica

La **complejidad** de un algoritmo o un programa consiste en una función matemática que describe el comportamiento de dicho algoritmo. Este se basa en el análisis del algoritmo para poder calcular la cantidad de operaciones elementales que se realizaran al ser ejecutado. Entre más rápido escala la cantidad de operaciones, más complejo es y viceversa.

## Casos

- **Mejor caso:** Número mínimo de pasos dados en cualquier instancia de tamaño N
- **Peor caso:** Número mínimo de pasos dados en cualquier instancia de tamaño N
- **Caso promedio:** Número promedio de pasos dados en cualquier instancia de tamaño N

<div style="page-break-after: always;"></div>

## Referencias

- Ferrovial (s. f.)._¿Qué son los algoritmos?_ https://www.ferrovial.com/es/stem/algoritmos/
- Báez L. (s. f.). _Análisis de algoritmos_. http://www.luchonet.com.ar/aed/?page_id=209
- Ionos (febrero 14, 2023). _¿Qué es un algoritmo? Definición y ejemplos_. https://www.ionos.es/digitalguide/online-marketing/analisis-web/que-es-un-algoritmo/