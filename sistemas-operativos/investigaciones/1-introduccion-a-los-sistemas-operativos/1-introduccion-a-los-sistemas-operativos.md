---
title: act_1
author: Alan Yahir Juárez Rubio
type: Actividad

creation date: 28-01-2024
last modification date: 28-01-2024
---

# Sistemas Operativos

## Archivo por lotes

```shell
mkdir proyecto # Crea el directorio proyecto en la ruta actual
cd proyecto # Te desplazas hacia la carpeta proyecto del directorio actual
touch main.cpp # Creas el archivo main.cpp
vim main.cpp # Abres el archivo main.cpp con el editor de texto de terminal vim
head main.cpp # Muestra las primeras 10 de texto del archivo main.cpp
tails main.cpp # Muestra las últimas 10 líneas de texto del archivo main.cpp
less main.cpp # Muestra el contenido del archivo main.cpp
cp main.cpp funciones.h # Crea una copia del archivo main.cpp con el nombre de funciones.h
nano funciones.h # Abre el arhivo funciones.h en el editor de terminal nano
cat main.cpp funciones.h # Concatena los archivos main.cpp y funciones.h para mostrar su contenido
cd ../ # Te desplazas a la carpeta anterior (carpeta padre) del directorio actual (proyecto)
mv ./proyecto ~/Desktop # Mueve la carpeta proyecto en el escritorio 
```

<div style="page-break-after: always;"></div>

## Libros de Sistemas Operativos

### Operating Systems: Internals and Design Principles

#### Portada

![ | center | 400 ](attachments/2-libro.png)

#### Autores

- William Stallings

#### Contenido

1. Background
2. Processes
3. Memory
4. Scheduling
5. Input/Output and Files
6. Embedded Systems
7. Computer Security
8. Distributed Systems

<div style="page-break-after: always;"></div>

### Sistemas operativos: panorama para la ingeniería en computación e informática

#### Portada

