Logique booléenne
*****************

Le fonctionnement des ordinateurs s'appuie sur quelques principes très simples, mais qui sont utilisés à une très grande échelle. Le premier principe est que toute l'information peut s'encoder sous une forme binaire, c'est-à-dire une suite de bits. Un bit est l'unité de représentation de l'information. Un bit peut prendre deux valeurs:

 - ``0``
 - ``1``

On peut associer une signification à ces bits. Il est par exemple courant de considéré que le bit ``0`` représente la valeur `Faux` tandis que le bit ``1`` représente la valeur `Vrai`. C'est une convention qui est utile dans certains cas, mais n'est pas toujours nécessaire et peut parfois conduire à des erreurs.

Avec ces deux valeurs booléennes, il est intéressant de définir des opérations. Une opération booléenne est une fonction qui prend en entrée 0, 1 ou plusieurs bits et retour un résultat.

Fonctions booléennes
====================

La fonction la plus simple est la fonction identité. Elle prend comme entrée un bit et retourne la valeur de ce bit. On peut la définir en utilisant une `table de vérité` qui indique la valeur du résultat de la fonction pour chaque valeur possible de son entrée. Dans la table ci-dessous, la colonne `x`comprend les différentes valeurs possibles de l'entrée `x` et la valeur du résultat.

=== ========
x   identité 
--- --------
0   0 
1   1
=== ========


Cette fonction n'est pas très utile en pratique. Elle nous permet d'illustrer une table de vérité simple dans laquelle il y a une valeur binaire en entrée et une valeur binaire également en sortie.

Une fonction plus intéressant est l'inverseur, aussi appelée avec la notation `NOT` en anglais. Cette fonction prend comme entrée un bit. Si le bit d'entrée vaut ``1``, elle retourne ``0``. Tandis que si le bit d'entrée vaut ``0``, elle retourne ``0``. Cette fonction sera très fréquemment utilisée pour construire des circuits électroniques utilisés dans les ordinateurs. 

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
1   1 
=== ============



=== ============
x   Toujours1(x) 
--- ------------
0   0 
1   1
=== ============


La logique booléenne devient nettement plus intéressante lorsque l'on considère des fonctions qui prennent plus d'une entrée.



Fonctions booléennes à deux entrées 
------------------------------------

Plusieurs fonctions booléennes classiques existent. Les premières correspondent
à la conjonction (`et`) et la disjonction (`ou`) en logique. Commençons par
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

Ces fonctions peuvent être combinées entre elles. Un premier exemple est d'appliquer un inverseur (opération `NOT` au résultat de la fonction `AND`). Cette fonction booléenne s'appelle généralement `NAND` (`NOT AND`) et sa table de vérité est la suivante. On pourra dire que :math:`NAND(x,y) \iff NOT(AND(x,y)`. 

=== = =========
x   y NAND(x,y) 
--- - ---------
0   0 1 
0   1 1 
1   0 1 
1   1 0 
=== = =========


De même, la fonction `NOR` s'obtient en inversant le résultat de la fonction `OR`. On pourra dire que :math:`NOR(x,y) \iff NOT(OR(x,y)`. 


=== = ========
x   y NOR(x,y) 
--- - --------
0   0 1 
0   1 0 
1   0 0 
1   1 0 
=== = ========

Il est important de noter que `NOR(x,y)` n'est pas équivalent à la fonction `OR(NOT(x),NOT(y))`. La deux table de vérité de cette dernière fonction est reprise ci-dessous.

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




.. TODO Exercices inginious sur les fonctions booléenes 

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

=== = =======
x   0 OR(0,x) 
--- - -------
0   0    0
1   0    1
=== = =======

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



 - :math:`AND(x,y) \iff AND(y,x)` (commutativité)
 - :math:`OR(x,y) \iff OR(y,x)` (commutativité)
 - :math:`AND(x,AND(y,z)) \iff AND(AND(x,y),z)`  (associativité)
 - :math:`OR(x,OR(y,z)) \iff OR(OR(x,y),z)` (associativité)

Ces lois d'associativité sont importantes car elles vont nous permettre de facilement construire des fonctions booléennes qui prennent un nombre quelconque d'entrées en utilisant des fonctions à deux entrées comme brique de base.

 - :math:`AND(x,OR(y,z)) \iff OR( AND(x,y), AND(x,z) )` (distributivité)
 - :math:`OR(x,AND(y,z)) \iff AND( OR(x,y), OR(x,z) )` (distributivité) 


   
 - :math:`AND(x,OR(NOT(x),y) \iff AND(x,y)`
 - :math:`OR(x,AND(NOT(x),y) \iff OR(x,y)`  

   
