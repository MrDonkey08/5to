# Sistema de Gestión de Cinema

```SQL
CREATE TABLE pelicula( 
  id_pelicula SERIAL PRIMARY KEY UNIQUE,
  id_actor INTEGER UNIQUE,
  id_ejemplar INTEGER UNIQUE,
  id_director INTEGER UNIQUE,
  titulo VARCHAR(60) NOT NULL UNIQUE,
  nacionalidad VARCHAR(60) NOT NULL UNIQUE,
  productores VARCHAR(100) NOT NULL,
  fecha VARCHAR(10) NOT NULL
);

CREATE TABLE actores(
  id_actor SERIAL PRIMARY KEY UNIQUE,
  id_pelicula INTEGER,
  nombre VARCHAR(60) NOT NULL,
  nacionalidad VARCHAR(20) NOT NULL,
  sexo VARCHAR(1) NOT NULL,
  FOREIGN KEY(id_actor) REFERENCES pelicula(id_actor),
  constraint cons_pelicula FOREIGN KEY(id_pelicula) REFERENCES pelicula(id_pelicula)
);

CREATE TABLE ejemplares(
  id_ejemplares SERIAL PRIMARY KEY UNIQUE,
  estado VARCHAR(20) NOT NULL UNIQUE,
  id_pelicula INTEGER NOT NULL UNIQUE,
  id_director INTEGER NOT NULL UNIQUE,
  constraint cons_actores FOREIGN KEY (id_ejemplares) REFERENCES pelicula(id_ejemplar)
);

CREATE TABLE director(
  id_director SERIAL PRIMARY KEY UNIQUE,
  nombre VARCHAR(60) NOT NULL,
  nacionalidad VARCHAR(20) NOT NULL,
  id_pelicula INTEGER NOT NULL,
  id_ejemplar INTEGER NOT NULL,
  constraint cons_pelicula FOREIGN KEY(id_pelicula) REFERENCES pelicula(id_pelicula),
  constraint cons_ejemplares FOREIGN KEY(id_ejemplar) REFERENCES ejemplares(id_ejemplares),
  constraint cons_director FOREIGN KEY(id_director) REFERENCES pelicula(id_director)
);

CREATE TABLE cliente_socio(
  id_cliente SERIAL PRIMARY KEY UNIQUE,
  nombre VARCHAR(60) NOT NULL,
  fecha_comienzo VARCHAR(10) NOT NULL,
  fecha_devolucion VARCHAR(10) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  id_ejemplares_alquilados INTEGER NOT NULL,
  socios_presentados VARCHAR(200),
  constraint cons_ejemplares FOREIGN KEY(id_ejemplares_alquilados) REFERENCES ejemplares(id_ejemplares),
  constraint cons_alquiladas FOREIGN KEY(id_cliente) REFERENCES cliente_socio(id_cliente)
);

CREATE TABLE suppliers(
  id_supp VARCHAR(2) PRIMARY KEY,
  name VARCHAR(15) UNIQUE,
  address VARCHAR(15) UNIQUE,
  cp INTEGER
);

CREATE TABLE products(
  id_prod VARCHAR(2) PRIMARY KEY,
  description VARCHAR(30),
  price NUMERIC DEFAULT 5.0
  stock INTEGER NOT NULL DEFAULT 1,
  id_supp VARCHAR(2),
  FOREIGN KEY (id_supp) REFERENCES suppliers(id_supp)
);

CREATE TABLE income(
  id_inc SERIAL PRIMARY KEY,
  id_prod VARCHAR(2),
  amount INTEGER CHECK(amount > 0),
  price INTEGER,
  income_date TIMESTAMP DEFAULT now(),
  FOREIGN KEY (id_prod) REFERENCES products (id_prod)
);

CREATE TABLE constraint_example(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellidos VARCHAR(100) NOT NULL,
  numero INTEGER NOT NULL,
  edad INTEGER NOT NULL
);

CREATE TABLE serial_example(
  id_serial SERIAL PRIMARY KEY UNIQUE,
  name VARCHAR(100) NOT NULL,
);
```