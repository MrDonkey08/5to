# Sistemas de Gestión

## Sistema de Gestión de Bibiloteca

```SQL
CREATE TABLE Libro (
    ID SERIAL PRIMARY KEY,
    ISBN VARCHAR(20) UNIQUE,
    Titulo VARCHAR(100),
    Autor VARCHAR(100),
    Anio_Publicacion INT,
    Num_Ejemplares_Disponibles INT,
    Genero VARCHAR(50)
);

CREATE TABLE Usuario (
    ID SERIAL PRIMARY KEY,
    Identificacion VARCHAR(20) UNIQUE,
    Nombre VARCHAR(100),
    Correo_Electronico VARCHAR(100),
    Telefono VARCHAR(20),
    Tipo_Usuario VARCHAR(20)
);

CREATE TABLE Prestamo (
    Num_Prestamo SERIAL PRIMARY KEY,
    ISBN VARCHAR(20),
    Identificacion_Usuario VARCHAR(20),
    Fecha_Prestamo DATE,
    Fecha_Devolucion DATE,
    Estado_Libro VARCHAR(20),
    FOREIGN KEY (ISBN) REFERENCES Libro(ISBN),
    FOREIGN KEY (Identificacion_Usuario) REFERENCES Usuario(Identificacion)
);
```

## Sistema de Gestión de Empleados

```SQL
CREATE TABLE Empleado (
  ID SERIAL PRIMARY KEY,
  Nombre VARCHAR(50) NOT NULL,
  Dirección VARCHAR(50) NOT NULL,
  Fecha_de_Nacimiento DATE NOT NULL,
  Télefono VARCHAR(20) NOT NULL,
  Puesto VARCHAR(30) NOT NULL,
  Fecha_de_Contratación DATE NOT NULL,
  Salario FLOAT NOT NULL,
  Número_de_Identificación INT NOT NULL UNIQUE
);

CREATE TABLE Departamento (
  ID SERIAL PRIMARY KEY,
  Nombre VARCHAR(50) NOT NULL,
  Jefe VARCHAR NOT NULL,
  Descripción VARCHAR(200) NOT NULL,
  Número_de_Identificación INT NOT NULL UNIQUE,
  FOREIGN KEY (Número_de_Identificación) REFERENCES Empleado(Número_de_Identificación)
);


CREATE TABLE Proyecto (
  ID SERIAL PRIMARY KEY,
  Nombre VARCHAR(50) NOT NULL,
  Descripción VARCHAR(200) NOT NULL,
  Fecha_de_Inicio DATE NOT NULL,
  Fecha_de_Finalización_Estimada DATE NOT NULL
);

CREATE TABLE está_asignado (
  Número_de_Identificación INT NOT NULL,
  ID INT NOT NULL,
  PRIMARY KEY (Número_de_Identificación, ID),
  FOREIGN KEY (Número_de_Identificación) REFERENCES Empleado(Número_de_Identificación),
  FOREIGN KEY (ID) REFERENCES Proyecto(ID)
);
```