![ | center | 400 ](https://df5kbf1hky40.cloudfront.net/content/book_covers/40429_24231434.png)

#### Autores

- Daniel Sol Llaven

#### Contenido

1. Introducción al estudio de los sistemas operativos
2. Generalidades de sistemas operativos
3. Administración de procesos
4. Administración de memoria
5. Administración de los dispositivos de entrada y salida
6. Administración de sistemas de archivos
7. Sistemas distribuidos
8. Panorama de seguridad informática

### Fundamentos de Sistemas Operativos

#### Portada

![ | center | 400 ](https://df5kbf1hky40.cloudfront.net/content/book_covers/175153_07130002.png)

#### Autores

- Cura Norberto Julián

#### Contenido

1. Los sistemas de base. Conceptos
2. Sistemas de Archivos
3. Entrada/Salida
4. Memoria Virtual. Intercambio
5. Procesos

<div style="page-break-after: always;"></div>

### Sistemas Operativos

#### Portada

![ center | 400 ](https://df5kbf1hky40.cloudfront.net/content/book_covers/77467_26060431.png)

#### Autores

 - David Luis La Red Martínez

#### Contenido

1. Introducción
2. Procesos y Administración del Procesador
3. Administración de la memoria
4. Sistemas de Archivos
5. Entrada / Salida
6. Bloques
7. Sistemas Operativos Distribuidos
8. Comunicación en los Sistemas Distribuidos
9. Sincronización en Sistemar Distribuidos
10. Procesos y Procesadores en Sistemas Distribuidos
11. Sistemas Distribuidos de Archivos
12. Rendimiento
13. Modelado Analítico en Relación al Rendimiento
14. Seguridad de los Sistemas Operativos
15. Planificación del Procesador con P.O.O
16. Paginación de Memoria Virtual con S. E.
17. Subsistema de Disco de Una Petición
18. Subsistema de Dssco de Varias Peticiones
19. Búsqueda en Disco con Redes Neuronales
20. Concurrencia e Hilos con Java
21. Anomalía de Belady con Matlab

<div style="page-break-after: always;"></div>


### Modern Operating Systems

#### Portada

![ | center | 400 ](attachments/1-libro.png)

#### Autores

- Andrew S. Tanenbaum
- Herbert Bos

#### Contenido

1. Introduction
2. Processes and Threads
3. Memory Managment
4. File Systems
5. Input/Output
6. Deadlocks
7. Virtualization and the cloud
8. Multiple Processor Systems
9. Security
10. Case Study 1: Unix, Linux, Android
11. Case Study 2: Windows 8
12. Operating System Design
13. Reading List and Bibliography

<div style="page-break-after: always;"></div>

## Evolución de los Sistemas Operativos

### Computadoras de Propósito General

Las primeras computadoras electromecánicas se realizaron con ciertos propósitos es­ pecíficos. En el caso de Mark II, este propósito fue el cálculo de tablas de tiro para la Marina al final de la Segunda Guerra Mundial. Como la aplicación era específica, las capacidades del equipo, la forma en que operaban, e incluso los lenguajes, se diseñaron con las capacidades necesarias sin emplear recursos o esfuerzos significativos adiciona­ les. Aunado a esto, los investigadores que desarrollaron el equipo dieron continuidad al diseño de las aplicaciones y soporte a la operación.

Hoy día, las computadoras de propósito particular, basadas en procesadores o microcontroladores que en ocasiones no requieren modos protegidos de operación, pueden seguir modelos similares de desarrollo de sistemas de información para ser aplicados con recursos específicos acordes a sus necesidades, con mínimos requeri­ mientos de compatibilidad y muy poca o nula conectividad.

### Computadoras comerciales monoproceso

Con el éxito de las primeras computadoras electromecánicas, el uso de dispositivos electrónicos, como los tubos de vacío y después los transistores, y con los avances en materia de lenguajes de programación como el ensamblador, los compiladores y las subrutinas, resultó rentable el desarrollo de computadoras comerciales como la UNIVAC o los sistemas 360 de IBM. Estas computadoras se comercializaban junto con los servicios necesarios para el desarrollo de las aplicaciones y los programas, bibliote­ cas para control de dispositivos de entrada y salida y también programas orientados a cargar los programas y los datos, usualmente de medios como las cintas y tarjetas per­ foradas, y después cintas magnéticas, para presentar los resultados también en cintas y tarjetas perforadas, hasta llegar a teletipos y discos magnéticos.

A diferencia de las primeras computadoras, el equipo que las diseña y construye no está relacionado de manera directa con el desarrollo de aplicaciones; además, el tipo de aplicaciones que se desarrollan son más variadas y cercanas a las necesidades produc­ tivas de las empresas que las adquieren. Las aplicaciones de corte administrativo y las diseñadas para realizar cálculos matemáticos sobresalen, y ninguno de estos proble­ mas es fácilmente representado por el ensamblador o por lenguajes de código ejecutable particulares de las unidades de procesamiento; por ello se generan nuevos lenguajes de programación orientados a los dominios de problemas que se van a atacar, como COBOL o Fortran.

### Multiproceso

Conforme crecen las capacidades de las computadoras, las aplicaciones que en mode­los anteriores hubieran ocupado la totalidad de recursos como la memoria, pasan a ocupar solo una fracción de ellos. Además, nuevas técnicas de construcción de compu­ tadoras a base de circuitos grabados sobre placas de baquelita y el uso de semiconduc­ tores con mayores escalas de integración llevan a capacidades de procesamiento cada vez mayores, cumpliendo incluso con la ley de Moore, la cual describe que dicha capa­ cidad prácticamente se podía duplicar por la mitad del costo cada 18 meses gracias a las técnicas empleadas en la fabricación de nuevos procesadores. Esta tendencia se man­ tuvo entre 1965 y 2008.

Gracias a la reducción del costo y a la disminución de potencia, requerimientos térmicos y espacio que cada procesador tiene, también se comienzan a desarrollar equipos que emplean múltiples procesadores en lo que se conoce como multiprocesa­ miento. Estas computadoras pueden distribuir la capacidad de procesamiento en una serie de particiones, donde cada una tiene una porción de memoria dedicada a un proceso y que es atendida de manera exclusiva por un procesador, pero resulta desea­ ble buscar esquemas más flexibles que permitan una forma de multitarea sin importar el número de procesadores.

### Cómputo Personal

Así surgió una multitud de proyectos aficionados y pequeños fabricantes de arquitecturas peculiares de computadoras de bajo costo orientadas al usuario indi­ vidual. Originalmente, estos equipos tenían sistemas operativos destinados a propor­ cionar un lenguaje de programación, además de dispositivos y aplicaciones orientados a fines específicos. De esta manera, Basic surgió en esta etapa como un lenguaje que fuera sencillo de aprender.

incremento en el número de computadoras en uso hace énfasis en la necesi­ dad de intercambiar información entre ellas, lo que ayuda a popularizar redes de bajo costo y medios de transferencia compartidos como Ethernet mediante cable coaxial y después con cableado sin blindar (UTP5).De manera eventual, las computadoras que integraron mejor el uso de redes de área local a sus sistemas operativos y a sus arqui­ tecturas de hardware tuvieron una ventaja competitiva importante.


Una vez que las redes de área local se esparcieron en casi todas las instituciones, la simulación de la terminal mediante programas que se ejecutan en una computadora personal, conectada mediante la red al mainframe, resulta más económica y además da al usuario final una computadora personal para obtener beneficios adicionales. De manera eventual, los sistemas de mainframe reemplazan el modelo de terminal por completo en favor del cliente servidor o de algún otro modelo de comunicación distri­ buida,


### Masificación de la Internet

Iniciativas como la de ARPANET, del ejército de Estados Unidos de América, ponen a punto los equipos y programas necesarios para dirigir los paquetes de las redes Ethernet a lo largo de múl­ tiples nodos para llevarlos al destino adecuado en otra red de área local. Servicios como la resolución de nombres (DNS), el ruteo de paquetes de red, el correo electrónico y la transferencia de documentos de hipertexto por el protocolo HTTP que da origen a la World Wide Web se basan en este tipo de redes para satisfacer las necesidades de comunicación de las instituciones que ayudan a desarrollar la tecnología, pero poste­ riormente se popularizan para el uso empresarial y personal.


### Cómputo ubicuo

Este tipo de sistemas y aplicaciones requieren que los sistemas operativos se adapten a un conjunto de requerimientos con diferencias importantes. Ubicuo es un término de­rivado del latín que significa en todas partes, y se aplica a los sistemas que cuentan con nodos en operación fuera del acceso sostenido a las instalaciones o servicios, como el acceso a la red, a la potencia eléctrica y a instalaciones convencionales. Fue empleado en el uso de algoritmos de redes autoconfigurables para establecer redes de telefonía celular de emergencia sin usar los proveedores convencionales, como el proyecto Serval, y otras propuestas de telefonía para respuesta a desastres.

### Internet de las cosas

Es otro tipo de sistemas con necesidades diferentes que deben ser atacadas por el sis­ tema operativo. En estos, las ventajas que se pueden lograr con un gran número de dispositivos con capacidades de cómputo moderadas que interactúan en redes de área personal, es decir, en torno a una persona, a una casa, a un auto, etc., constituyen uno de los frentes de expansión de las tecnologías de computación actuales. Comenzamos a ver beneficios en este tipo de dispositivos en el control de edificios, orientados a dis­ minuir los costos de operación y el impacto al medio ambiente; en los autos, para que cuenten con servicios de navegación y entretenimientos superiores, e incluso, en los individuos, quienes pueden monitorear ciertos factores que contribuyan a su salud, entre otros servicios.

## Introducción a los Sistemas Operativos

### Qué es un Sistema Operativo

El sistema operativo es una colección de programas que comparten los mismos mecanismos de distribución. Se genera con el propósito de administrar y extender los recursos o capacidades de los sistemas de información.

### Objetivos

1. Administrar eficientemente los recursos de hardware.
2. Facilitar la interacción usuario-sistema.
3. Proporcionar un entorno seguro para las aplicaciones.
4. Abstraer el hardware para facilitar la portabilidad.
5. Gestionar la ejecución simultánea de procesos.
6. Garantizar seguridad y protección de datos.
7. Ser fiable y tolerante a fallos.
8. Optimizar el rendimiento del sistema.

### Modos de Operación

- **Supervisor:** Tiene acceso completo a todo el hardware y puede ejecutar cualquier instrucción que la máquina sea capaz de ejecutar.
- **Usuario:** Tiene acceso a solo un subconjunto de las instrucciones de la máquina. Por lo general, la instrucciones que afectan al control de la máquina o hacen instrucciones I/O son inaccesibles por los programas de modo de usuario.

### Servicios y Funciones del Sistema

1. **Gestión de recursos:** Controlar y asignar recursos de hardware como la CPU, la memoria, el disco duro y los dispositivos de entrada/salida de manera eficiente entre los diferentes programas que se ejecutan simultáneamente.

2. **Interfaz de usuario:** Proporcionar una interfaz para que los usuarios interactúen con el sistema operativo y los programas de aplicación. Esto puede incluir interfaces gráficas de usuario (GUI) o interfaces de línea de comandos (CLI).

3. **Gestión de archivos:** Organizar y controlar el almacenamiento de datos en dispositivos de almacenamiento como discos duros, unidades USB y unidades de red. Esto incluye la creación, eliminación, lectura y escritura de archivos, así como la gestión de permisos de acceso.

4. **Gestión de memoria:** Administrar la memoria del sistema para garantizar que los programas tengan acceso a la cantidad necesaria de memoria para ejecutarse correctamente, asignando y liberando memoria según sea necesario.

5. **Gestión de procesos:** Supervisar y coordinar la ejecución de los procesos en el sistema, incluida la creación, terminación y suspensión de procesos, así como la asignación de recursos de CPU y memoria.

6. **Comunicación entre procesos:** Facilitar la comunicación y el intercambio de datos entre procesos en el sistema, permitiendo la cooperación y la sincronización entre programas en ejecución.

7. **Gestión de dispositivos de entrada/salida (E/S):** Controlar la comunicación entre el hardware de E/S (como teclados, ratones, impresoras y dispositivos de red) y los programas de aplicación, asegurando un intercambio de datos fluido y eficiente.

8. **Seguridad y control de acceso:** Proteger el sistema y los datos contra accesos no autorizados, mediante la implementación de mecanismos de autenticación, control de acceso y cifrado de datos.

9. **Servicios de red:** Proporcionar soporte para la comunicación en red, permitiendo que los programas accedan a recursos remotos y se comuniquen a través de protocolos de red como TCP/IP.

### Tipos de procesamiento

- **Serie:** En el procesamiento en serie, las tareas se ejecutan una después de la otra, en secuencia. Esto significa que una tarea debe completarse antes de que comience la siguiente. Es como seguir una lista de tareas en la que cada tarea depende del resultado de la anterior. Este enfoque puede ser menos eficiente en términos de tiempo de ejecución, ya que las tareas se ejecutan de manera secuencial, lo que puede llevar más tiempo para completar todas las tareas en comparación con el procesamiento en paralelo.

- **Paralelo:** En el procesamiento en paralelo, las tareas se ejecutan simultáneamente, utilizando recursos de hardware múltiples o compartidos. Esto permite que varias tareas se realicen al mismo tiempo, lo que puede mejorar significativamente el tiempo de ejecución total de las tareas. El procesamiento en paralelo puede tomar varias formas, como el procesamiento simultáneo en múltiples núcleos de CPU, la ejecución de múltiples hilos de un proceso en paralelo o la distribución de tareas entre varios nodos en un sistema distribuido.

## Cuestionario

1. De los libros que buscó liste los temas que tienen en común.

- La mayoría comparten los temas: 
	- Procesos
	- Memoria
	- Dispositivos de entrada y salida
	- Sistemas de archivos
	- Sistemas distribuidos

2. ¿Qué es un archivo por lotes?

- Un archivo por lotes no es más que un archivo que contiene escritos comandos de terminal las cuales pertenecen a una Shell en específico, ya sea cmd o powershell de Windows o Bash, Zsh... de sistemas operativos Unix/GNU. Estos archivos requieren tener permisos de ejecución. Una vez ejecutados estos archivos/programas, comienzan a ejecutar los comandos secuencialmente tal como si los ejecutaras uno por uno en la terminal. 

3. Explique con sus palabras el Procesamiento en Serie.

	El procesamiento en serie consiste en la ejecución de tareas de manera secuencial, es decir, una detrás de otra. Para que una tarea comience primero debe de terminar de ejecutarse la anterior a esta.

4. Definición de Sistema Operativo.

- Un Sistema Operativo no es más que un conjunto de programas los cuales permiten al sistema poder controlar y gestionar los recursos del sistema para los diferentes servicios/programas puedan hacer uso de estos recursos y, en base a ello, que la computadora ejecute instrucciones, tareas. En otras palabras el sistema operativo es el intermediario, el puente de comunicación entre el usuario y el computador.

5. Liste cada uno de los Gestores del Sistema Operativo, así como su función principal.

	1. Gestor de procesos
	2. Gestor de memoria
	3. Gestor de archivos
	4. Gestor de dispositivos de entrada/salida (E/S)
	5. Gestor de archivos de sistema
	6. Gestor de redes
	7. Gestor de seguridad

6. Escriba los objetivos de un sistema operativo.

	1. Administrar eficientemente los recursos de hardware.
	2. Facilitar la interacción usuario-sistema.
	3. Proporcionar un entorno seguro para las aplicaciones.
	4. Abstraer el hardware para facilitar la portabilidad.
	5. Gestionar la ejecución simultánea de procesos.
	6. Garantizar seguridad y protección de datos.
	7. Ser fiable y tolerante a fallos.
	8. Optimizar el rendimiento del sistema.

7. Ilustre y explique en qué consiste el ciclo Fetch.

	- **Fase de Búqueda y Decodificación:**
	
	![ Fetch-Decode | center | ](attachments/1-fetch-decode.webp)
	
	1. Se envía la _dirección de memoria_ de la _instrucción_  del **contador de programa** hacia el **RDM**.
	2. El **selector** toma la _dirección de memoria_ del **RDM** y busca la _instrucción_ (el valor) asociada a esta en la **memoria central** y la envía al **RIM**.
	3. El **RIM** manda la _instrucción_ al **R.I.**
	4. El **R.I.** pasa la _instrucción_ al **decodificador** para "traducirla" de manera que la máquina pueda comprenderla.
	5. El **secuenciador** incrementa uno el **contador de programa** para repetir este proceso al decodificador.
	
	**Fase de Ejecución y Almacenamiento:**
	
	![ Execute-store | center](attachments/2-execute-store.webp)
	
	1. La **unidad de control** accede a su _registro de instrucción_ y manda la _dirección de memoria_ del _primer operando_.
	2. El **selector** busca la _dirección en memoria_ del _primer operando_ y manda su valor al **RIM**.
	3. El **RIM** manda el el _valor del primer operando_  al **REN 1**.
		1. Se repiten estos 3 pasos para el _segundo operando_ para finalmente ser mandado a **REN 2**.
	4. El **secuenciador** envía órdenes al **centro de operaciones** y se guarda el _resultado_ en el _acumulador_.
	5. El _acumulador_ manda dicho _resultado_ al **RIM**.
	6. El **RIM** manda el _resultado_ a la _memoria central_ y, a su vez, el **R.I** manda la _dirección_ en dónde se guardará dicho _resultado_.

8. ¿Cómo podrían clasificarse los diferentes sistemas operativos?

- Se pueden clasificar según su arquitectura, dispositivo, modo de procesamiento, licencia, entorno del usuario, etc.

<div style="page-break-after: always;"></div>

## Referencias

- Sol Llaven, D. (2016). Sistemas operativos: panorama para la ingeniería en computación e informática: ( ed.). México, Mexico: Grupo Editorial Patria. Recuperado de https://elibro-net.wdg.biblio.udg.mx:8443/en/ereader/udg/40429
- Stallings, W. (2012). _Operating Systems Internal and Design Principles_ (7ma edición). Editorial Pearson.
- Tanenbaum, A., (2015). _Modern Operating Systems_ (4ta edición). Editorial Pearson.
