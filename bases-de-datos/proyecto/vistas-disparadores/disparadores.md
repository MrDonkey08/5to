# Disparadores

## Validación de Estatus

```sql
CREATE OR REPLACE FUNCTION validar_status() RETURNS trigger AS $$
BEGIN
    IF new.status IS NULL THEN
        RAISE EXCEPTION 'Ingresa estatus';
    END IF;
END;
$$ LANGUAGE plpgsql;
```

```sql
CREATE TRIGGER validar_status
BEFORE INSERT OR UPDATE ON derrumbe
FOR EACH ROW
EXECUTE FUNCTION validar_status();
```

## Validación de Llaves Foraneas

```sql
CREATE OR REPLACE FUNCTION validar_referencias() RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM Contacto WHERE ID_Contacto = NEW.ID_Contacto
    ) THEN
        RAISE EXCEPTION 'ID_Contacto no tiene una referencia válida en la tabla Contacto';
    END IF;
    IF NOT EXISTS (
        SELECT 1 FROM Direccion WHERE ID_Direccion = NEW.ID_Direccion
    ) THEN
        RAISE EXCEPTION 'ID_Direccion no tiene una referencia válida en la tabla Direccion';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
```

```sql
CREATE TRIGGER validar_referencias_trigger
BEFORE INSERT OR UPDATE ON Derrumbe
FOR EACH ROW
EXECUTE FUNCTION validar_referencias();
```

<div style="page-break-after: always;"></div>

## Evidencia

![ | center ](img/2-disparadores.jpg)

