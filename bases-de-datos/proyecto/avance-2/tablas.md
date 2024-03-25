# Creación de Base de Datos

## Sistema de Gestión de Derrumbes

### Base de Datos

```sql
CREATE DATABASE derrumbes;
```

### Tablas

```sql
CREATE TABLE Contacto (
	ID_Contacto SERIAL PRIMARY KEY,
	Nombre VARCHAR(80) NOT NULL,
	Telefono VARCHAR(25) NULL
);

CREATE TABLE Direccion (
	ID_Direccion SERIAL PRIMARY KEY,
	Calle VARCHAR(100) NOT NULL,
	Numero_exterior INT NOT NULL,
	Colonia VARCHAR(50) NULL,
	Entidad VARCHAR(30) NULL,
	Tipo_de_Residencia VARCHAR(30) NULL,
	Ubicacion VARCHAR(200) NOT NULL
);

CREATE TABLE Derrumbe (
	ID_Derrumbe SERIAL PRIMARY KEY,
	Descripcion VARCHAR(200) NULL,
	Necesidades VARCHAR(100) NULL,
	Tipo_de_Dano VARCHAR(40) NOT NULL,
	Estatus VARCHAR(30) NULL,
	ID_Contacto INT NOT NULL,
	ID_Direccion INT NOT NULL,
	FOREIGN KEY (ID_Contacto) REFERENCES Contacto(ID_Contacto),
	FOREIGN KEY (ID_Direccion) REFERENCES Direccion(ID_Direccion)
);
```