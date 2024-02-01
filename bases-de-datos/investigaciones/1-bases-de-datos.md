---
title: Bases de Datos
author: Alan Yahir Juárez Rubio
type: Investigación

aliases: Gestores de Bases de Datos
tags: mysql, oracle, monngodb

creation date: 21-01-2024
last modification date: 21-01-2024
---

# Bases de Datos

Una **Base de Datos** (BD) es un sistema electrónico encargado de recopilar y organizar información. Estos alamacenan datos de personas, productos, pedidos, documentos, imágenes, etc.

Anteriormente, las _bases de Datos_ eran administradas en _hojas de cálculo_ o _archivos de texto plano_, sin embargo, a medida que los datos aumenta, comienzan a aparecer redundancias e inconsistencias en los datos. Para solucionar estos problemas fueron desarrollados los _Gestores de Bases de Datos_.

## Gestores de Bases de Datos

Un **Gestor de Base dStructured Query Languagee Datos** (GBD) es un sistema electrónico que permite crear, gestionar y adiminstrar _bases de datos_. 

En la actualidad existen 2 tipos de _gestores de bases de datos_ según la manera en que los datos son administrados

#### Relacionales (SQL)

Desarrolladas en los 70's. Los datos son almacenados en multiple tablas relacionadas, en la que los datos son almacenados en filas y columnas. SQL (_Structured Query Language_) es el lenguaje más común para leer, actualizar y administrar _bases de datos relacionales_ 

#### No Relacionales (NOSQL)


Las **Bases de Datos no Relacionales** son un modelo nuevo y en constante crecimiento. A diferencia de las _relacionales_, estas permiten almacenar y manipular datos no estructurados y semiestructurados. Sus principales ventjas son que permiten manejar grandes volúmenes de datos, pueden ser manipulados en tiempo real.


### MySQL

#### Características

 - **Arquitectura Cliente y Servidor**: Basa su funcionamiento en un modelo cliente-servidor., es decir, clientes y servidores se comunican entre sí de manera diferenciada para un mejor rendimiento. Cada cliente puede hacer consultas a través del sistema de registro para obtener datos, modificarlos, guardar estos cambios o establecer nuevas tablas de registros, por ejemplo.
 
- **Compatibilidad con SQL**: SQL es un lenguaje generalizado dentro de la industria. Al ser un estándar MySQL ofrece plena compatibilidad por lo que si has trabajado en otro motor de bases de datos no tendrás problemas en migrar a MySQL.
 
- **Vistas**: Desde la versión 5.0 de MySQL se ofrece compatibilidad para poder configurar vistas personalizadas del mismo modo que podemos hacerlo en otras bases de datos SQL. En bases de datos de gran tamaño las vistas se hacen un recurso imprescindible.
 
- **Procedimientos almacenados**. No procesa las tablas directamente sino que, a través de procedimientos almacenados, es posible incrementar la eficacia de nuestra implementación.
 
- **Desencadenantes**. Permite automatizar tareas dentro de base de datos. En el momento que se produce un evento otro es lanzado para actualizar registros o optimizar su funcionalidad.
 
- **Transacciones**. Una transacción representa la actuación de diversas operaciones en la base de datos como un dispositivo. El sistema de base de registros avala que todos los procedimientos se establezcan correctamente o ninguna de ellas. En caso por ejemplo de una falla de energía, cuando el monitor falla u ocurre algún otro inconveniente, el sistema opta por preservar la integridad de la base de datos resguardando la información.

#### Requisitos

- **Sistema operativo:** Puede ser instalado en sistemas operativos Windows, Linux y macOS.
- **Espacio en disco:** El espacio necesario para la instalación de MySQL varía según la configuración específica, pero generalmente se recomienda tener al menos 500 MB de espacio libre en disco.
- **Memoria RAM:** Se recomienda tener al menos 2 GB de RAM para un rendimiento óptimo, aunque los requisitos reales dependerán del tamaño y la complejidad de las bases de datos que gestiones.
- **Procesador:** MySQL es compatible con una variedad de procesadores, y se recomienda un procesador de al menos 1 GHz.

#### Tipos de Datos

##### Numéricos

###### Enteros

