.. include:: defs.rst

Logique booléenne
*****************

Le fonctionnement des ordinateurs s'appuie sur quelques principes très simples, mais qui sont utilisés à une très grande échelle. Le premier principe est que toute l'information peut s'encoder sous une forme binaire, c'est-à-dire une suite de bits. Un bit est l'unité de représentation de l'information. Un bit peut prendre deux valeurs:

 - ``0``
 - ``1``

On peut associer une signification à ces bits. Il est par exemple courant de considérer que le bit ``0`` représente la valeur `Faux` tandis que le bit ``1`` représente la valeur `Vrai`. C'est une convention qui est utile dans certains cas, mais n'est pas toujours nécessaire et peut parfois porter à confusion. 

Avec ces deux valeurs booléennes, il est intéressant de définir des opérations. Une opération booléenne est une fonction qui prend en entrée 0, 1 ou plusieurs bits et retourne un résultat.

Fonctions booléennes
====================

La fonction la plus simple est la fonction identité. Elle prend comme entrée un bit et retourne la valeur de ce bit. On peut la définir en utilisant une `table de vérité` qui indique la valeur du résultat de la fonction pour chaque valeur possible de son entrée. Dans la table ci-dessous, la colonne `x` contient les différentes valeurs possibles de l'entrée `x` et la valeur du résultat pour chacune des valeurs possibles de `x`.


=== ===========
x   identité(x) 
--- -----------
0   0 
1   1
=== ===========


Cette fonction n'est pas très utile en pratique. Elle nous permet d'illustrer une table de vérité simple dans laquelle il y a une valeur binaire en entrée et une valeur binaire également en sortie.

Une fonction plus intéressante est l'inverseur, aussi dénommée `NOT` en anglais. Cette fonction prend comme entrée un bit. Si le bit d'entrée vaut `1`, elle retourne `0`. Tandis que si le bit d'entrée vaut `0`, elle retourne `1`. Cette fonction sera très fréquemment utilisée pour construire des circuits électroniques utilisés dans les ordinateurs. 

=== ======
x   NOT(x)
--- ------
0   1 
1   0
=== ======

Il y a encore deux fonctions que l'on peut construire avec une seule entrée binaire. La première, baptisée `Toujours0`, retourne toujours la valeur ``0``, quelle que soit son entrée. La seconde, baptisée `Toujours1` retourne toujours la valeur ``1``. Voici leurs tables de vérité.

=== ============
x   Toujours0(x) 
--- ------------
0   0 
1   0 
=== ============



=== ============
x   Toujours1(x) 
--- ------------
0   1 
1   1
=== ============


La logique booléenne devient nettement plus intéressante lorsque l'on considère des fonctions qui prennent plus d'une entrée.



Fonctions booléennes à deux entrées 
------------------------------------

Plusieurs fonctions booléennes classiques existent. Les premières correspondent
à la conjonction (`et`) et à la disjonction (`ou`) en logique. Commençons par
la fonction `AND`. Celle-ci correspond à la table de vérité suivante:

=== = ========
x   y AND(x,y) 
--- - --------
0   0 0 
0   1 0 
1   0 0 
1   1 1 
=== = ========


Cette table comprend quatre lignes qui correspondent à toutes les combinaisons possibles des deux entrées de la fonction. On remarque aisément que la fonction `AND(x,y)` retourne la valeur ``1`` uniquement lorsque ses deux entrées ont la valeur ``1``. Si une des deux entrées de la fonction `AND(x,y)` a la valeur
``0``, alors sa sortie est nécessairement ``0``. Cette fonction est bien l'équivalent de la conjonction logique si l'on applique la convention que ``0`` représente la valeur `Faux`.

La fonction `OR(x,y)`, quant à elle, est l'équivalent de la disjonction logique. Sa table de vérité est reprise ci-dessous.


=== = ========
x   y OR(x,y) 
--- - --------
0   0 0 
0   1 1 
1   0 1 
1   1 1 
=== = ========


On remarque aisément que la fonction `OR(x,y)` correspond bien à la disjonction logique lorsque `1` représente la valeur `Vrai`. Cette fonction `OR(x,y)` ne retourne la valeur ``0`` que si ses deux entrées valent ``0``. Dans tous les autres cas, elle retourne la valeur ``1``.

Ces fonctions peuvent être combinées entre elles. Un premier exemple est d'appliquer un inverseur (opération `NOT` au résultat de la fonction `AND`). Cette fonction booléenne s'appelle généralement `NAND` (`NOT AND`) et sa table de vérité est la suivante. On pourra dire que :math:`NAND(x,y) \iff NOT(AND(x,y))`. 

=== = =========
x   y NAND(x,y) 
--- - ---------
0   0 1 
0   1 1 
1   0 1 
1   1 0 
=== = =========


De même, la fonction `NOR` s'obtient en inversant le résultat de la fonction `OR`. On pourra dire que :math:`NOR(x,y) \iff NOT(OR(x,y))`. 


=== = ========
x   y NOR(x,y) 
--- - --------
0   0 1 
0   1 0 
1   0 0 
1   1 0 
=== = ========

Il est important de noter que `NOR(x,y)` n'est pas équivalent à la fonction `OR(NOT(x),NOT(y))`. La table de vérité de cette dernière fonction est reprise ci-dessous.

= = ======  ====== =================
x y NOT(x)  NOT(y) OR(NOT(x),NOT(y)) 
- - ------  ------ -----------------
0 0   1        1          1
0 1   1        0          1
1 0   0        1          1
1 1   0        0          0
= = ======  ====== =================

 
Il existe d'autres fonctions booléennes à deux entrées qui sont utiles en pratique. Parmi celles-ci, on retrouve la fonction `XOR(x,y)` qui retourne la valeur `1` uniquement si une seule de ses entrées a la valeur `1`. Sa table de vérité est reprise ci-dessous. On remarquera qu'elle diffère de celle des autres fonctions booléennes que nous avons déjà présenté.


=== = ========
x   y XOR(x,y) 
--- - --------
0   0 0 
0   1 1 
1   0 1 
1   1 0 
=== = ========


Exercices
_________



.. TODO Exercices inginious sur les fonctions booléennes 

1. Construisez la table de vérité de la fonction booléenne à quatre entrées :math:`AND(x,OR(y,AND(z,a)))`

2. Construisez la table de vérité de la fonction booléenne à trois entrées :math:`OR(AND(NOT(x),y,NOT(z)), AND(x,NOT(y),z) )`

3. Construisez la table de vérité de la fonction booléenne à quatre entrées :math:`OR(AND(x,y),AND(z,NOT(x)))`

.. trouver la table de vérité de
   .. AND(x,OR(y,AND(z,a)))
   .. OR(AND(NOT(x),y,NOT(z)), AND(x,NOT(y),z) )
   .. AND(x,OR(y,AND(z,a)) )
      

   .. TODO Trouver d'autres exemples à faire sur inginious

.. - OR(AND(x,y),AND(z,NOT(x)))


Algèbre booléenne
-----------------

Ces fonctions booléennes ont des propriétés importantes que l'on peut facilement démontrer en utilisant des tables de vérité.

 - :math:`AND(1,x) \iff x`
 - :math:`AND(0,x) \iff 0`
 - :math:`OR(1,x) \iff 1`
 - :math:`OR(0,x) \iff x`

A titre d'exemple, regardons la table de vérité de la dernière propriété:

= = =======
x 0 OR(0,x) 
- - -------
0 0    0
1 0    1
= = =======

Dans certains cas, on peut être amené à appliquer une fonction booléenne à deux entrées identiques ou l'une inverse de l'autre. En utilisant les tables de vérité, on peut aisément démontrer que:

 - :math:`AND(x,x) \iff x`
 - :math:`OR(x,x) \iff x`
 - :math:`AND(NOT(x),x) \iff 0`
 - :math:`OR(NOT(x),x) \iff 1`

A titre d'exemple, regardons la table de vérité de la dernière propriété:

= ====== ============
x NOT(x) OR(NOT(x),x) 
- ------ ------------
0   1    1
1   0    1
= ====== ============

Les opérations `AND` et `OR` sont commutatives et associatives comme les opérations arithmétiques d'addition et de multiplication.

 - :math:`AND(x,y) \iff AND(y,x)` (commutativité)
 - :math:`OR(x,y) \iff OR(y,x)` (commutativité)
 - :math:`AND(x,AND(y,z)) \iff AND(AND(x,y),z)`  (associativité)
 - :math:`OR(x,OR(y,z)) \iff OR(OR(x,y),z)` (associativité)

Ces lois d'associativité sont importantes car elles vont nous permettre de facilement construire des fonctions booléennes qui prennent un nombre quelconque d'entrées en utilisant des fonctions à deux entrées comme briques de base.

La distributivité est une autre propriété qui relie les fonctions `AND` et `OR`.

 - :math:`AND(x,OR(y,z)) \iff OR( AND(x,y), AND(x,z) )` (distributivité)
 - :math:`OR(x,AND(y,z)) \iff AND( OR(x,y), OR(x,z) )` (distributivité)

Lorsque l'on ajoute la fonction `NOT`, on obtient deux autres propriétés utiles en pratique.
 
 - :math:`AND(x,OR(NOT(x),y)) \iff AND(x,y)`
 - :math:`OR(x,AND(NOT(x),y)) \iff OR(x,y)`  

   
Enfin, les trois opérations `AND`, `OR` et `NOT` sont reliées entre elles par les lois de `De Morgan`. On peut facilement démontrer, par exemple en utilisant des tables de vérité, que:

 - `NOT( OR(x,y) ) = AND ( NOT(x), NOT(y) )`
 - `NOT( AND(x,y) ) = OR ( NOT(x), NOT(y) )`

Ce lois sont très utiles lorsque l'on doit manipuler des fonctions booléennes. 


Exercices
_________

1. En utilisant une table de vérité, démontrez que :math:`AND(x,OR(NOT(x),y)) \iff AND(x,y)`

