### A Pluto.jl notebook ###
# v0.19.36

using Markdown
using InteractiveUtils

# ╔═╡ d0cf9a6c-c557-11ee-229f-b761d1571c63
md"# Introducción a algoritmos
## ¿Qué es un algoritmo?
Un algoritmo es un procedimiento con un número finito de pasos, el cual trabaja sobre una entrada y
produce una salida. Un ejemplo cootidiano de un algoritmo es el de una receta de cocina, en la cual
tenemos una entrada en forma de ingredientes y una salida en forma de un platillo. Sin embargo en el
ámbito computacional clásico, la entrada y salida son ambos información codificada en forma binaria
(representadas con ceros y unos.) Además se puede considerar a un algoritmo como una herramienta
para resolver problemas computacionales; junto con las estructuras de datos, los algoritmos son
considerados como los elementos base que forman los programas computacionales.

Ahora bien, para que un algoritmo sea de utilidad es necesario que éste produzca un resultado
correcto o, por lo menos, un resultado aproximado cuyo error sea de alguna manera controlable para
todos los posibles problemas que a este se le puedan suministrar. Adicionalmente, es deseable que
el algoritmo resuelva dichos problemas en la menor cantidad de pasos posibles para, de esta manera,
ser más eficiente en cuestión de tiempo. También es importante el cuidado de la cantidad de
memoria que un algoritmo necesita para su ejecución.

Así pues hemos establecido los principales aspectos del análisis de algoritmos, los cuales son el
determinar: que produzca resultados correctos o suficientemente aproximados, cuál es el tiempo que
le toma producir el resultado y cuál es la cantidad de espacio (memoria) que éste utiliza."

# ╔═╡ 634604b3-6284-4b1b-96fe-d67e32b75f9a
md"## Ejemplo 1. Suma de n números enteros
### Disenando el algoritmo
Supongamos que nuestra tarea es la de sumar un número determinado _n_ de números enteros (por
ejemplo los 5 números enteros 2, 4, 6, 8 y 10.) Por conveniencia supondremos que éstos números
están almacenados en un arreglo **A**"

# ╔═╡ aa398f1f-4524-490b-8667-acf551ef1697
A = [ 2, 4, 6, 8, 10 ]

# ╔═╡ 178e9dc1-44fb-4693-8f4d-8f1ca3475e7f
md"Si realizamos dicha suma, podemos encontrar que el resultado correcto es _30_. Ahora bien, deseamos
establecer un procedimiento general para el cual, sin importar el tamaño de **A** o los elementos
que contenga la computadora produzca el resultado correcto.

Si consideramos la suma como una operación binaria (entre dos elementos,) para poder obtener
la suma total es necesario que llevemos la cuenta en una variable adicional la cual llamaremos por
conveniencia *valor_acumulado*, la cual comenzará en _0_ e irá aumentando con el valor de cada uno
de los números del arreglo. En nuestro ejemplo:"

# ╔═╡ 3b59449c-9298-4f9c-8e2c-be41162d7643
begin
    valor_acumulado = 0
    valor_acumulado += A[1]
    valor_acumulado += A[2]
    valor_acumulado += A[3]
    valor_acumulado += A[4]
    valor_acumulado += A[5]
    valor_acumulado
end

# ╔═╡ ccc181a2-3bd6-4617-bbd3-c4b0fe264838
md"Con este patrón en mente podemos definir la función _suma()_ la cual implementará nuestro
algoritmo buscado"

# ╔═╡ bcdbd603-d995-4d14-969e-43c2a9c54acd
function suma(A)
    valor_acumulado = 0
    for elem in A
        valor_acumulado += elem
    end
    return valor_acumulado
end

# ╔═╡ 36f1cbbb-247d-44fd-83da-d1a5927b9cbf
md"aplicada a nuestro ejemplo obtenemos"

# ╔═╡ ef064f6a-1283-49c5-8733-13d0af371e4e
suma(A)

# ╔═╡ 71569095-4a4a-43ad-bdf0-3ebff9f7555b
md"la cual produce el valor correcto para nuestro arreglo **A**."

# ╔═╡ d3241642-e125-4a0a-bf43-b59cf646992d
md"### Costo temporal practico
Ahora bien, podríamos preguntar cuánto tiempo le toma a la computadora realizar dicha operación.
Es posible obtener este valor de manera práctica mediante el uso del macro _@time_"

# ╔═╡ bde343bd-cc6d-447e-b309-cb84e2a1c0ee
@time suma(A)

# ╔═╡ 9bef12ad-74fe-452e-a0e7-d4a5a1113bde
md"sin embargo este valor sólo representa el tiempo que le toma a nuestra computadora y está condicionado a
las demás tareas que estaba ejecutando la computadora al momento de ejecución. Así obtuvieramos el valor para
muchos arreglos distintos, en condiciones distintas, e hicieramos un estudio estadístico con dichos
resultados, esto poco sería de utilidad para determinar el tiempo que le tomaría correr dicho
algoritmo a otra computadora. Es por esto que es necesario establecer otra manera, más teórica, de
determinar el costo temporal de un algoritmo."

# ╔═╡ e39b8d26-8f75-464b-b03c-a235cdd0c5d9
md"### Costo temporal teorico
Comencemos por suponer que todas las computadoras realizan cualquier operación básica en tiempo
constante _c_, esto por supuesto no ocurre en el mundo real pero veremos más adelante porqué no
nos afecta demasiado en nuestro análisis. Además supondremos que las computadoras ejecutan un
programa línea por línea y no tienen procesos paralelos. A este modelo de computadora se le conoce
como _Máquina de Acceso Aleatorio_ o _RAM_ (por sus siglas en inglés.)

Bien, pasemos a establecer la cantidad de veces que se ejecuta cada una de las líneas de código en
nuestra función _suma()_ para un arreglo **A** con una cantidad arbitraria de valores _n_."

# ╔═╡ Cell order:
# ╟─d0cf9a6c-c557-11ee-229f-b761d1571c63
# ╟─634604b3-6284-4b1b-96fe-d67e32b75f9a
# ╟─aa398f1f-4524-490b-8667-acf551ef1697
# ╟─178e9dc1-44fb-4693-8f4d-8f1ca3475e7f
# ╠═3b59449c-9298-4f9c-8e2c-be41162d7643
# ╟─ccc181a2-3bd6-4617-bbd3-c4b0fe264838
# ╠═bcdbd603-d995-4d14-969e-43c2a9c54acd
# ╟─36f1cbbb-247d-44fd-83da-d1a5927b9cbf
# ╠═ef064f6a-1283-49c5-8733-13d0af371e4e
# ╟─71569095-4a4a-43ad-bdf0-3ebff9f7555b
# ╟─d3241642-e125-4a0a-bf43-b59cf646992d
# ╠═bde343bd-cc6d-447e-b309-cb84e2a1c0ee
# ╟─9bef12ad-74fe-452e-a0e7-d4a5a1113bde
# ╟─e39b8d26-8f75-464b-b03c-a235cdd0c5d9