| Nombre | Longitud | Longitud (UNSIGNED) |
| :--: | :--: | :--: |
| Tinyint | -128 a 127 | 0 a 254 |
| Smallint | -32, 768 a 32, 767 | 0 a 65535 |
| Mediumint | -8' 388, 608 a 8' 388, 608 | 0 a 16' 777, 215 |
| Int | -2, 147' 483, 648 a 2, 147' 483, 647 | 0 a 4, 294' 967, 295 |
| Bigint | -9' 223, 372' 036, 854' 775, 808 a 9' 223, 372' 036, 854' 775, 807 | 0 a 18' 446, 744' 073, 709' 551, 615 |

###### Decimales

Puede definir la longitud de visualización (M) y el número de decimales (D).

- **Decimal:** almacenar números decimales de punto fijo grandes, por lo que sus cálculos son exactos. 
- **Float:** Permite almacenar números decimales de punto flotante pequeños, por lo que sus cálculos son aproximados. 
- **Double:** Permite almacenar números decimales de punto flotante grandes, por lo que sus cálculos son aproximados.

##### Cadenas

| Nombre | Descripción | Longitud | Uso |
| :--: | :--: | :--: | :--: |
| Char (M) | Almacena la cadena en la memoria, pero no usa todo el espacio.<br>Sirve para **guardar textos breves**. | De 1 a 255 caracteres | Cadena de longitud fija |
| Varchar (M) | El largo del texto depende de la información que brinda el usuario. | De 1 a 255 caracteres<br>En la versión de MySQL 5.0.3. cambió a un máximo de 65535 caracteres | Cadena de longitud variable<br> |

###### Blob (Objetos Grandes Binarios)

Guarda la información en lenguaje binario y se utiliza este tipo de datos para almacenar imágenes, sonido y archivos.	

| Nombre | Descripción | Longitud |
| :--: | :--: | :--: |
| Tinyblob | 255 bytes | Cadena binaria de no más de 255 caracteres |
| Blob | 65535 bytes | Datos de texto largo en binario |
| Mediumblob | 16777215 bytes | Datos de texto medio en forma binaria |
| Longblob | 4 GB | Datos de texto grande en forma binario |
###### Text

Empleado para guardar grandes cantidades de texto como blogs, noticias, comentarios, publicaciones, etc.

| Nombre | Descripción | Longitud |
| :--: | :--: | :--: |
| Tinytext | 255 bytes | Cadena de texto corto |
| Text | 65535 bytes | Cadenas de texto largo |
| Mediumtext | 16777215 bytes | Cadena de texto mediano |
| Longtext | 4294967295 bytes | Cadena de texto grande |

###### Otros

| Nombre | Descripción | Longitud |
| :--: | :--: | :--: |
| **ENUM**<br><br>Enumeración | Tipo de datos espacial que se usa para **definir valores predeterminados de una lista** y solo los que estén predefinidos podrán usarse. Los valores deben estar separados por comas y entre comillas. | Hasta 65535 bytes |
| **SET**<br><br>Conjunto | Lista específica, pero con 64 elementos<br><br>Los valores van entrecomillados y se separan por comas.<br><br>Se puede dejar un espacio en blanco | – |


##### Fecha y hora

| Nombre | Tamaño | Formato | Alcance |
| ---- | ---- | ---- | ---- |
| Date | 3 bytes | AAAA-MM-DD | 01.01.1000 – 9999-12-31 |
| Datetime | 1 byte | Combinación de fecha y hora AAAA-MM-DD HH:MM:SS | 1000-01-01 00:00:00 – 9999-12-31 23:59:59 |
| Timestamp | 4 bytes | Parecido al formato de Datetime, solo que es en presente.<br>YYYY-MM-DD HH:MM:SS // YYYY-MM-DD // YY-MM-DD | 1970-01-01 hasta 2037-12-31 |
| Time | 3 bytes | Almacena la hora en HH:MM:SS | -839:59:59 hasta 839:59:59 |
| Year | 1 byte | Puede almacenar la información en formato de AA o AAAA | 1901/2155 |

<div style="page-break-after: always;"></div>

### Oracle

#### Características

