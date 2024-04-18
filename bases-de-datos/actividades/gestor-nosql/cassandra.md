# Práctica: Introducción a Apache Cassandra

> [!IMPORTANT] Objetivo
>
> Familiarizarse con la instalación, configuración y operaciones básicas de Apache Cassandra.

> [!NOTE]
>
> - El SO utilizado fue Arch Linux.
> - Todo se ejecuta a través de la terminal.

## Instalación por Tarball

### Pre-requisitos

#### Instalación de Java

1. Instalar Java 11.

> [!NOTE]
>
> En la [guía de instalación](https://cassandra.apache.org/doc/latest/cassandra/installing/installing.html) menciona que instales Java 11 o 17, sin embargo, por alguna razón cassandra no funciona con Java 17.

```shell
sudo pacman -S jre11-openjdk
```

2. Verificar que la instalación haya sido correcta.

```shell
java --version
```

3. En caso de salir otra versión, establecer la versión instalada como predeterminado.

```shell
sudo archlinux-java set java-11-openjdk
```

4. Verificar que java 11 sea el entorno prederminado con el paso 2 o con el siguiente comando.

```shell
archlinux-java status
```

#### Instalación de Python

1. Instala la version más reciente de python.

```shell
sudo pacman -S python
```

2. Verifica que python se instaló correctamente.

```shell
python --version
```

### Instalación de Apache Cassandra

> [!NOTE]
>
> Reemplazar con `4.0.12` con la versión a instalar.


1. Dirigete a la carpeta en donde deseas que sea instalado.

```shell
cd ~/Applications/
```

2. Descargar la versión a instalar en [Downloading Cassandra](https://cassandra.apache.org/_/download.html) en el directorio actual.

```shell
wget https://dlcdn.apache.org/cassandra/4.0.12/apache-cassandra-4.0.12-bin.tar.gz
```

3. Descomprimir el archivo descargado.

```shell
tar -xzf apache-cassandra-4.0.12-bin.tar.gz
```

<div style="page-break-after: always;"></div>

## Uso de Cassandra

1. Dirigete a la carpeta de cassandra.

```shell
cd ~/Applications/apache-cassandra-4.0.12
```

2. Ejecuta el siguiente comando para iniciar cassandra

```shell
bin/cassandra > /dev/null &
```

> [!NOTE]
>
> `> /dev/null` para no mostrar salidas de texto y `&` para ejecutar el programa en segundo plano

3. Abre Cassandra Query Language Shell (cqlsh)

```shell
bin/cqlsh
```

<div style="page-break-after: always;"></div>

## Creación y Uso de Bases de Datos

### Keyspace

1. Crear un Keyspace

```cql
CREATE KEYSPACE EstudiantesDB WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

```

2. Utilizar Keyspace

```cql
USE EstudiantesDB;
```

### Tabla

1. Creación de una Tabla:

```cql
CREATE TABLE Estudiantes (
	id UUID PRIMARY KEY,
	nombre TEXT,
	apellido TEXT,
	edad INT
);
```

#### Inserción de Registros

1. Insertar un estudiante:

```cql
INSERT INTO Estudiantes (id, nombre, apellido, edad)
VALUES (uuid(), 'Juan', 'Pérez', 20);
```

2. Insertar varios estudiantes:

```cql
INSERT INTO Estudiantes (id, nombre, apellido, edad) VALUES (uuid(), 'Ana', 'García', 22);
INSERT INTO Estudiantes (id, nombre, apellido, edad) VALUES (uuid(), 'Luis', 'Martínez', 21);
```

#### Consulta de Registros:

1. Consultar todos los estudiantes:

```cql
SELECT * FROM Estudiantes;
```

![Estudiantes | center](img/1-estudiantes.jpg)

2. Consultar un estudiante específico por nombre:

```cql
SELECT * FROM Estudiantes WHERE nombre = 'Juan';
```

![Juan | center](img/2-estudiante_juan.jpg)
