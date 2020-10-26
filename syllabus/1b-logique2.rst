Préparation au premier projet
=============================

Maintenant que nous avons vu les fonctions logiques de base, nous pouvons nous préparer à construire les circuits qui seront les briques de base d'un microprocesseur. Avant cela, il nous reste deux concepts importants à discuter.


Durant la première semaine, nous avons vu comment une fonction booléenne pouvait traiter des entrées valant `0` ou `1`. Souvent, les circuits électroniques sont amenés à traiter plusieurs données simultanément. Le livre appelle ces circuits les circuits "multi-bits".

L'autre point que nous devons aborder sont les fonctions primitives. Durant la première semaine, nous avons travaillé avec `AND`, `OR` et `NOT`. Ces fonctions sont faciles à comprendre et utiliser. Pour des raisons technologies, les circuits électroniques n'utilisent pas ces fonctions comme des fonctions primitives mais plutôt les fonctions `NAND` ou `NOR` dans certains cas. Nous verrons que la fonction `NAND` est une fonction primitive qui permet d'implémenter n'importe quelle fonction booléenne.


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

Premier projet
--------------

Votre premier projet dans le cadre de ce cours est de construire les circuits de base de l'on retrouve dans tout ordinateur en utilisant exclusivement des fonctions `NAND`. Ces circuits sont:

 - `NOT` (une entrée), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Not
 - `AND` (deux entrées), voir https://inginious.info.ucl.ac.be/course/LSINC1102/And
 - `OR` (deux entrées), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Or
 - `XOR` (deux entrées), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Xor  
 - Multiplexeur (deux entrées et sélecteur), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Mux
 - Démultiplexeur (une entrée et sélecteur, une sortie), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Dmux

Construisez ces différents circuits dans l'ordre indiqué en réutilisant pour chaque circuit votre circuit précédent.
   
Dans la suite du cours, vous devrez aussi utiliser des circuits qui manipulent des mots de 16 bits. Vous devez donc construire les circuits :

 - `NOT16` (16 entrées et 16 sorties), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Not16
 - `AND16` (16 entrées et 16 sorties), voir https://inginious.info.ucl.ac.be/course/LSINC1102/And16
 - `OR16` (16 entrées et 16 sorties), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Or16
 - Multiplexeur16 (2 fois 16 entrées, un sélecteur et 16 sorties), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Mux16

En outre, vous devez également construire les circuits suivants:

 - une fonction `OR` avec 8 entrées et une sortie (`Or8Way`), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Or8Way
 - un multiplexeur avec 4 entrées sur 16 bits, un sélecteur sur 2 bits et 16 sorties (`Mux4Way16`), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Mux4Way16
 - un multiplexeur avec 8 entrées sur 16 bits, un sélecteur sur 3 bits et 16 sortie (`Mux8Way16`), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Mux8Way16
 - un démultiplexeur une entrée sur 16 bits, un sélecteur sur 2 bits et 4 sorties sur 16 bits (`DMux4Way`), voir https://inginious.info.ucl.ac.be/course/LSINC1102/DMux4Way
 - un démultiplexeur une entrée sur 16 bits, un sélecteur sur 3 bits et 8 sorties sur 16 bits (`DMux8Way`), voir https://inginious.info.ucl.ac.be/course/LSINC1102/DMux8Way
   
   
Ce projet est également décrit en ligne sur le site `nand2tetris.org/project01 <https://www.nand2tetris.org/project01>`_.

La date limite pour ce projet est fixée au lundi 12 octobre 2020 à 18h00. Vous devez déposer toutes vos solutions aux exercices pour cette date sur https://inginious.info.ucl.ac.be/course/LSINC1102/ Vous aurez un retour sur votre projet durant la séance de travaux pratiques du vendredi 16 octobre 2020.