1. **Modelo relacional:** Los usuarios visualizan los datos en tablas con el formato filas/columnas, haciendo más fácil la manipulación y/o modificación.
2. Herramienta de administración Grafica, intuitiva y cómoda de utilizar
3. **Control de acceso**: tecnologías avanzadas para vigilar la entrada a los datos
4. **Protección de datos:** seguridad completa en el entorno de producción y de pruebas y gestión de copias de seguridad
5. Lenguaje de diseño de bases de datos muy completo (PL/SQL): Permite al usuario implementar diseños “activos!, que se puedan adaptar a las necesidades cambiantes de su negocio.
6. **Alta disponibilidad:** posee uno de los modelos de escalabilidad, protección y alto rendimiento que le permite implementar en la entidad los planes de HA
7. **Gestión de usuarios:** agilidad en los trámites, reducción de costes y seguridad en el control de las personas que acceden a las aplicaciones y datos

#### Requisitos

##### Mínimos

- **SO:** Microsoft Windows 7 / 8 / 10  
- **Procesador:** Quad core 2.4GHz  
- **Memoria:** 1 GB de RAM  
- **Gráficos:** NVidia GTX 360 ó Radeon HD 5970  
- **DirectX:** Versión 11  
- **Almacenamiento:** 2 GB de espacio disponible  
- **Tarjeta de sonido:** DirectX 11 compatible Tarjeta de sonido

##### Recomendados

- **SO:** Microsoft Windows 7 / 8 / 10  
- **Procesador:** Intel i3-3220 ó AMD FX-6300  
- **Memoria:** 2 GB de RAM  
- **Gráficos:** NVidia GTX 950 ó Radeon RX 460  
- **DirectX:** Versión 11  
- **Almacenamiento:** 2 GB de espacio disponible  
- **Tarjeta de sonido:** DirectX 11 compatible Tarjeta de sonido
- 
#### Tipos de Datos

| Data Type | Category  | Description  |
|-----------|---------------|--------------------------------------------------------------|
| NUMBER| Numeric   | Used to store numeric values with high precision |
| INTEGERs  | Numeric   | Used to store whole number   |
| FLOAT | Numeric   | Used to store approximate numeric values |
| CHAR  | Character | Used to store fixed-length character strings |
| NCHAR | Character | Used to store fixed-length national character set strings|
| VARCHAR2  | Character | Used to store variable-length character strings  |
| NVARCHAR2 | Character | Used to store variable-length national character set strings |
| CLOB  | Large Object  | Used to store large character data   |
| NCLOB | Large Object  | Used to store large national character set data  |
| LONG  | Large Object  | Used to store variable-length character data |
| BLOB  | Large Object  | Used to store binary data|
| DATE  | Date and Time | Used to store date and time information  |
| TIMESTAMP | Date and Time | Used to store more precise date and time information |
| RAW   | Other | Used to store variable-length binary data|

### MongoDB

#### Características

- **Consultas ad hoc**. Con MongoDb podemos realizar todo tipo de consultas. Podemos hacer búsqueda por campos, consultas de rangos y expresiones regulares. Además, estas consultas pueden devolver un campo específico del documento, pero también puede ser una función JavaScript definida por el usuario.
 
- **Indexación**. El concepto de índices en MongoDB es similar al empleado en bases de datos relacionales, con la diferencia de que cualquier campo documentado puede ser indexado y añadir múltiples índices secundarios.
 
- **Replicación**. Del mismo modo, la replicación es un proceso básico en la gestión de bases de datos. MongoDB soporta el tipo de replicación primario-secundario. De este modo, mientras podemos realizar consultas con el primario, el secundario actúa como réplica de datos en solo lectura a modo copia de seguridad con la particularidad de que los nodos secundarios tienen la habilidad de poder elegir un nuevo primario en caso de que el primario actual deje de responder.
 
- **Balanceo de carga**. Resulta muy interesante cómo MongoDB puede escalar la carga de trabajo. MongoDB tiene la capacidad de ejecutarse de manera simultánea en múltiples servidores, ofreciendo un balanceo de carga o servicio de replicación de datos, de modo que podemos mantener el sistema funcionando en caso de un fallo del hardware.

- **Almacenamiento de archivos**. Aprovechando la capacidad de MongoDB para el balanceo de carga y la replicación de datos, Mongo puede ser utilizado también como un sistema de archivos. Esta funcionalidad, llamada GridFS e incluida en la distribución oficial, permite manipular archivos y contenido.
 
- **Ejecución de JavaScript del lado del servidor.** MongoDB tiene la capacidad de realizar consultas utilizando JavaScript, haciendo que estas sean enviadas directamente a la base de datos para ser ejecutadas.

#### Requisitos

