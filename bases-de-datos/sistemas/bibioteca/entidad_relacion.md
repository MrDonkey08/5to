```mermaid
erDiagram
    LIBRO {
        string ISBN
        Título
        Autor
        Año_de_Publicación
        Número_de_Ejemplares_Disponibles
    }
    USUARIO {
        Identificación_del_Usuario (PK)
        Nombre
        Correo_Electrónico
        Teléfono
        Tipo_de_Usuario
    }
    PRÉSTAMO {
        Número_de_Préstamo (PK)
        Fecha_de_Préstamo
        Fecha_de_Devolución
        Estado_del_Libro
        ISBN (FK)
        Identificación_del_Usuario (FK)
    }
    RESERVA {
        Número_de_Reserva (PK)
        Fecha_de_Reserva
        Estado_de_la_Reserva
        ISBN (FK)
        Identificación_del_Usuario (FK)
    }

LIBRO ||--o{ PRÉSTAMO : "Tiene"
USUARIO ||--o{ PRÉSTAMO : "Realiza"
USUARIO ||--o{ RESERVA : "Realiza"
LIBRO ||--o{ RESERVA : "Tiene"

```
