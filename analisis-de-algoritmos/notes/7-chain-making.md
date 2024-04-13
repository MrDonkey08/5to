# Change Making

Dar la cantidad $n$ de cambio con el menor número de monedas posibles.

$$d_1 < d_2 d_3 < \dots < d_m$$

n = 0, 1, 2, 3, 4, 5,

$$F(n) = \text{min} {F(n-dj)} + 1 F(n), jn \geq >= dj$$

## Programación Dinámica

_**Top-down**_: Se comienza con el problema original y se divide en problemas más pequeños

- Se recuelven los subproblemas de forma **recursiva**, verificando si ya se calculó antes.

_**Bottom-up**_: Se comienza por los subproblemas más pequeños. Caso base $F(0)$

- Son iterativos
- Las soluciones de los subproblemas se almacenan en una un espacio en memoria (arreglo, tabla, matriz)

Ambas evitan el recálculo de subproblemas.
