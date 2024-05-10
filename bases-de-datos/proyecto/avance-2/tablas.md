# Creación de Base de Datos

## Sistema de Gestión de Derrumbes

### Base de Datos

```sql
CREATE DATABASE derrumbes;
```

### Tablas

```sql
CREATE TABLE Contacto (
	ID SERIAL PRIMARY KEY,
	Nombre VARCHAR(80) NOT NULL,
	Telefono VARCHAR(25) NOT NULL
);

CREATE TABLE Ubicacion (
	ID SERIAL PRIMARY KEY,
	Enlace VARCHAR(200),
	Latitud DECIMAL(10, 8),
	Longitud DECIMAL(11, 8)
);

CREATE TABLE Municipio (
	ID SERIAL PRIMARY KEY,
	Nombre VARCHAR(40) NOT NULL
);

CREATE TABLE Estado (
	ID SERIAL PRIMARY KEY,
	Nombre VARCHAR(40) NOT NULL
);

CREATE TABLE Direccion (
	ID SERIAL PRIMARY KEY,
	Calle VARCHAR(100) NOT NULL,
	Numero_exterior INT NOT NULL,
	Colonia VARCHAR(50),
	Tipo_de_Residencia VARCHAR(30),
	ID_Ubicacion INT NOT NULL,
	ID_Municipio INT NOT NULL,
	ID_Estado INT NOT NULL,
	FOREIGN KEY (ID_Ubicacion) REFERENCES Ubicacion(ID),
	FOREIGN KEY (ID_Municipio) REFERENCES Municipio(ID),
	FOREIGN KEY (ID_Estado) REFERENCES Estado(ID)
);

CREATE TABLE Derrumbe (
	ID SERIAL PRIMARY KEY,
	Descripcion VARCHAR(200) NOT NULL,
	Necesidades VARCHAR(100),
	Tipo_de_Dano VARCHAR(40),
	Estatus VARCHAR(30),
	ID_Contacto INT NOT NULL,
	ID_Direccion INT NOT NULL,
	FOREIGN KEY (ID_Contacto) REFERENCES Contacto(ID),
	FOREIGN KEY (ID_Direccion) REFERENCES Direccion(ID)
);

CREATE TABLE Rescatista (
	ID SERIAL PRIMARY KEY,
	Nombre VARCHAR(80) NOT NULL,
	Telefono VARCHAR(25) NOT NULL,
	Horas INT,
	Puesto VARCHAR(80)
);
```