Enfin, les trois opérations `AND`, `OR` et `NOT` sont reliées entre elles par les lois de `De Morgan`. On peut facilement démontrer, par exemple en utilisant des tables de vérité, que:

 - `NOT( OR(x,y) ) = AND ( NOT(x), NOT(y) )`
 - `NOT( AND(x,y) ) = OR ( NOT(x), NOT(y) )`

Ce lois sont très utiles lorsque l'on doit manipuler des fonctions booléennes. 


.. todo: exercices de simplification d'expressions

.. de https://www.tutorialspoint.com/discrete_mathematics/simplification_of_boolean_functions.htm

.. F(x,y,z)=OR( AND(NOT(x),y), AND(y,NOT(z)), AND(y,z), AND(x,NOT(y),NOT(z)) )
.. solution: OR( y, AND(x,NOT(z) )


.. F(x,y,z)= AND(OR(x,y), OR(x,z) )
.. solution: OR(x, AND(y,z) )


.. exemple https://www.ssucet.org/~jgallaher/download/ETEC2301-ProgrammableLogic/Chapter4-BooleanAlgebraAndLogicSimplification.pdf

.. OR( x, AND(x,y), AND(x, NOT(y), z)) -> x
.. OR( AND(x,y), AND(x,OR(y,z)), AND(y,(OR(y,z))) )

.. attention à des sites tels que http://www.bool-simplifier.com   
   
.. trouver une petite dizaine d'exemple de simplification, voir comment les faire sur inginious autrement qu'avec des QCMs, pas sur que ce soit facile

   

Fonctions booléennes à plus de deux entrées
-------------------------------------------

En utilisant les lois de distributivité, on peut facilement construire des fonctions à plus de deux entrées. Ainsi, la fonction `AND` à trois entrées :math:`AND(x,y,z) \iff AND(X,AND(y,z)) \iff AND(AND(x,y),z)`. Sa table de vérité est sans surprise la suivante.


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

De la même façon, on peut obtenir la fonction `OR` à plus de deux entrées: :math:`OR(x,y,z) \iff OR(X,OR(y,z)) \iff OR(OR(x,y),z)`.




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

En appliquant les lois de De Morgan, il est aussi possible de construire la fonction `OR` en se basant uniquement sur la fonction `NAND`. En effet, on remarque que  `NAND(x,y) = OR ( NOT(x), NOT(y) )`. Calculons donc la table de vérité de `NAND( NOT(x), NOT(y) )`.

=== = ========= ========= ============================
x   y NAND(x,x) NAND(y,y) NAND( NAND(x,x), NAND(y,y) )
--- - --------- --------- ----------------------------
0   0     1         1                 1
0   1     1         0                 1 
1   0     0         1                 1 
1   1     0         0                 0 
=== = ========= ========= ============================


On est presque à celle de la fonction `OR`. Il suffit en effet d'inverser son résultat pour obtenir la fonction `OR`. Donc, :math:`NAND( NAND( NAND(x,x), NAND(y,y) ), NAND( NAND(x,x), NAND(y,y) )) \iff OR(x,y)`.



Synthèse de fonctions booléennes
================================

L'intérêt des fonctions booléennes est qu'il est possible de concevoir des fonctions booléennes pour supporter n'importe quelle table de vérité. Prenons comme exemple la fonction `DIFF` qui retourne `1` lorsque ses deux entrées sont différentes et `0` sinon. Sa table de vérité est reprise ci-dessous.

= = =========
x y DIFF(x,y)
- - ---------
0 0    0
0 1    1
1 0    1
1 1    0
= = =========

Pour réaliser une telle fonction, il suffit de se trouver une combinaison de fonctions `AND`, `OR` et `NOT` qui produit la même table de vérité. Une façon mécanique de produire cette fonction est de remarquer que la sortie d'une fonction `AND` ne vaut `1` que lorsque ses deux entrées sont à `1`. Examinons la deuxième ligne de la table de vérité de la fonction `DIFF`. Celle-ci indique que cette fonction doit valoir `1`  lorsque `x` vaut `0` et `y` vaut `1`. Avec des fonctions `AND` et des inverseurs, on peut obtenir les tables de vérité suivantes:

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


Deux de ces fonctions  `AND` peuvent être combinées avec un fonction `OR`. Un premier exemple est de combiner les deux premières fonction,  `AND(x,y)` et `AND(NOT(x),y)` pour construire la fonction `OR(AND(x,y),AND(NOT(x),y)`. Sa table de vérité est la suivante.

= = =========================
x y OR(AND(x,y),AND(NOT(x),y) 
- - -------------------------
0 0    0 
0 1    1 
1 0    0 
1 1    1 
= = =========================

On remarque aisément que la fonction combinée vaut `1` uniquement lorsque `x` vaut `1` et `y` vaut `1` ou lorsque `x` vaut `0` et `y` vaut `1`.

En revenant à notre fonction `DIFF`, on se rend aisément compte qu'elle doit valoir `1` dans uniquement deux cas:
 - `x` vaut `1` et `y` vaut `0`
 - `x` vaut `0` et `y` vaut `1`
   
Dans tous les autres cas, la fonction `DIFF` doit retourner `0`. Le premier cas peut s'implémenter en utilisant la fonction `AND(x,NOT(y))` tandis que le second correspond à la fonction `AND(NOT(x),y)`. Ces deux fonctions peuvent se combiner comme suit: `OR(AND(x,NOT(y)), AND(NOT(x),y))`. En construisant la table de vérité, on se convainc facilement que :math:`OR(AND(x,NOT(y)), AND(NOT(x),y)) \iff DIFF(x,y)`.

En pratique, il est possible de construire n'importe quelle fonction booléenne en combinant avec la fonction `OR`, autant de fonctions `AND` qu'il y a de lignes de la table de vérité dont la sortie vaut `1`.

A titre d'exemple, considérons la fonction


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



Représentations graphiques
==========================


Lorsque l'on travaille avec des fonctions booléennes, on peut soit utiliser les symboles comme `AND`, `OR`, `NOT`, soit utiliser des symboles graphiques. Ceux-ci sont très utilisés pour construire de petits circuits. Les principaux sont repris dans 

.. tikz:: Représentation graphique d'une fonction NOT 
   :libs:  circuits.logic.US 

   [tiny circuit symbols, every circuit symbol/.style={fill=white,draw}]
   \node (x) at (0.5,0) {$x$};
   \node (out) at (3,0) {};
   \node [not gate US, draw] (nx)  at ($(x) +(1,0)$) {$NOT$};
   \draw (x) -- (nx);
   \draw (nx) -- (out);
   
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


Dans de nombreux circuits, on retrouve des inverseurs. Ainsi, la fonction `NAND` est finalement une fonction  `AND` suivie d'un inverseur. Cette inversion est symbolisée par un petit rond. Il en va de même pour la fonction `NOR`.    


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


Il est évidemment possible de combiner plusieurs fonctions booléennes pour supporter des fonctions plus avancées. A titre d'exemple, considérons la fonction d'égalité qui vaut `1` lorsque ses deux entrées sont égales et `0` sinon. Voici sa table de vérité.


= = =======
x y EQ(x,y)
- - -------
0 0    1
0 1    0
1 0    0
1 1    1
= = =======


Cette fonction peut être réalisée en utilisant deux fonctions `AND`, une fonction `OR` et des inverseurs.

.. source de l'exemple https://tex.stackexchange.com/questions/540918/adding-dots-to-a-circuit-latex
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

Un autre exemple est la fonction `XOR` dont nous avons déjà parlé précédemment. Celle-ci peut s'implémenter en utilisant deux inverseurs, deux fonctions `AND` et une fonction `OR`.

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


   \node[or gate US, draw, logic gate inputs=nn, scale=1] at ($(t2.output) + (2, 0.5)$) (orTot) {$XOR(x,y)$};

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


..   \node (out) at $(orTot.output+(1,0))$ {};

..   \draw (orTot.output) -- (out);


.. todo: exercices inginious pour la reconnaissance de ces fonctions logiques et construction de tables de vérité. Probablement uniquement faisable sous la forme de table de vérité    
 
Un langage de description de circuits logiques
==============================================


Les représentations graphiques sont très utiles pour permettre à des électroniciens de discuter de circuits électroniques, mais de nos jours ils travaillent généralement en utilisant des langages informatiques qui permettent de décrire ces circuits électroniques sous la forme de commande. L'avantage de ces langages est qu'ils peuvent facilement être utilisés dans des logiciels de simulations ou d'analyse de circuits. C'est ce que nous ferons dans le cadre de ce cours avec le langage HDL proposé par les auteurs du livre `Building a Modern Computer from First Principles <https://nand2tetris.org>`_.


.. todo: exercices inginious pour construire des circuits simples en partie lié au premier projet pour qu'ils puissent avancer dans ce projet sans trop de difficultés et le réussir


   .. faire une description du langage en français avec des exemples


Premier projet
==============

Multiplexeur

= = === ===
x y sel out 
- - --- ---
0 0  0   0 
0 1  0   0 
1 0  0   0 
1 1  0   0 
0 0  1   1 
0 1  1   1 
1 0  1   1 
1 1  1   1 
= = === ===

=== ===
sel out
--- ---
 0   x
 1   y
=== ===

Démultiplexeur

=== === = =
in  sel x y 
--- --- - - 
 0   0  0 0 
 0   1  0 0 
 1   0  1 0 
 1   1  0 1
=== === = =