- MongoDB es compatible con varios sistemas operativos, incluidos Windows, Linux y macOS.
- Se necesita suficiente espacio en disco para almacenar los datos, y el rendimiento dependerá de la carga de trabajo y la cantidad de datos.
- La memoria RAM es crucial para un rendimiento óptimo; se recomienda tener al menos 8 GB de RAM, aunque los requisitos específicos pueden variar.
- Procesador: MongoDB es compatible con varios tipos de procesadores.

#### Tipos de Datos

- **String:** El tipo de dato más comúnmente utilizado para almacenar datos de texto.
- **Integer:** Se utiliza para almacenar valores numéricos enteros.
- **Boolean:** Almacena valores booleanos (true/false).
- **Double:** Se utiliza para almacenar valores de punto flotante.
- **Min/Max keys:** Se utiliza para comparar un valor contra los elementos BSON más bajos y más altos.
- **Arrays:** Almacena matrices o listas de valores múltiples en una clave.
- **Timestamp:** Marca de tiempo que puede ser útil para registrar cuándo se ha modificado o agregado un documento.
- **Object:** Se utiliza para documentos integrados.
- **Null:** Se utiliza para almacenar un valor nulo.
- **Symbol:** Similar a una cadena, generalmente reservada para lenguajes que utilizan un tipo de símbolo específico.
- **Date:** Almacena la fecha y la hora en el formato de tiempo UNIX.
- **Object ID:** Se utiliza para almacenar el ID del documento.
- **Binary data:** Se utiliza para almacenar datos binarios.
- **Code:** Almacena código JavaScript en el documento.
- **Regular expression:** Se utiliza para almacenar expresiones regulares.

<div style="page-break-after: always;"></div>

## Conclusión

En restrospectiva, una base de datos no es más que un sistema electrónico el cual permite guardar grandes cantidades de datos de cualquier tipo para poder ser utilizada o gestionada usuarios y programas. Por otra parte, los _gestores de base de datos_ son la herramienta mediante el cual el usuario puede crear _bases de datos_ y, además, guardar, consultar y manigular información de dichas _bases de datos_.

Si bien existen una infinidad de _bases de datos_ y una gran variedad de categorías, la elección de la o las _bases de datos_ a utilizar dependerá de las preferencias, uso y necesidades respecto al tipo de información.

<div style="page-break-after: always;"></div>

## Referencias

- Soporte de Microsoft (s. f.). _Conceptos básicos sobre bases de datos_. Consultado el 21 de enero de 2024 de https://support.microsoft.com/es-es/topic/conceptos-b%C3%A1sicos-sobre-bases-de-datos-a849ac16-07c7-4a31-9948-3c8c94a7c204

- Marín R. (abril 16, 2019). _Los gestores de bases de datos más usados en la actualidad._ Consultado el 21 de enero de 2024 de https://www.inesem.es/revistadigital/informatica-y-tics/los-gestores-de-bases-de-datos-mas-usados/#puntouno

- Robledano, A. (septiembre 24, 2019). _Qué es MySQL: Características y ventajas_. Consultado el 21 de enero de 2024 de https://openwebinars.net/blog/que-es-mysql/

- Matillion (noviembre 18, 2020). _The Types of Databases (with Examples)_. Consultado el 21 de enero de 2024 de https://www.matillion.com/blog/the-types-of-databases-with-examples

- Bambu Editorial. _Tipos de datos en MySQL. Consultado el 21 de enero de 2024 de https://bambu-mobile.com/tipos-de-datos-en-mysql/
 
- Durán, M. (enero 21, 2023). _Los 5 tipos de datos en MySQL y cómo utilizarlos_. Consultado el 21 de enero de 2024 de https://blog.hubspot.es/website/tipos-de-datos-mysql

- Kennertech (junio 12, 2023). __. Consultado el 21 de enero de 2024 de https://www.kennertech.com.co/oracle-base-de-datos/

- Bobriakov, I. (junio 20, 2023) _A Guide to Data Types in Oracle_. Consultado el 21 de enero de 2024 de https://www.dbvis.com/thetable/data-types-in-oracle/

- Tutorialspoint (s. f.). _MongoDB - Datatypes_. Consultado el 21 de enero de 2024 de https://www.tutorialspoint.com/mongodb/mongodb_datatype.htm

- Vandal (mayo 18, 2020). _REQUISITOS DE ORACLE_. Consultado el 21 de enero de 2024 de https://vandal.elespanol.com/requisitos/pc/oracle/46419#p-13