# Sistema Famila en Prolog

## Código

```prolog
% Hombres
hombre(juan).
hombre(pedro).
hombre(raul).
hombre(luis).
hombre(carlos).
hombre(david).
hombre(ernesto).

% Mujeres
mujer(maria).
mujer(ana).
mujer(laura).
mujer(teresa).
mujer(lucia).
mujer(sara).

% Parejas
es_pareja(juan, maria).
es_pareja(pedro, ana).
es_pareja(luis, laura).
es_pareja(carlos, teresa).
es_pareja(david, lucia).
pareja(A, B):- es_pareja(A, B); es_pareja(B, A).

% Progenitores
es_progenitor(juan, pedro).
es_progenitor(juan, raul).
es_progenitor(juan, luis).
es_progenitor(maria, pedro).
es_progenitor(maria, raul).
es_progenitor(maria, luis).
es_progenitor(ana, carlos).
es_progenitor(ana, sara).
es_progenitor(pedro, carlos).
es_progenitor(pedro, sara).
es_progenitor(laura, david).
es_progenitor(laura, ernesto).
es_progenitor(luis, david).
es_progenitor(luis, ernesto).
progenitor(A, B) :- es_progenitor(A, B).
progenitor(A, B) :- pareja(A,X), es_progenitor(X, B).

% Reglas
padre(X,Y):- hombre(X), progenitor(X, Y).
madre(X,Y):- mujer(X), progenitor(X,Y).
hermanos(X,Y):- !,(madre(Z,X), madre(Z,Y)), not(X==Y).
hermanos(X,Y):- !,(padre(Z,X), padre(Z,Y)), not(X==Y).
hermano(X,Y):- hombre(X), hermanos(X,Y).
hermana(X,Y):- mujer(X), hermanos(X, Y).
esposo(X,Y):- pareja(X,Y), hombre(X).
esposa(X,Y):- pareja(X,Y), mujer(X).
suegro(X,Y):- padre(X,Z), pareja(Z,Y).
suegra(X,Y):- madre(X,Z), pareja(Z,Y).
yerno(X,Y):- hombre(X),(suegro(Y,X); suegra(Y,X)).
nuera(X,Y):- mujer(X),(suegro(Y,X); suegra(Y,X)).
cunados(X,Y):-(pareja(X,Z), hermanos(Z,Y)); (pareja(Y,Z), hermanos(Z,X)).
cunado(X,Y):-cunados(X,Y),hombre(X).
cunada(X,Y):-cunados(X,Y),mujer(X).
abuelo(X,Y):-padre(X, Z), progenitor(Z,Y).
abuela(X,Y):-madre(X, Z), progenitor(Z,Y).
nieto(X,Y):-progenitor(Y,Z),progenitor(Z,X),hombre(X).
nieta(X,Y):-progenitor(Y,Z),progenitor(Z,X),mujer(X).
tio(X,Y):- progenitor(Z,Y),(hermano(X,Z);cunado(X,Z)).
tia(X,Y):- progenitor(Z,Y),(hermana(X,Z);cunada(X,Z)).
primos(X,Y):-progenitor(W,X), progenitor(Z,Y), hermanos(W,Z).
primo(X,Y):-primos(X,Y),hombre(X).
prima(X,Y):-primos(X,Y),mujer(X).
```

## Implementación del Sistema

1. Verificar si Juan y María son pareja:

![ | center ](img/1-familia.jpeg)

2. Encontrar los hermanos de Pedro:

![ | center ](img/2-familia.jpeg)

3. Obtener los tíos de Carlos:

![ | center ](img/3-familia.jpeg)

4. Verificar si Laura es prima de Sara:

![ | center ](img/4-familia.jpeg)

5. Obtener los abuelos de David:

![ | center ](img/5-familia.jpeg)

6. Encontrar las parejas presentes en el sistema:

![ | center ](img/6-familia.jpeg)