2. En utilisant une table de vérité, démontrez que :math:`OR(x,AND(NOT(x),y)) \iff OR(x,y)` 

.. todo: exercices de simplification d'expressions

.. de https://www.tutorialspoint.com/discrete_mathematics/simplification_of_boolean_functions.htm


3. En utilisant une table de vérité, démontrez la première loi de De Morgan :math:`NOT( OR(x,y) ) = AND ( NOT(x), NOT(y) )`

4. En utilisant une table de vérité, démontrez la deuxième loi de De Morgan :math:`NOT( AND(x,y) ) = OR ( NOT(x), NOT(y) )`

5. Considérons la fonction booléenne suivante:

   .. math::
      
      OR( AND(NOT(x),y), AND(y,NOT(z)), AND(y,z), AND(x, AND(NOT(y), NOT(z))) )

   Pouvez-vous simplifier cette fonction en utilisant uniquement une fonction booléenne `AND` à deux entrées, une fonction `OR` à deux entrées et un inverseur ?

   
   
.. F(x,y,z)=OR( AND(NOT(x),y), AND(y,NOT(z)), AND(y,z), AND(x,NOT(y),NOT(z)) )
.. solution: OR( y, AND(x,NOT(z) )

6. Même question pour la fonction :math:`AND(OR(x,y), OR(x,z) )`
   
.. F(x,y,z)= AND(OR(x,y), OR(x,z) )
.. solution: OR(x, AND(y,z) )


.. exemple https://www.ssucet.org/~jgallaher/download/ETEC2301-ProgrammableLogic/Chapter4-BooleanAlgebraAndLogicSimplification.pdf

7. Même question pour la fonction :math:`OR( x, AND(x,y), AND(x, NOT(y), z))`

 

.. OR( x, AND(x,y), AND(x, NOT(y), z)) -> x
.. OR( AND(x,y), AND(x,OR(y,z)), AND(y,(OR(y,z))) )

.. attention à des sites tels que http://www.bool-simplifier.com   
   
.. trouver une petite dizaine d'exemple de simplification, voir comment les faire sur inginious autrement qu'avec des QCMs, pas sur que ce soit facile

   

Fonctions booléennes à plus de deux entrées
-------------------------------------------

En utilisant l'associativité, on peut facilement construire des fonctions à plus de deux entrées. Ainsi, la fonction `AND` à trois entrées :math:`AND(x,y,z) \iff AND(x,AND(y,z)) \iff AND(AND(x,y),z)`. Sa table de vérité est sans surprise la suivante.


= = = ==========
x y z AND(x,y,z)
- - - ----------
0 0 0     0 
0 1 0     0
1 0 0     0
1 1 0     0
0 0 1     0
0 1 1     0
1 0 1     0
1 1 1     1
= = = ==========

De la même façon, on peut obtenir la fonction `OR` à plus de deux entrées: :math:`OR(x,y,z) \iff OR(x,OR(y,z)) \iff OR(OR(x,y),z)`.


En plus de ces fonctions booléennes classiques, il est possible de construire deux autres fonctions qui sont très utiles en pratique. La première est le multiplexeur qui permet de "sélectionner" une valeur d'entrée. La table de vérité du multiplexeur est reprise ci-dessous.

= = === ===
x y sel out 
- - --- ---
0 0  0   0 
0 1  0   0 
1 0  0   1 
1 1  0   1 
0 0  1   0 
0 1  1   1 
1 0  1   0 
1 1  1   1 
= = === ===

On remarque aisément que la sortie du multiplexeur dépend de l'entrée marquée `sel` (pour sélecteur). Lorsque `sel` vaut `0`, la sortie du multiplexeur est égale à sa première entrée (`x`). Lorsque `sel` vaut `1`, sa sortie est égale à sa seconde entrée (`y`). On peut résumer ceci avec la table de vérité ci-dessous: 


=== ===
sel out
--- ---
 0   x
 1   y
=== ===


La fonction duale du multiplexeur est le démultiplexeur. Un démultiplexeur a deux entrées, `in` et
`sel` et deux sorties, `x` et `y`. Son comportement est le suivant:

 - lorsque l'entrée `sel` vaut `0`, alors la sortie `x` a la même valeur que l'entrée `in` tandis que la sortie `y` vaut `0`
 - lorsque l'entrée `sel` vaut `1`, alors la sortie `y` a la même valeur que l'entrée `in` tandis que la sortie `x` vaut `0`
   
La table de vérité correspondant au démultiplexeur est présentée ci-dessous.

   
=== === = =
in  sel x y 
--- --- - - 
 0   0  0 0 
 0   1  0 0 
 1   0  1 0 
 1   1  0 1
=== === = =

Tant le multiplexeur que le démultiplexeur peuvent s'implémenter en utilisant des portes `AND`, `OR` et des inverseurs. Prenons comme exemple le multiplexeur. Nous verrons dans la section suivante qu'il est possible de l'implémenter en utilisant une fonction `OR` à quatre entrées et des fonctions `AND` à trois entrées.



Synthèse de fonctions booléennes
================================

L'intérêt des fonctions booléennes est qu'il est possible de concevoir des fonctions booléennes pour supporter n'importe quelle table de vérité. Prenons comme exemple la fonction `XOR` qui retourne `1` lorsque ses deux entrées sont différentes et `0` sinon. Sa table de vérité est reprise ci-dessous.

= = ========
x y XOR(x,y)
- - --------
0 0    0
0 1    1
1 0    1
1 1    0
= = ========

Pour réaliser une telle fonction, il suffit de se trouver une combinaison de fonctions `AND`, `OR` et `NOT` qui produit la même table de vérité. Une façon mécanique de produire cette fonction est de remarquer que la sortie d'une fonction `AND` ne vaut `1` que lorsque ses deux entrées sont à `1`. Examinons la deuxième ligne de la table de vérité de la fonction `XOR`. Celle-ci indique que cette fonction doit valoir `1`  lorsque `x` vaut `0` et `y` vaut `1`. Avec des fonctions `AND` et des inverseurs, on peut obtenir les tables de vérité suivantes:

= = =========
x y AND(x,y)
- - ---------
0 0    0
0 1    0
1 0    0
1 1    1
= = =========

= = =============
x y AND(NOT(x),y) 
- - -------------
0 0    0 
0 1    1 
1 0    0 
1 1    0 
= = =============

= = =============
x y AND(x,NOT(y)) 
- - -------------
0 0    0 
0 1    0 
1 0    1 
1 1    0 
= = =============

= = ==================
x y AND(NOT(x),NOT(y)) 
- - ------------------
0 0    1 
0 1    0 
1 0    0 
1 1    0 
= = ==================


Deux de ces fonctions  `AND` peuvent être combinées avec une fonction `OR`. Un premier exemple est de combiner les deux premières fonctions,  `AND(x,y)` et `AND(NOT(x),y)` pour construire la fonction `OR(AND(x,y),AND(NOT(x),y)`. Sa table de vérité est la suivante.

= = =========================
x y OR(AND(x,y),AND(NOT(x),y) 
- - -------------------------
0 0    0 
0 1    1 
1 0    0 
1 1    1 
= = =========================

On remarque aisément que la fonction combinée vaut `1` uniquement lorsque `x` vaut `1` et `y` vaut `1` ou lorsque `x` vaut `0` et `y` vaut `1`.

En revenant à notre fonction `XOR`, on se rend aisément compte qu'elle doit valoir `1` dans uniquement deux cas :
 - `x` vaut `1` et `y` vaut `0`
 - `x` vaut `0` et `y` vaut `1`
   
Dans tous les autres cas, la fonction `XOR` doit retourner `0`. Le premier cas peut s'implémenter en utilisant la fonction `AND(x,NOT(y))` tandis que le second correspond à la fonction `AND(NOT(x),y)`. Ces deux fonctions peuvent se combiner comme suit: `OR(AND(x,NOT(y)), AND(NOT(x),y))`. En construisant la table de vérité, on se convainc facilement que :math:`OR(AND(x,NOT(y)), AND(NOT(x),y)) \iff XOR(x,y)`.

En pratique, il est possible de construire n'importe quelle fonction booléenne en combinant avec la fonction `OR`, autant de fonctions `AND` qu'il y a de lignes de la table de vérité dont la sortie vaut `1`.

A titre d'exemple, considérons la fonction `F` dont la table de vérité est reprise ci-dessous.

= = ======
x y F(x,y) 
- - ------
0 0    1 
0 1    1 
1 0    1 
1 1    0 
= = ======

Cette fonction peut s'implémenter comme étant la combinaison des trois fonctions `AND` suivantes:

 - `AND(NOT(x),NOT(y))`
 - `AND(NOT(x),y)`
 - `AND(x,NOT(y))`  

Et donc, :math:`OR(AND(NOT(x),NOT(y)), AND(NOT(x),y), AND(x,NOT(y)) \iff F(x,y)`. Cependant, cette implémentation n'est pas la plus efficace du point de vue du nombre de fonctions `AND`. Il y a d'autres réalisations possibles. Une première implémentation équivalente est de remarquer que lorsque `x` vaut `0`, la fonction `F(x,y)` vaut toujours `1`. On peut donc simplifier cette fonction comme étant `OR(NOT(x), AND(x,NOT(y))`. On peut aisément se rendre compte que cette fonction booléenne a la même table de vérité que la fonction `F(x,y)`. Mathématiquement, on peut noter que :math:`OR(AND(NOT(x),NOT(y)), AND(NOT(x),y)) \iff NOT(x)`.

Cette implémentation de la fonction `F(x,y)` n'est pas la plus compacte. On remarque aisément que cette fonction vaut `0` uniquement lorsque ses deux entrées valent `1`. Dans tous les autres cas, elle vaut `1`. Cela nous rappelle la fonction `NAND` ou :math:`NOT(AND(x,y)) \iff F(x,y)`. 

Dans le cadre de ce cours, nous nous focaliserons sur la synthèse de fonctions booléennes qui sont correctes, c'est-à-dire qui produisent une table de vérité donnée, mais qui n'utilisent pas nécessairement un nombre minimal de fonctions de base. Différentes techniques existent pour minimiser de telles fonctions booléennes, mais elles correspondent plus à un cours d'électronique digitale qu'à un cours d'introduction au fonctionnement des ordinateurs.


Exercices
---------

1. En utilisant uniquement des fonctions `AND`, `OR` et `NOT`, réalisez un multiplexeur.

2. En utilisant uniquement des fonctions `AND`, `OR` et `NOT`, réalisez un démultiplexeur.

   

Représentations graphiques
==========================

Lorsque l'on travaille avec des fonctions booléennes, on peut soit utiliser les symboles comme `AND`, `OR`, `NOT`, soit utiliser des symboles graphiques. Ceux-ci sont très utilisés pour construire de petits circuits. La :numref:`fig-not` représente l'inverseur ou la fonction `NOT`. La fonction `OR` est présentée schématiquement dans la :numref:`fig-or` et la fonction `AND` dans la :numref:`fig-and`.

.. _fig-not:
.. tikz:: Représentation graphique d'une fonction NOT 
   :libs:  circuits.logic.US 

   [tiny circuit symbols, every circuit symbol/.style={fill=white,draw}]
   \node (x) at (0.5,0) {$x$};
   \node (out) at (3,0) {};
   \node [not gate US, draw] (nx)  at ($(x) +(1,0)$) {$NOT$};
   \draw (x) -- (nx);
   \draw (nx) -- (out);


.. _fig-or:   
.. tikz:: Représentation graphique d'une fonction OR 
   :libs:  circuits.logic.US 

   [tiny circuit symbols, every circuit symbol/.style={fill=white,draw}]
   \node (x) at (0,0) {$x$};
   \node (y) at (0,-1) {$y$};
   \node (out) at (3,-0.5) {};
   
   \node [or gate US, draw] (or)  at ($(x) +(1,-0.5)$)  {$OR$};
   \draw (x) -- (or.input 1);
   \draw (y) -- (or.input 2);
   \draw (or) -- (out);


.. _fig-and:   
.. tikz:: Représentation graphique d'une fonction AND 
   :libs:  circuits.logic.US 

   [tiny circuit symbols, every circuit symbol/.style={fill=white,draw}]
   \node (x) at (0,0) {$x$};
   \node (y) at (0,-1) {$y$};
   \node (out) at (3,-0.5) {};
   \node [and gate US, draw] (and)  at ($(x) +(1.5,-0.5)$)  {$AND$};
   \draw (x) -- (and.input 1);
   \draw (y) -- (and.input 2);
   \draw (and) -- (out);

La fonction `XOR` a aussi sa représentation graphique. Celle-ci est présentée dans la :numref:`fig-xor`.

.. _fig-xor:
.. tikz:: Représentation graphique d'une fonction XOR 
   :libs:  circuits.logic.US 

   [tiny circuit symbols, every circuit symbol/.style={fill=white,draw}]
   
   \node (x) at (0,0) {$x$};
   \node (y) at (0,-1) {$y$};
   \node (out) at (3,-0.5) {};
   \node [xor gate US, draw] (xor)  at ($(x) +(1.5,-0.5)$)  {$XOR$};
   \draw (x) -- (xor.input 1);
   \draw (y) -- (xor.input 2);
   \draw (xor) -- (out);


Dans de nombreux circuits, on retrouve des inverseurs. Ainsi, la fonction `NAND` est finalement une fonction  `AND` suivie d'un inverseur comme représenté sur la :numref:`fig-nand`. Cette inversion est symbolisée par un petit rond. Il en va de même pour la fonction `NOR` (:numref:`fig-nor`).    

.. _fig-nand:
.. tikz:: Représentation graphique d'une fonction NAND 
   :libs:  circuits.logic.US 

   [tiny circuit symbols, every circuit symbol/.style={fill=white,draw}]
   
   \node (x) at (0,0) {$x$};
   \node (y) at (0,-1) {$y$};
   \node (out) at (4,-0.5) {};
   \node [nand gate US, draw] (xor)  at ($(x) +(1.5,-0.5)$)  {$NAND$};
   \draw (x) -- (xor.input 1);
   \draw (y) -- (xor.input 2);
   \draw (xor) -- (out);
   

.. _fig-nor:   
.. tikz:: Représentation graphique d'une fonction NOR 
   :libs:  circuits.logic.US 

   [tiny circuit symbols, every circuit symbol/.style={fill=white,draw}]
   
   \node (x) at (0,0) {$x$};
   \node (y) at (0,-1) {$y$};
   \node (out) at (4,-0.5) {};
   \node [nor gate US, draw] (xor)  at ($(x) +(1.5,-0.5)$)  {$NOR$};
   \draw (x) -- (xor.input 1);
   \draw (y) -- (xor.input 2);
   \draw (xor) -- (out);

Les multiplexeurs et démultiplexeurs ont aussi leur représentation graphique. Le livre les représente en utilisant un triangle comme dans la :numref:`fig-mux`.

.. _fig-mux:
.. tikz:: Un multiplexeur à deux entrées

   [label distance=2mm, scale=2,
   connection/.style={draw,circle,fill=black,inner sep=1.5pt}
   ]
   \node (x) at (-0.5,-0.8) {$x$};
   \node (y) at (-0.5,-1.2) {$y$};
   \node (sel) at (0.3,0) {$sel$};
   
   \node (mux) at (0.2,-1) {$mux$};
   \node (out) at (1.1,-1) {$out$};
 
   \draw [->] (x) -- (0,-0.8);
   \draw [->] (y) -- (0,-1.2);
   
   \draw (0,-0.6) -- (0, -1.4) -- (0.6, -1) --cycle;

   \draw [->] (sel) -- (0.3,-0.8);
   \draw [->] (0.6,-1) -- (out);


De la même façon, on peut également représenter le démultiplexeur de façon graphique comme représenté dans la :numref:`fig-dmux`.


.. _fig-dmux:
.. tikz:: Un démultiplexeur à deux sorties

   [label distance=2mm, scale=2,
   connection/.style={draw,circle,fill=black,inner sep=1.5pt}
   ]
   \node (x) at (1.1,-0.8) {$x$};
   \node (y) at (1.1,-1.2) {$y$};
   \node (sel) at (0.3,0) {$sel$};
   
   \node (mux) at (0.4,-1) {$Dmux$};
   \node (in) at (-0.3,-1) {$in$};
 
   \draw [<-] (x) -- (0.8,-0.8);
   \draw [<-] (y) -- (0.8,-1.2);
   
   \draw (0,-1) -- (0.8, -1.4) -- (0.8, -0.6) --cycle;

   \draw [->] (sel) -- (0.3,-0.8);
   \draw [<-] (0,-1) -- (in);

   

Il est évidemment possible de combiner plusieurs fonctions booléennes pour supporter des fonctions plus avancées. A titre d'exemple, considérons la fonction d'égalité qui vaut `1` lorsque ses deux entrées sont égales et `0` sinon. Voici sa table de vérité.


= = =======
x y EQ(x,y)
- - -------
0 0    1
0 1    0
1 0    0
1 1    1
= = =======


Cette fonction peut être réalisée en utilisant deux fonctions `AND`, une fonction `OR` et des inverseurs (:numref:`fig-eq`).

.. source de l'exemple https://tex.stackexchange.com/questions/540918/adding-dots-to-a-circuit-latex

.. _fig-eq:   
.. tikz:: Représentation graphique d'un circuit qui réalise la fonction EQ

   [label distance=2mm, scale=2,
   connection/.style={draw,circle,fill=black,inner sep=1.5pt}
   ]
   \node (x) at (0.5,0) {$x$};
   \node (y) at (1,0) {$y$};

   \node[and gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at ($(x)+(2,-1)$) (t1) {$\bar{x}\bar{y}$};
   \node[and gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at ($(x)+(2,-2)$) (t2) {$xy$};
 
   \node[not gate US, draw, scale=0.75] at ($(t1.input 1)+(-0.5,0)$) (nx1) {};
   \node[not gate US, draw, scale=0.75] at ($(t1.input 2)+(-0.5,0)$) (ny1) {};


   \node[or gate US, draw, logic gate inputs=nn, scale=1] at ($(t2.output) + (2, 0.5)$) (orTot) {$EQ(x,y)$};

   \draw (x) -- ($(x) + (0,-2.5)$);
   \draw (y) -- ($(y) + (0,-2.5)$);
 
   \draw (nx1) -- (t1.input 1);
   \draw (ny1) -- (t1.input 2);

   \draw (x) |- (nx1) node[connection,pos=0.5]{};
   \draw (y) |- (ny1) node[connection,pos=0.5]{};


   \draw (x) |- (t2.input 1) node[connection,pos=0.5]{};
   \draw (y) |- (t2.input 2) node[connection,pos=0.5]{};


   \draw (t1.output) -- ([xshift=0.3cm]t1.output) |- (orTot.input 1);
   \draw (t2.output) -- ([xshift=0.2cm]t2.output) |- (orTot.input 2);

Un autre exemple est la fonction `XOR` dont nous avons déjà parlé précédemment. Celle-ci peut s'implémenter en utilisant deux inverseurs, deux fonctions `AND` et une fonction `OR` comme représenté dans la :numref:`fig-xor-real`.

.. _fig-xor-real:
.. tikz:: Représentation graphique d'un circuit qui réalise la fonction XOR

   [label distance=2mm, scale=2,
   connection/.style={draw,circle,fill=black,inner sep=1.5pt}
   ]
   \node (x) at (0.5,0) {$x$};
   \node (y) at (1,0) {$y$};

   \node[and gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at ($(x)+(2,-1)$) (t1) {$x\bar{y}$};
   \node[and gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at ($(x)+(2,-2)$) (t2) {$\bar{x}y$};
 
   \node[not gate US, draw, scale=0.75] at ($(t2.input 1)+(-0.5,0)$) (nx1) {};
   \node[not gate US, draw, scale=0.75] at ($(t1.input 2)+(-0.5,0)$) (ny1) {};


   \node[or gate US, draw, logic gate inputs=nn, scale=1] at ($(t2.output) + (2, 0.5)$) (orTot) {$OR(x,y)$};

   \draw (x) -- ($(x) + (0,-2.5)$);
   \draw (y) -- ($(y) + (0,-2.5)$);
 
   \draw (nx1) -- (t2.input 1);
   \draw (ny1) -- (t1.input 2);

   \draw (x) |- (nx1) node[connection,pos=0.5]{};
   \draw (y) |- (ny1) node[connection,pos=0.5]{};


   \draw (x) |- (t1.input 1) node[connection,pos=0.5]{};
   \draw (y) |- (t2.input 2) node[connection,pos=0.5]{};


   \draw (t1.output) -- ([xshift=0.3cm]t1.output) |- (orTot.input 1);
   \draw (t2.output) -- ([xshift=0.2cm]t2.output) |- (orTot.input 2);


Avec un multiplexeur, il est possible de construire un circuit "programmable" qui, en fonction de la valeur de son entrée `sel`, calcule soit la fonction `AND`, soit la fonction `OR`. Ce circuit est représenté dans la :numref:`fig-programmable`.

.. _fig-programmable:
.. tikz:: Un circuit programmable

   [label distance=2mm, scale=2,
   connection/.style={draw,circle,fill=black,inner sep=1.5pt}
   ]
   \node (x) at (0,0) {$x$};
   \node (y) at (0.5,0) {$y$};
   \node (sel) at (2.2,0) {$sel$};
   
   \node (mux) at (2.1,-1) {$mux$};
   \node (out) at (3,-1) {$out$};
   
   \node[and gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at ($(x)+(1,-0.5)$) (t1) {and};
   \node[or gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at ($(x)+(1,-1.5)$) (t2) {or};
 
   \draw (x) -- ($(x) + (0,-2)$);
   \draw (y) -- ($(y) + (0,-2)$);

   \draw (x) |- (t1.input 1) node[connection,pos=0.5]{}; 
   \draw (y) |- (t1.input 2) node[connection,pos=0.5]{}; 

   \draw (x) |- (t2.input 1) node[connection,pos=0.5]{}; 
   \draw (y) |- (t2.input 2) node[connection,pos=0.5]{}; 
   
   \draw (t1.output) -- (mux);
   \draw (t2.output) -- (mux);

   \draw (1.9,-0.6) -- (1.9, -1.4) -- (2.5, -1) --cycle;

   \draw (sel) -- (2.2,-0.8);
   \draw (2.5,-1) -- (out);


   
..   \node (out) at $(orTot.output+(1,0))$ {};

..   \draw (orTot.output) -- (out);


.. todo: exercices inginious pour la reconnaissance de ces fonctions logiques et construction de tables de vérité. Probablement uniquement faisable sous la forme de table de vérité


Exercices
---------

1. Quelle est la table de vérité qui correspond au circuit représenté dans la :numref:`fig-ex-circuit-simple` ?

   .. dessiner un circuit

.. _fig-ex-circuit-simple:   
.. tikz:: Un circuit simple à deux entrées
             
      [label distance=2mm, scale=2,
      connection/.style={draw,circle,fill=black,inner sep=1.5pt}
      ]
      \node (x) at (0.5,0) {$x$};
      \node (y) at (1,0) {$y$};
      
      \node[and gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at ($(x)+(2,-1)$) (t1) {};
      \node[or gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at ($(x)+(2,-2)$) (t2) {};
 
      \node[not gate US, draw, scale=0.75] at ($(t2.input 1)+(-0.5,0)$) (nx1) {};
      \node[not gate US, draw, scale=0.75] at ($(t1.input 2)+(-0.5,0)$) (ny1) {};


      \node[and gate US, draw, logic gate inputs=nn, scale=1] at ($(t2.output) + (2, 0.5)$) (orTot) {};

      \draw (x) -- ($(x) + (0,-2.5)$);
      \draw (y) -- ($(y) + (0,-2.5)$);
 
      \draw (nx1) -- (t2.input 1);
      \draw (ny1) -- (t1.input 2);

      \draw (x) |- (nx1) node[connection,pos=0.5]{};
      \draw (y) |- (ny1) node[connection,pos=0.5]{};


      \draw (x) |- (t1.input 1) node[connection,pos=0.5]{};
      \draw (y) |- (t2.input 2) node[connection,pos=0.5]{};


      \draw (t1.output) -- ([xshift=0.3cm]t1.output) |- (orTot.input 1);
      \draw (t2.output) -- ([xshift=0.2cm]t2.output) |- (orTot.input 2);

2. Quelle est la table de vérité qui correspond au circuit de la :numref:`fig-ex-circuitsimple3` ?

   .. _fig-ex-circuitsimple3: 
   .. tikz:: Un circuit simple à trois entrées
             
      [label distance=2mm, scale=2,
      connection/.style={draw,circle,fill=black,inner sep=1.5pt}
      ]
      \node (x) at (0.5,0) {$x$};
      \node (y) at (0.75,0) {$y$};
      \node (z) at (1,0) {$z$};
      
      
      \node[or gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at ($(x)+(2,-1)$) (t1) {};
      \node[and gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at ($(x)+(2,-2)$) (t2) {};
 
      \node[not gate US, draw, scale=0.75] at ($(t2.input 1)+(-0.5,0)$) (nx1) {};
      \node[not gate US, draw, scale=0.75] at ($(t1.input 2)+(-0.5,0)$) (ny1) {};
      \node[not gate US, draw, scale=0.75] at ($(t2.input 2)+(-0.5,0)$) (nz1) {};


      \node[and gate US, draw, logic gate inputs=nn, scale=1] at ($(t2.output) + (2, 0.5)$) (orTot) {};

      \draw (x) -- ($(x) + (0,-2.5)$);
      \draw (y) -- ($(y) + (0,-2.5)$);
      \draw (z) -- ($(z) + (0,-2.5)$);
 
      \draw (nx1) -- (t2.input 1);
      \draw (ny1) -- (t1.input 2);
      \draw (nz1) -- (t2.input 2);

      \draw (x) |- (nx1) node[connection,pos=0.5]{};
      \draw (y) |- (ny1) node[connection,pos=0.5]{};
      \draw (z) |- (nz1) node[connection,pos=0.5]{};

      \draw (x) |- (t1.input 1) node[connection,pos=0.5]{};
 


      \draw (t1.output) -- ([xshift=0.3cm]t1.output) |- (orTot.input 1);
      \draw (t2.output) -- ([xshift=0.2cm]t2.output) |- (orTot.input 2);
      
   
Un langage de description de circuits logiques
==============================================


Les représentations graphiques sont très utiles pour permettre à des électroniciens de discuter de circuits électroniques, mais de nos jours ils travaillent généralement en utilisant des langages informatiques qui permettent de décrire ces circuits électroniques sous la forme de commandes. L'avantage de ces langages est qu'ils peuvent facilement être utilisés dans des logiciels de simulation ou d'analyse de circuits. C'est ce que nous ferons dans le cadre de ce cours avec le langage HDL proposé par les auteurs du livre `Building a Modern Computer from First Principles <https://nand2tetris.org>`_.


Il existe de nombreux langages qui permettent de décrire de façon précise des fonctions booléennes et des circuits électroniques de façon générale [#hdl]_ . Une description détaillée de ces langages sort du cadre de ce cours. Nous nous contenterons de voir celui qui est utilisé par les simulateurs du livre de référence. 

Quatre types de fichiers sont utilisés par le simulateur :
 - les fichiers de description de circuits (nom de fichier se terminant par ``.hdl``)
 - les fichiers qui définissent les tests à réaliser sur les circuits (nom de fichier se terminant par ``.tst``)
 - les fichiers contenant les sorties d'un circuit obtenues lors de l'exécution d'un fichier de test (nom de fichier se terminant par ``.out``)
 - les fichiers contenant les sorties attendues d'un circuit (nom de fichier se terminant par ``.cmp``)   

Le langage de description de circuits permet de construire des fonctions booléennes en réutilisant les fonctions de base. Ce langage s'utilise un peu comme un langage de programmation. Dans le langage HDL, un circuit est défini sous la forme d'une liste de commandes, avec généralement une commande par ligne.

Comme dans tout langage de programmation, HDL permet d'inclure des commentaires. HDL utilise une convention similaire à des langages de programmation tels que C ou Java. En HDL, il y a deux façons de définir un commentaire. La première est d'utiliser les caractères `//`. Tous les caractères qui suivent `//` sur une ligne sont un commentaire qui ne sera pas lu par le simulateur. Il est aussi possible d'écrire de longs commentaires qui couvrent plusieurs lignes. Dans ce cas, le commentaire débute par les caractères `/*` et couvre tout le texte jusqu'à `*/`. Le texte ci-dessous présente ces deux types de commentaires.

.. code-block:: console
   
   // Un commentaire sur une seule ligne
   
    /*
     * un commentaire sur plusieurs lignes
     */

Le langage HDL comprend différents mots-clés que l'on retrouve dans toute description de circuits. Le premier est le mot clé `CHIP` qui permet donner un nom au circuit électronique que l'on décrit dans le fichier. Il est préférable d'utiliser comme nom du circuit le même nom que celui du fichier. Le livre recommande d'utiliser un nom commençant par une majuscule pour les circuits que l'on crée. La définition d'un circuit commence après l'accolade ouvrante (`{`)  et se termine à l'accolade fermante (`}`).

.. code-block:: console
                
   /*
    * Commentaire expliquant ce que fait le circuit
    */
   CHIP Nom {
     // définition complète du circuit
   }

   
A l'intérieur de la définition d'un circuit, on peut utiliser différents mots-clés:

 - `IN` permet de lister un ensemble d'entrées
 - `OUT` permet de lister un ensemble de sorties

Ces deux mots-clés sont utilisés au début de la description d'un circuit. Chaque entrée et chaque sortie doit avoir un nom différent. Par convention, on utilisera un nom écrit en minuscules et commençant par une lettre pour les entrées et les sorties. Les noms des entrées/sorties doivent être séparés par des virgules et la liste des entrées/sorties doit se terminer par un point-virgule (`;`). 

.. code-block:: console

   IN a,b,c;  // Trois entrées appelés a, b et c
   OUT out1, out2; // Deux entrées baptisées out1 et out2

   
Après avoir spécifié les entrées/sorties, il faut indiquer les différentes fonctions qui sont utilisées par le circuit. Le mot-clé `PARTS:` marque le début de la définition des fonctions logiques. L'exemple ci-dessous présente un squelette de circuit en HDL.

    
.. code-block:: console
   
   // Un commentaire
   CHIP Nom {   // Le nom du circuit doit être le même que le nom du fichier
      IN ...  // les entrées du circuit
      OUT ... // les sorties du circuit

      PARTS:   // les composantes du circuit
        // description des différentes parties du circuit
   } // marque la fin de la définition du circuit Nom


HDL peut être utilisé pour construire de nombreuses fonctions booléennes en s'appuyant sur les fonctions existantes. Le simulateur supporte différentes fonctions de base dont :

 - la fonction `Nand` qui est la fonction primitive pour de très nombreux circuits électroniques
 - la fonction `And`
 - la fonction `Or`
 - la fonction `Not` ou l'inverseur
   
En utilisant l'inverseur, il est possible de construire un circuit électronique qui ne fait rien du tout avec deux inverseurs. Ce circuit prend une entrée nommée `a` et la connecte à un inverseur. La sortie de cet inverseur a comme nom `nota`. Elle est connecté à l'entrée du second inverseur.
   
.. code-block:: console
                
   // un circuit qui ne fait rien
   CHIP Rien {
       IN a;     // Le circuit a une entrée que l'on nomme a dans ce fichier
       OUT out;  // Le circuit a une sortie que l'on nomme out dans ce fichier
       //
       PARTS:
       Not(in=a, out=nota);   // premier inverseur connecté à l'entrée a, sa sortie est appelée nota
       Not(in=nota, out=out); // second inverseur connecté à la sortie du premier, sa sortie est reliée à out
   }


Graphiquement, ce circuit peut être représenté comme dans la :numref:`fig-circuit-rien`.

.. _fig-circuit-rien:
.. tikz:: Représentation graphique du circuit qui ne fait rien
   :libs:  circuits.logic.US
           
   [label distance=2mm, scale=2,
   connection/.style={draw,circle,fill=black,inner sep=1.5pt}
   ]
   \node (a) at (0.5,0) {$a$};
   \node (out) at (4.5,0) {$out$};
   
   \node[not gate US, draw, scale=0.75] at ($(a)+(1,0)$) (nota) {};
   \node[not gate US, draw, scale=0.75] at ($(nota.output)+(1,0)$) (notb) {};

   \draw (a) -- (nota.input);
   \draw (nota) -- (notb.input);
   \draw (notb) -- (out); 


Un autre exemple est de construire un circuit qui implémente la fonction `AND` avec trois entrées en utilisant des fonctions `AND` à deux entrées.

.. code-block:: console

   /*
    * Une circuit AND à trois entrées
    */  
   CHIP And3 {
       IN a,b,c;   // Les trois entrées
       OUT out;    // La sortie du circuit 
       //
       PARTS:
       And(a=a, b=b, out=and1);   // première fonction AND
       And(a=and1, b=c, out=out); // seconde fonction AND
   }

   
Un exemple plus complexe est de construire une implémentation de la fonction `XOR` sur base des fonctions `AND`, `OR` et `NOT`.    


.. code-block:: console
             
   /*
    * Une circuit XOR à deux entrées
    */  
   CHIP Xor {
       IN a,b;  
       OUT out; 
       
       PARTS:
       Not(in=a, out=nota);
       Not(in=b, out=notb);
       And(a=a, b=notb, out=w1);
       And(a=nota, b=b, out=w2);  
       Or(a=w1, b=w2, out=out); 
   }


Les fichiers `HDL` contiennent la description du circuit électronique. Ils seront utilisés pour les différents projets de ce cours. Outre le langage HDL, le simulateur proposé dans le livre de référence supporte également un langage qui permet de définir les tests que chaque circuit doit supporter. Ces tests sont très importants car ils définissent de façon précise les sorties attendues de chaque circuit. Prenons comme exemple les tests pour la fonction `NOT`. Ceux-ci sont définis dans le fichier `Not.tst` du premier projet. La fonction `Not` a une entrée baptisée `in` et une sortie baptisée `out`. 

.. code-block:: console

   // This file is part of www.nand2tetris.org
   // and the book "The Elements of Computing Systems"
   // by Nisan and Schocken, MIT Press.
   // File name: projects/01/Not.tst

   load Not.hdl,                    // charge la description de l'inverseur
   output-file Not.out,             // les valeurs de la sortie out sont sauvées dans le fichier Not.out
   compare-to Not.cmp,              // les valeurs de la sortie out seront comparées au contenu du fichier Not.cmp
   output-list in%B3.1.3 out%B3.1.3; // format des données dans le fichier de sortie

   set in 0,      // pour ce test, on fixe la valeur de in à 0
   eval,          // on exécute le simulateur
   output;        // on sauvegarde le résultat

   set in 1,      // pour ce test, on fixe la valeur de in à 0
   eval,          // on exécute le simulateur
   output;        // on sauvegarde le résultat


Ce test charge le fichier contenant la description du circuit (`Not.hdl`). Il définit ensuite le fichier de sortie comme étant `Not.out`. Le fichier référence auquel le résultat de la simulation devra être comparé est le fichier `Not.cmp`. La commande `output-list` indique qu'il faut créer une colonne avec la valeur de l'entrée `in` suivie d'une colonne avec la valeur de la sortie `out` dans le fichier `Not.out`.

Dans la deuxième partie de la suite de test, la commande `set` permet de fixer les valeurs des différentes entrées. Comme le circuit n'a qu'une entrée, il suffit de deux commandes `set` pour couvrir toutes les possibilités.

Le fichier `Not.cmp` reprend les résultats attendus lors de l'exécution du circuit qui implémente l'inverseur. Dans ce cas, il s'agit de la table de vérité complète de l'inverseur. Pour des circuits plus simples, ce fichier ne contiendra que les valeurs attendues pour les tests réalisés.

.. code-block:: console

                
   |  in   |  out  |
   |   0   |   1   |
   |   1   |   0   |


Vous trouverez de nombreux autres exemples de fichiers de test dans l'archive relative au premier projet : `https://www.nand2tetris.org/project01 <https://www.nand2tetris.org/project01>`_ 

   

   
   

.. [#hdl] Voir par exemple `https://en.wikipedia.org/wiki/Hardware_description_language <https://en.wikipedia.org/wiki/Hardware_description_language>`_ 

          .. todo: exercices inginious pour construire des circuits simples en partie lié au premier projet pour qu'ils puissent avancer dans ce projet sans trop de difficultés et le réussir



Exercices
---------
      
1. Avec un multiplexeur, il est possible de construire des circuits "programmables", c'est-à-dire des circuits pour lesquels une des entrées permet de choisir la fonction calculée. Considérons le circuit hypothétique représenté dans la :numref:`fig-ex-programmable` :

.. _fig-ex-programmable:   
.. tikz:: Un exemple de circuit programmable

   [label distance=2mm, scale=2,
   connection/.style={draw,circle,fill=black,inner sep=1.5pt}
   ]
   \node (x) at (0,0) {$x$};
   \node (y) at (0.5,0) {$y$};
   \node (sel) at (2.2,0) {$fct$};
   
   \node (mux) at (2.1,-1) {$mux$};
   \node (out) at (3,-1) {$out$};
   
   \node[and gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at ($(x)+(1,-0.5)$) (t1) {and};
   \node[not gate US, draw, rotate=0, logic gate inputs=n, scale=1] at ($(x)+(1,-1.5)$) (t2) {not};
 
   \draw (x) -- ($(x) + (0,-2)$);
   \draw (y) -- ($(y) + (0,-2)$);

   \draw (x) |- (t1.input 1) node[connection,pos=0.5]{}; 
   \draw (y) |- (t1.input 2) node[connection,pos=0.5]{}; 

   \draw (y) |- (t2.input) node[connection,pos=0.5]{}; 
   
   \draw (t1.output) -- (mux);
   \draw (t2.output) -- (mux);

   \draw (1.9,-0.6) -- (1.9, -1.4) -- (2.5, -1) --cycle;

   \draw (sel) -- (2.2,-0.8);
   \draw (2.5,-1) -- (out);

   
Construisez d'abord la table de vérité de ce circuit et ensuite proposez une suite de test qui permet de valider qu'une implémentation de ce circuit est correcte.   
   


Maintenant que nous avons vu les fonctions logiques de base, nous pouvons nous préparer à construire les circuits qui seront les briques de base d'un microprocesseur. Avant cela, il nous reste deux concepts importants à discuter.


Durant la première semaine, nous avons vu comment une fonction booléenne pouvait traiter des entrées valant `0` ou `1`. Souvent, les circuits électroniques sont amenés à traiter plusieurs données simultanément. Le livre appelle ces circuits les circuits "multi-bits".

L'autre point que nous devons aborder sont les fonctions primitives. Durant la première semaine, nous avons travaillé avec `AND`, `OR` et `NOT`. Ces fonctions sont faciles à comprendre et utiliser. Pour des raisons technologiques, les circuits électroniques n'utilisent pas ces fonctions comme des fonctions primitives mais plutôt les fonctions `NAND` ou `NOR` dans certains cas. Nous verrons que la fonction `NAND` est une fonction primitive qui permet d'implémenter n'importe quelle fonction booléenne.


Les fonctions "multi-bits"
--------------------------

Les fonctions multi-bits sont simplement des fonctions qui sont appliquées de la même façon à plusieurs entrées. Le circuit de la :numref:`fig-not-4` applique la fonction `NOT` à quatre entrées baptisées `x[0]`, `x[1]`, `x[2]` et `x[3]`. Les sorties sont `out[0]`, `out[1]`, `out[2]` et `out[3]`.


.. _fig-not-4:
.. tikz:: Représentation graphique d'un circuit NOT 4-bits

   [label distance=2mm, scale=2,
   connection/.style={draw,circle,fill=black,inner sep=1.5pt}
   ]
   
   \node (x0) at (0.5,0) {$x[0]$}; 
   \node (x1) at (1,0) {$x[1]$};
   \node (x2) at (1.5,0) {$x[2]$}; 
   \node (x3) at (2,0) {$x[3]$};
   
   \node[not gate US, draw, scale=0.75] at ($(x3)+(2,-1)$) (nx0) {}; 
   \node[not gate US, draw, scale=0.75] at ($(x3)+(2,-1.5)$) (nx1) {};
   \node[not gate US, draw, scale=0.75] at ($(x3)+(2,-2)$) (nx2) {}; 
   \node[not gate US, draw, scale=0.75] at ($(x3)+(2,-2.5)$) (nx3) {};
   
   \node (out0) at ($(nx0)+(1,0)$) {$out[0]$}; 
   \node (out1) at ($(nx1)+(1,0)$) {$out[1]$};
   \node (out2) at ($(nx2)+(1,0)$) {$out[2]$}; 
   \node (out3) at ($(nx3)+(1,0)$) {$out[3]$};

   \draw (x0) -- ($(x0) + (0,-2.5)$);
   \draw (x1) -- ($(x1) + (0,-2.5)$);
   \draw (x2) -- ($(x2) + (0,-2.5)$);
   \draw (x3) -- ($(x3) + (0,-2.5)$);
      
   \draw (x0) |- (nx0) node[connection,pos=0.5]{}; 
   \draw (x1) |- (nx1) node[connection,pos=0.5]{};
   \draw (x2) |- (nx2) node[connection,pos=0.5]{}; 
   \draw (x3) |- (nx3) node[connection,pos=0.5]{};

   \draw (nx0.output) -- (out0);
   \draw (nx1.output) -- (out1);
   \draw (nx2.output) -- (out2);
   \draw (nx3.output) -- (out3);


Il est aussi possible de construire des versions multi-bits des fonctions
`AND` et `OR`. Ces deux circuits sont représentés dans les figures :numref:`fig-and2` et :numref:`fig-or-2`.

.. _fig-and2:
.. tikz:: Représentation graphique d'un circuit AND 2-bits

   [label distance=2mm, scale=2,
   connection/.style={draw,circle,fill=black,inner sep=1.5pt}
   ]
   
   \node (a0) at (0.5,0) {$a[0]$}; 
   \node (a1) at (1,0) {$a[1]$};
   \node (b0) at (1.5,0) {$b[0]$}; 
   \node (b1) at (2,0) {$b[1]$};

   \node[and gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at ($(b1)+(2,-1)$) (t1) {};

   \node[and gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at ($(b1)+(2,-2)$) (t2) {};
   
   
   \node (out0) at ($(t1.output)+(1,0)$) {$out[0]$}; 
   \node (out1) at ($(t2.output)+(1,0)$) {$out[1]$};

   \draw (a0) -- ($(a0) + (0,-2.5)$);
   \draw (a1) -- ($(a1) + (0,-2.5)$);
   \draw (b0) -- ($(b0) + (0,-2.5)$);
   \draw (b1) -- ($(b1) + (0,-2.5)$);
      
   \draw (a0) |- (t1.input 1) node[connection,pos=0.5]{}; 
   \draw (b0) |- (t1.input 2) node[connection,pos=0.5]{};
   \draw (a1) |- (t2.input 1) node[connection,pos=0.5]{}; 
   \draw (b1) |- (t2.input 2) node[connection,pos=0.5]{};

   \draw (t1.output) -- (out0);
   \draw (t2.output) -- (out1);

.. _fig-or-2:
.. tikz:: Représentation graphique d'un circuit OR 2-bits

   [label distance=2mm, scale=2,
   connection/.style={draw,circle,fill=black,inner sep=1.5pt}
   ]
   
   \node (a0) at (0.5,0) {$a[0]$}; 
   \node (a1) at (1,0) {$a[1]$};
   \node (b0) at (1.5,0) {$b[0]$}; 
   \node (b1) at (2,0) {$b[1]$};

   \node[or gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at ($(b1)+(2,-1)$) (t1) {};

   \node[or gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at ($(b1)+(2,-2)$) (t2) {};
   
   
   \node (out0) at ($(t1.output)+(1,0)$) {$out[0]$}; 
   \node (out1) at ($(t2.output)+(1,0)$) {$out[1]$};

   \draw (a0) -- ($(a0) + (0,-2.5)$);
   \draw (a1) -- ($(a1) + (0,-2.5)$);
   \draw (b0) -- ($(b0) + (0,-2.5)$);
   \draw (b1) -- ($(b1) + (0,-2.5)$);
      
   \draw (a0) |- (t1.input 1) node[connection,pos=0.5]{}; 
   \draw (b0) |- (t1.input 2) node[connection,pos=0.5]{};
   \draw (a1) |- (t2.input 1) node[connection,pos=0.5]{}; 
   \draw (b1) |- (t2.input 2) node[connection,pos=0.5]{};

   \draw (t1.output) -- (out0);
   \draw (t2.output) -- (out1);

De la même façon, on peut construire des multiplexeurs et des démultiplexeurs à k-bits. 
   
   
   
La fonction universelle `NAND`
------------------------------

La fonction `NAND` joue un rôle particulier dans de nombreux circuits électroniques car elle sert d'élément de base à la réalisation d'autres fonctions. Un point particulier est que la fonction `NAND` permet de facilement obtenir un inverseur. Ainsi, :math:`NAND(x,x) \iff NOT(x)`.  

=== =========
x   NAND(x,x) 
--- ---------
0     1 
1     0 
=== =========


Sur base de cette fonction `NAND`, on peut aussi facilement construire la fonction `AND` puisque :math:`AND(x,y) \iff NAND( NAND(x,y), NAND(x,y) )`. On peut s'en convaincre en construisant la table de vérité de cette fonction 


=== = ========= ========= ============================
x   y NAND(x,y) NAND(x,y) NAND( NAND(x,y), NAND(x,y) )
--- - --------- --------- ----------------------------
0   0     1         1                 0
0   1     1         1                 0 
1   0     1         1                 0 
1   1     0         0                 1 
=== = ========= ========= ============================



Exercices
_________

La fonction `NAND` est une fonction de base qui permet d'implémenter toutes les autres fonctions booléennes.

1. En appliquant les lois de De Morgan, il est aussi possible de construire la fonction `OR` en se basant uniquement sur la fonction `NAND`.

.. En effet, on remarque que  `NAND(x,y) = OR ( NOT(x), NOT(y) )`. Calculons donc la table de vérité de `NAND( NOT(x), NOT(y) )`.

   === = ========= ========= ============================
   x   y NAND(x,x) NAND(y,y) NAND( NAND(x,x), NAND(y,y) )
   --- - --------- --------- ----------------------------
   0   0     1         1                 1
   0   1     1         0                 1 
   1   0     0         1                 1 
   1   1     0         0                 0 
   === = ========= ========= ============================

   On est presque à celle de la fonction `OR`. Il suffit en effet d'inverser son résultat pour obtenir la fonction `OR`. Donc, :math:`NAND( NAND( NAND(x,x), NAND(y,y) ), NAND( NAND(x,x), NAND(y,y) )) \iff OR(x,y)`.
   
2. En utilisant uniquement des fonctions `NAND`, implémentez les fonctions suivantes:
   - `XOR`
   - `NOR`  


3. La fonction `NOR` est également une fonction universelle qui permet d'implémenter n'importer quelle fonction logique. En utilisant uniquement une fonction `NOR`, implémentez les fonctions suivantes:

    - inverseur (`NOT`)
    - `OR`
    - `AND`
    - `XOR`
    - `NAND`


Pour rappel, la table de vérité de la fonction `NOR` est la suivante :

=== = ========
x   y NOR(x,y) 
--- - --------
0   0 1 
0   1 0 
1   0 0 
1   1 0 
=== = ========




Compléments sur les fonctions booléennes
========================================

Dans les chapitres précédents, nous avons couvert les bases de la construction des fonctions booléennes en utilisant les fonctions `AND`, `OR` et `NOT`. Il existe de nombreuses fonctions de ce type. La plupart de ces fonctions manipulent des séquences de bits. Certaines de ces séquences de bits servent à représenter de l'information d'un type particulier. 

Représentation binaire de l'information
---------------------------------------

Dans un ordinateur, toutes les informations peuvent être stockées sous la forme d'une séquence de bits. La longueur de la séquence est fonction de la quantité d'information à stocker. Notre premier exemple concerne les caractères. Il est important de pouvoir représenter les différents caractères des langues écrites de façon compacte et non-ambiguë pour pouvoir stocker et manipuler du texte sur un ordinateur. Le principe est très simple. Il suffit de construire une table qui met en correspondance une séquence de bits et le caractère qu'elle représente.

Parmi les tables d'encodage des caractères les plus simples, la plus connue est certainement la table US-ASCII dont la définition est notamment reprise dans :rfc:`20`. Cette table associe une séquence de 7 bits (`b7` à `b1`) à un caractère particulier. Pour des raisons historiques, certains de ces caractères sont des caractères dits "de contrôle" qui ne sont pas imprimables. Ils permettaient de contrôler le fonctionnement de terminaux ou d'imprimantes. Par exemple, les caractères `CR` et/ou `LF` correspondent au retour de charriot et au passage à la ligne sur un écran ou une imprimante.  



   .. code-block:: console
      :name: table-ascii
      :caption: Table des caractères ASCII
                
      |----------------------------------------------------------------------|
        B  \ b7 ------------>| 0   | 0   | 0   | 0   | 1   | 1   | 1   | 1   |
         I  \  b6 ---------->| 0   | 0   | 1   | 1   | 0   | 0   | 1   | 1   |
          T  \   b5 -------->| 0   | 1   | 0   | 1   | 0   | 1   | 0   | 1   |
           S                 |-----------------------------------------------|
                     COLUMN->| 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   |
      |b4 |b3 |b2 |b1 | ROW  |     |     |     |     |     |     |     |     |
      +----------------------+-----------------------------------------------+
      | 0 | 0 | 0 | 0 | 0    | NUL | DLE | SP  | 0   | @   | P   |   ` |   p |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 0 | 0 | 0 | 1 | 1    | SOH | DC1 | !   | 1   | A   | Q   |   a |   q |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 0 | 0 | 1 | 0 | 2    | STX | DC2 | "   | 2   | B   | R   |   b |   r |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 0 | 0 | 1 | 1 | 3    | ETX | DC3 | #   | 3   | C   | S   |   c |   s |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 0 | 1 | 0 | 0 | 4    | EOT | DC4 | $   | 4   | D   | T   |  d  |   t |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 0 | 1 | 0 | 1 | 5    | ENQ | NAK | %   | 5   | E   | U   |  e  |   u |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 0 | 1 | 1 | 0 | 6    | ACK | SYN | &   | 6   | F   | V   |  f  |   v |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 0 | 1 | 1 | 1 | 7    | BEL | ETB | '   | 7   | G   | W   |  g  |   w |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 1 | 0 | 0 | 0 | 8    | BS  | CAN | (   | 8   | H   | X   |  h  |   x |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 1 | 0 | 0 | 1 | 9    | HT  | EM  | )   | 9   | I   | Y   |  i  |   y |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 1 | 0 | 1 | 0 | 10   | LF  | SUB | *   | :   | J   | Z   |  j  |   z |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 1 | 0 | 1 | 1 | 11   | VT  | ESC | +   |  ;  | K   | [   |  k  |   { |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 1 | 1 | 0 | 0 | 12   | FF  | FS  | ,   | <   | L   | \   |  l  |   | |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 1 | 1 | 0 | 1 | 13   | CR  | GS  | -   | =   | M   | ]   |  m  |   } |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 1 | 1 | 1 | 0 | 14   | SO  | RS  | .   | >   | N   | ^   |  n  |   ~ |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 1 | 1 | 1 | 1 | 15   | SI  | US  | /   | ?   | O   | _   |  o  | DEL |
      +----------------------+-----------------------------------------------+

   
   
La table US-ASCII (:numref:`table-ascii`) définit les représentations binaires suivantes:

 - `01100000` correspond au caractère représentant le chiffre `0`
 - `01101001` correspond au caractère représentant le chiffre `9`
 - `10000011` correspond au caractère représentant la lettre `A` (majuscule)  
 - `01000000` correspond au caractère représentant un espace

Cette table avait l'inconvénient majeur de ne contenir que les représentations des caractères non-accentués de l'alphabet latin. Elle permet d'écrire du texte en anglais et dans d'autres langues européennes qui utilisent peu d'accents, mais ne permet évidemment pas de représenter tous les caractères des langues écrites sur notre planète. Au fil des années, ce problème a été résolu avec d'autres tables de correspondance dont celles qui sont adaptées aux accents utilisés par les langues européennes. Aujourd'hui, l'encodage standard des caractères se fait en utilisant le format `Unicode <https://home.unicode.org>`_. Une description détaillée d'Unicode sort du cadre de ce cours d'introduction, mais sachez qu'en mars 2020, la version 13.0 d'Unicode permettait de représenter 143859 caractères différents correspondant à 154 formes d'écritures. Unicode permet de représenter quasiment toutes les langues écrites connues sur notre planète. Des chercheurs ont même proposé un format Unicode permettant de supporter le Klingon, c'est-à-dire la langue écrite inventée pour la série de films Star Trek.

.. ajouter un graphique avec des statistiques issues de https://en.wikipedia.org/wiki/Unicode pour montrer l'évolution dans le temps

Avoir une représentation binaire pour les caractères permet de les stocker en mémoire, sur disque ou de les transmettre à travers un réseau. C'est important, mais il faut aussi pouvoir permettre à un humain de lire des textes produits par un ordinateur, que ce soit sur papier ou écran. Il existe de très nombreuses solutions qui permettent d'afficher ou d'imprimer des caractères. Dans ce cours d'introduction, nous nous contentons d'une solution très simple qui fonctionne en noir et blanc. Nous pourrons ajouter les couleurs lorsque nous aurons vu comment représenter des nombres dans le chapitre suivant.

Un écran et une imprimante permettent d'afficher des points à n'importe quelle position. On peut aisément se représenter un écran comme un rectangle composé de pixels. Chacun des points de cet écran est identifié par une abscisse et une ordonnée qui sont toutes les deux entières. Ainsi, un écran 1024x768 peut afficher 1024 points selon l'axe des x et 768 points selon l'axe des y. 

Sur un tel écran, on peut facilement afficher des caractères. Il suffit d'avoir pour chaque caractère une table qui contient la représentation graphique de chacun des caractère à afficher sous la forme de pixels. A titre d'exemple, supposons que l'on veut afficher chaque caractère dans un carré de 8x8 pixels. Dans ce cas, on peut stocker la représentation graphique d'un caractère en noir en blanc sous la forme d'une suite de 8 bytes. Par exemple, les huit octets ci-dessous contiennent une représentation graphique du caractère `1`.

.. code-block:: console

   00001000
   00011000
   00101000
   00001000
   00001000
   00001000
   00001000
   00111110



.. source: https://tex.stackexchange.com/questions/157080/can-tikz-create-pixel-art-images/279697

Une représentation graphique, fortement agrandie, de ce caractère est présentée dans la :numref:`fig-pixel-1`.


.. _fig-pixel-1:
.. tikz:: Un caractère sous la forme de pixels
	  
   \def\pixels{
   {0,0,0,0,1,0,0,0},
   {0,0,0,1,1,0,0,0},
   {0,0,1,0,1,0,0,0},
   {0,0,0,0,1,0,0,0},
   {0,0,0,0,1,0,0,0},
   {0,0,0,0,1,0,0,0},
   {0,0,0,0,1,0,0,0},
   {0,0,1,1,1,1,1,0},%
   }
   \definecolor{pixel 1}{HTML}{000000}
   \definecolor{pixel 0}{HTML}{FFFFFF}
   \foreach \line [count=\y] in \pixels {
   \foreach \pix [count=\x] in \line {
   \draw[fill=pixel \pix] (\x,-\y) rectangle +(1,1);
   }
   }

	  
	  
.. présenter l'écran ou l'imprimante bitmap et pixel, uniquement en noir et blanc

.. parler de couleurs primaire et rgb, cela nécessite des nombres également

.. Pour le son, ce serait plus facile avec des nombres
   
Fonctions booléennes sur les séquences de bits
----------------------------------------------


De nombreuses fonctions manipulent des séquences de bits. Nous verrons dans le prochain chapitre comment représenter des nombres sous la forme d'une séquence de bits et comment réaliser différentes opérations arithmétiques sur ces séquences de bits. Ces fonctions sont dites combinatoires car ce sont des fonctions dont le résultat dépend uniquement des valeurs d'entrée. Dans cette section, nous abordons d'abord les fonctions combinatoires qui permettent de déplacer des bits dans une séquence. Nous considérons trois types de fonctions:

 - les fonctions de décalage (à droite ou à gauche)
 - les fonctions de rotation (à droite ou à gauche)
 - les fonctions de masquage permettant de forcer certains bits à la valeur `0` ou  `1`

Chacune de ces fonctions travaille sur une séquence de `n` bits, :math:`b_{n-1}b_{n-2}...b_{2}b_{1}b_{0}`. Dans une telle séquence, nous avons vu que :math:`b_{n-1}` était le bit de poids fort tandis que :math:`b_{0}` est le bit de poids faible. Ces opérations sont généralement appliquées à des séquences de 8, 16, 32 ou 64 bits  

Plusieurs fonctions de décalage sont possibles. La plus simple est la fonction de décalage d'un bit vers la droite. Cette fonction prend comme entrée la séquence de bits :math:`b_{n-1}b_{n-2}...b_{2}b_{1}b_{0}` et retourne comme résultat la séquence :math:`0b_{n-1}b_{n-2}...b_{2}b_{1}`. Tous les bits sont décalés d'une place vers la droite. Il existe une variante de cette fonction de décalage qui retourne :math:`b_{n-1}b_{n-1}b_{n-2}...b_{2}b_{1}` pour la séquence d'entrée :math:`b_{n-1}b_{n-2}...b_{2}b_{1}b_{0}`. Elle est parfois utilisée pour certaines manipulations des nombres entiers.

De la même façon, la fonction de décalage d'une place vers la gauche prend comme entrée la séquence de bits :math:`b_{n-1}b_{n-2}...b_{2}b_{1}b_{0}` et retourne comme résultat :math:`b_{n-2}...b_{2}b_{1}b_{0}0`.

Ces deux fonctions peuvent se généraliser. Plutôt que de décaler la séquence de bits d'une place vers la gauche ou vers la droite, on peut la décaler de `p` places où `p` est aussi une entrée de la fonction. Ainsi, lorsque l'on décale de deux places vers la droite la séquence :math:`b_{n-1}b_{n-2}...b_{2}b_{1}b_{0}`, on obtient la séquence :math:`00b_{n-1}b_{n-2}...b_{2}`. Il en va de même pour le décalage vers la gauche.


Exercices
_________

1. Écrivez la table de vérité de la fonction de décalage permettant de décaler bloc de quatre bits (:index:`nibble` en anglais et index:`quartet` ou index:`semi-octet` en français d'une place vers la droite. Implémentez ensuite cette fonction en utilisant uniquement des fonctions `AND`, `OR` et `NOT`.

2. Écrivez la table de vérité de la fonction de décalage permettant de décaler un quartet (4 bits) d'une place vers la gauche. Implémentez ensuite cette fonction en utilisant uniquement des fonctions `AND`, `OR` et `NOT`.

3. Écrivez la table de vérité de la fonction de décalage permettant de décaler un quartet (4 bits) de `p` places vers la droite. Pour écrire cette date de vérité, on utilisera deux bits pour représenter l'entrée `p` est les séquences de deux bits suivantes pour représenter les entiers de `0` à `3`.

   - `00` représente l'entier 0
   - `01` représente l'entier 1
   - `10` représente l'entier 2
   - `11` représente l'entier 3
     
  Implémentez ensuite cette fonction en utilisant uniquement des fonctions `AND`, `OR` et `NOT`.  

4. Faites de même pour le décalage de `p` places vers la droite.


Les fonctions de décalage sont utiles pour certaines manipulations sur les bits dans une séquence. Malheureusement, elles résultent en une perte d'information puisque un ou des bits de poids faible sont perdus lors d'un décalage vers la droite. Les fonctions de rotation évitent ce problème. Elles peuvent notamment servir à construire des algorithmes pour crypter (et décrypter) des données stockées sous forme binaire.

La rotation la plus simple est la rotation d'une place vers la droite. Cette fonction prend en entrée une séquence de bits :math:`b_{n-1}b_{n-2}...b_{2}b_{1}b_{0}` et retourne la séquence :math:`b_{0}b_{n-1}b_{n-2}...b_{2}b_{1}`. D'une façon similaire, dans un décalage à gauche d'une place, lorsque la fonction reçoit la séquence :math:`b_{n-1}b_{n-2}...b_{2}b_{1}b_{0}` en entrée, elle retourne la séquence :math:`b_{n-2}...b_{2}b_{1}b_{0}b_{n-1}`. Tout comme pour les fonctions de décalage, les fonctions de rotation peuvent recevoir une seconde entrée qui est le nombre de places de rotation.

Exercices
_________


1. Écrivez la table de vérité de la fonction qui réalise la rotation d'une place vers la gauche d'un quartet (4 bits). Implémentez ensuite cette fonction en utilisant uniquement des fonctions `AND`, `OR` et `NOT`.

2. Écrivez la table de vérité de la fonction qui réalise la rotation d'un quartet (4 bits) de `p` places vers la gauche. Pour écrire cette table de vérité, on utilisera deux bits pour représenter l'entrée `p` est les séquences de deux bits suivantes pour représenter les entiers de `0` à `3`.

   - `00` représente l'entier `0`
   - `01` représente l'entier `1`
   - `10` représente l'entier `2`
   - `11` représente l'entier `3`
     
  Implémentez ensuite cette fonction en utilisant uniquement des fonctions `AND`, `OR` et `NOT`.  

.. masquage

Dans certaines applications, il est utile de pouvoir forcer la valeur d'un bit particulier à `0` ou `1`. Pour illustrer ces interactions, considérons deux exemples sur base de la représentation des caractères et l'utilisation de pixels. Dans la table US-ASCII, les lettres majuscules sont représentées par des chaînes de bits dont les deux bits de poids forts sont à `10` tandis que pour les minuscules, ces deux bits de poids forts sont à `11`. Si on observe les séquences de bits pour chaque caractère, on remarque que les 4 bits de poids faible sont identiques pour la majuscule et la minuscule d'une lettre. Ainsi, pour la lettre `E`, on utilise les séquence `1000101` en majuscules et `1100101` en minuscules. Si une séquence de 7 bits représente une lettre majuscules, alors on peut facilement la convertir en minuscules en forçant le deuxième bit de poids fort à la valeur `1`. Sachant que la fonction booléenne `OR` retourne toujours `1` lorsqu'au moins une de ses deux entrées vaut `1`, on peut transformer une majuscule en minuscule en calculant `OR` avec la séquence `0100000`. Si la représentation du caractère initiale est :math:`b_{6}b_{5}b_{4}b_{3}b_{2}b_{1}b_{0}`, alors la fonction `OR 0100000` retournera :math:`b_{6}1b_{4}b_{3}b_{2}b_{1}b_{0}`. De la même façon, on peut forcer un bit à zéro en utilisant la fonction `AND`. Par exemple, pour transformer une minuscule en majuscule en utilisant le masque `1011111`. 



Lorsqu'un ordinateur doit transmettre ou stocker de l'information encodée sous la forme d'une séquence de bits, il doit parfois pouvoir s'assurer que l'information qui est reçue ou lue est bien identique à celle qui a été envoyée ou écrite.

Un exemple classique de l'utilisation de ces techniques concerne les sondes spatiales qui sont envoyées pour explorer les planètes du système solaire voire explorer au-delà de notre système solaire. Ces sondes collectent de nombreuses informations qu'elles doivent envoyer par radio vers la Terre. Différentes techniques, qui sortent du cadre de ce cours, permettent d'envoyer des séquences de bits par radio. Malheureusement, les transmissions radio peuvent être perturbées par différents phénomènes naturels dont les émissions du soleil par exemple. Suite à ces perturbations, une séquence de bits envoyée par une sonde spatiale peut être reçue de façon incorrecte par la station d'écoute se trouvant au sol. Vu les capacités de la sonde spatiale et les délais de transmission entre les confins du système solaire et la Terre, il est impossible de demander à la sonde spatiale de stocker de l'information pour pouvoir la retransmettre au cas où elle ne serait pas reçue correctement par la station d'écoute sur la Terre. A titre d'exemple, la distance entre Mercure et la Terre varie entre 77 millions de kilomètres et 222 millions de kilomètres. La lumière, qui est la façon la plus rapide de transmettre de l'information, se propage à une vitesse de 300.000 kilomètres par seconde. Cela signifie que lorsque Mercure est proche de la Terre, un signal émis par une sonde autour de Mercure met au moins 256 secondes pour atteindre la Terre. Pour les sondes Voyager 1 et Voyager 2 qui explorent les confins du système solaire, les délais sont encore plus grands. En octobre 2020, un signal radio émis par Voyager 1 mettait près de 21 heures pour atteindre la Terre.

.. voir https://voyager.jpl.nasa.gov/mission/status/

Plusieurs techniques ont étés proposées pour faire face à des erreurs dans la transmission de séquences de bits. Certaines permettent de détecter des erreurs dans l'information reçue. D'autres, plus complexes, permettent de récupérer certaines erreurs de transmission.

Les techniques de détection les plus simples sont les techniques dite `de parité`. L'idée est très simple. Pour pouvoir détecter si une erreur de transmission a affecté une séquence de bits, il suffit d'encoder ces séquences de bits de façon à pouvoir facilement distinguer une séquence valide d'une séquence invalide. Les techniques de parité séparent les séquences de bits en deux moitiés. La première contient les séquences valides qui sont émises par l'émetteur. La seconde contient des séquences qui peuvent être obtenues des première après une erreur de transmission.

La technique de parité paire fonctionne comme suit. Une séquence de `n+1` bits, :math:`b_{n-1}b_{n-2}...b_{2}b_{1}b_{0}p` est valide si elle contient un nombre pair de bits ayant la valeur `1` et invalide sinon. Lorsqu'un émetteur veut envoyer `n` bits, il doit calculer la valeur du bit de poids faible de façon à ce que la séquence des `n+1` bits contienne un nombre pair de bits à la valeur `1`.

Il est utile de prendre quelques exemples pour bien comprendre comment cette technique fonctionne. Considérons les caractères représentés sur 7 bits. Une parité peut être associé à chacun de ces caractères.

 - la parité paire de `01100000` sera `0`
 - la parité paire de `01101001` sera `0`
 - la parité paire de `10000011` sera `1`

Considérons une sonde spatiale qui envoie la séquence de bits composée de ces trois caractères avec leur parité paire, c'est-à-dire : `011000000` `011010010` `100000111`. La station d'écoute pourra recalculer le bit de parité qui est placé dans le bit de poids faible de chaque octet pour vérifier qu'il n'y a pas eu d'erreur de transmission. Si par contre la station d'écoute reçoit `011000001` `111010010` `100000111`, elle pourra vérifier que les deux premiers octets sont incorrects tandis que le troisième est correct. Cette technique de parité permet de détecter les erreurs de transmission qui modifient la valeur de un (et un seul bit) dans la séquence de bits couverte par la parité. En pratique, l'émetteur envoie les bits et calcule la valeur du bit de parité pendant l'envoi de ces bits. Le receveur fait l'inverse pour vérifier que la parité de la séquence reçue est correcte.

.. parité paire

.. parité impaire

Exercices
_________

1. Écrivez la table de vérité d'une fonction qui prend une séquence de trois bits en entrée et retourne un bit de parité paire.

2. Écrivez la table de vérité d'une fonction qui prend une séquence de trois bits en entrée et retourne un bit de parité impaire.

3. Écrivez la table de vérité d'une fonction qui prend en entrée un quartet dont le bit de poids faible contient une parité paire et retourne `1` si ce quartet est valide et `0` sinon.

4. Écrivez la table de vérité d'une fonction qui prend en entrée un quartet dont le bit de poids faible contient une parité impaire et retourne `1` si ce quartet est valide et `0` sinon.
   
.. code de Hamming https://en.wikipedia.org/wiki/Hamming_code   
  
.. Le code de Hamming dépend de la représentation des nombres
   

   
