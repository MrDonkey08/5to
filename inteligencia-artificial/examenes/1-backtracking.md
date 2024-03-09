# Examen Backtraking

## Código

```Prolog
/*[M1]*/
mother(ann,henry).
/*[M2]*/
mother(jane,mark).
/*[M3]*/
mother(jane,francis).
/*[M4]*/
mother(annette,jonathan).
/*[M5]*/
mother(janice,louise).
/*[M6]*/
mother(lucy,janet).
/*[M7]*/
mother(louise,caroline).
/*[M8]*/
mother(louise,martin).
/*[F1]*/
father(henry,jonathan).
/*[F2]*/
father(john,mary).
/*[F3]*/
father(francis,louise).
/*[F4]*/
father(john,mark).
/*[F5]*/
father(gavin,lucy).
/*[F6]*/
father(john,francis).
/*[F7]*/
father(martin,david).
/*[F8]*/
parent(X,Y):-write('mother?'),nl,mother(X,Y),
write('mother!'),nl.
/*[P4]*/
parent(A,B):-write('father?'),nl,father(A,B),
write('father!'),nl.
/*[R1]*/
rich(jane).
/*[R2] */
rich(john).
/*[RF1] */
rich_parent(X,Y):-rich(X),parent(X,Y).
/*[RF2] */
rich_child(X):-rich_parent(Y,X).
```


<div style="page-break-after: always;"></div>

## Descripción del procedimiento del Backtacking

1. El sistema Prolog comienza buscando instancias de la regla "rich_child(X)".
2. Luego, busca todas las instancias de la regla "rich_parent(X, Y)", donde X es rico.
3. Para cada instancia encontrada en el paso anterior, busca todas las instancias de la regla "parent(X, Y)", donde X es el padre o la madre.
4. Si encuentra una instancia de "parent(X, Y)", verifica si Y es rico. Si es así, entonces agrega esta instancia a los resultados.
5. Continúa buscando más instancias de "parent(X, Y)" para X rico, y repite el proceso hasta encontrar todas las coincidencias posibles.
6. Una vez que se han encontrado todas las coincidencias posibles, se devuelve el resultado de la consulta.

## Consulta

```shell
?- rich_child(X).
```

### Resultado de la Consulta

```shell
mother?
mother!
X = mark ? a
mother!
X = francis
father?
mother?
father?
father!
X = mary
father!
X = mark
father!
X = francis
```