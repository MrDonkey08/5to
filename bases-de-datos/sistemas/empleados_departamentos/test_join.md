# Sistema Empleados y Departamentos

## Muestreo

```sql
SELECT * FROM Empleados;
SELECT * FROM Departamentos;
```

![ | center](img/1-show.jpg)

![ | center](img/2-show.jpg)

<div style="page-break-after: always;"></div>

### Join

#### Inner Join

```sql
SELECT *
FROM Empleados E
JOIN Departamentos D
ON E.Departamento_Id = D.Id;
```

![ | center](img/3-inner.jpg)

```sql
SELECT
	E.Nombre as Empleado,
	D.Nombre as Departamento
FROM Empleados E
JOIN Departamentos D
ON E.Departamento_Id = D.Id;
 ```

![ | center](img/4-inner.jpg)

#### Left Join

```sql
SELECT
	E.Nombre as Empleado,
	D.Nombre as Departamento
FROM Empleados E
LEFT JOIN Departamentos D
ON E.Departamento_Id = D.Id;
```

![ | center](img/5-left.jpg)

#### Right Join

```sql
SELECT
	E.Nombre as Empleado,
	D.Nombre as Departamento
FROM Empleados E
RIGHT JOIN Departamentos D
ON E.Departamento_Id = D.Id;
```

![ | center](img/6-right.jpg)

#### Full Join

```sql
SELECT
	E.Nombre as Empleado,
	D.Nombre as Departamento
FROM Empleados E
FULL JOIN Departamentos D
ON E.Departamento_Id = D.Id;
```

![ | center](img/7-full.jpg)