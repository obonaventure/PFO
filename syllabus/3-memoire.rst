

Mémoire
=======


Dans les deux chapitres précédents, nous avons travaillé sur des fonctions :index:`combinatoires`, c'est-à-dire des fonctions dont le résultat dépend uniquement de leurs entrées et celles-ci sont supposées comme étant stables. Nous devons maintenant aller plus loin en résoudre deux problèmes différents:

 - Comment stocker de l'information dans une mémoire ?
 - Comment utiliser cette information pour réaliser des opérations arithmétiques et logiques ?


Le comportement d'un ordinateur est rythmé par une :index:`horloge`. Cette horloge est un signal binaire dont la valeur évolue de façon :index:`périodique`. Un tel signal d'horloge (`clock` en anglais) est représenté dans la figure ci-dessous. Il passe périodiquement de la valeur `1` à l a valeur `0`.

.. tikz:: Signal d'horloge d'un ordinateur

          \draw[thick,->] (0,0) -- (5,0) node[anchor=north east] {temps};
          
          \foreach \tick in {0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5}
          \draw [dotted,-] (\tick, 0) -- (\tick, -3) node [below] {};

          \foreach \y in {-1}
           \foreach \tick in {0,1,2,3,4}
           \draw [thick,color=blue,-] (\tick, \y) -- (\tick+0.5, \y )
                           (\tick+0.5, \y ) -- (\tick+0.5, \y-0.5 )
                           (\tick+0.5, \y-0.5 ) -- (\tick+1, \y-0.5 )
                           (\tick+1, \y-0.5 ) -- (\tick+1, \y );
                           
          \node [color=blue] at (-0.5,-1) {Clock};
          \node [color=blue] at (5.5,-1) {1};
          \node [color=blue] at (5.5,-1.5) {0};
          
Ce signal d'horloge va jouer un rôle très important dans tout ordinateur. D'un côté, c'est lui qui va rythmer toutes les opérations réalisées par l'ordinateur. Le résultat d'une telle opération ne sera disponible qu'à la fin de la période d'horloge, par exemple où moment où le signal d'horloge passe de la valeur `0` à la valeur `1`. Ce signal d'horloge va nous servir à contrôler le fonctionnement des dispositifs de mémoire que nous verrons très bientôt. Il peut aussi être utilisés directement dans des fonctions logiques telles que nous les avons utilisées dans les deux chapitres précédents.

A titre d'exemple, considérons une fonction `AND` dont la première entrée est l'horloge et la seconde le signal `x` représenté dans la figure ci-dessous.

.. tikz:: Une fonction AND connectée à une horloge 

          \node [color=blue] at (0,1) (clock) {Clock};
          \node [color=red] at (0,0.5) (x) {x};
          \node [color=black] at (3,0.75) (out) {out};
                
          \node[and gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at (2,0.75) (and) {};
          \draw [->] (clock) -- (and.input 1);
          \draw [->] (x) -- (and.input 2);
          \draw [->] (and.output) -- (out);
          
          \draw[thick,->] (0,0) -- (5,0) node[anchor=north east] {temps};
          
          \foreach \tick in {0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5}
          \draw [dotted,-] (\tick, 0) -- (\tick, -5) node [below] {};

          \foreach \y in {-1}
           \foreach \tick in {0,1,2,3,4}
           \draw [thick,color=blue,-] (\tick, \y-0.5 ) -- (\tick, \y) -- (\tick+0.5, \y )
                           (\tick+0.5, \y ) -- (\tick+0.5, \y-0.5 )
                           (\tick+0.5, \y-0.5 ) -- (\tick+1, \y-0.5 )
                           (\tick+1, \y-0.5 );
                           
          \node [color=blue] at (-0.5,-1) {Clock};
          \node [color=blue] at (5.5,-1) {1};
          \node [color=blue] at (5.5,-1.5) {0};

          \node [color=red] at (-0.5,-2) {x};
          \draw [thick, color=red,-] (0,-2) -- (2,-2) -- (2,-2.5) -- (4,-2.5) -- (4,-2)  -- (5,-2) {};
          \node [color=red] at (5.5,-2) {1};
          \node [color=red] at (5.5,-2.5) {0};

          
           \node [color=black] at (-0.5,-3) {out};
                     
           \foreach \y in {-3}
           \foreach \tick in {0,1,4}
           \draw [thick,color=black,-] (\tick, \y-0.5) -- (\tick, \y) -- (\tick+0.5, \y )
                           (\tick+0.5, \y ) -- (\tick+0.5, \y-0.5 )
                           (\tick+0.5, \y-0.5 ) -- (\tick+1, \y-0.5 )
                           (\tick+1, \y-0.5 );
            \foreach \y in {-3} \draw [thick, color=black,-] (2, \y-0.5) -- (4,\y -0.5) ;


Dans la suite de ce chapitre, nous distinguerons entre deux types de circuits:
  - les circuits purement combinatoires dans lesquels la sortie ne dépend que des entrées présentes
  - les circuits :index:`séquentiels` dans lesquels la sortie dépend des entrées présentes *et* de l'état du circuit, c'est-à dire de calculs effectués par les passé.

.. mémoire RAM versus mémoire ROM

Il existe deux grands types de mémoires : les mémoires :index:`RAM` pour Random Access Memory et les mémoires :index:`ROM` pour Read-Only Memory. Conceptuellement, la mémoire ROM est la plus simple puisqu'une même information est associée à chaque adresse en mémoire. Une mémoire :index:`ROM` pourrait être construire sur base d'une table de vérité en utilisant des portes `AND`, `OR` et `NOT`. En pratique, les mémoires ROM sont construites de façon plus efficace.

Les mémoires RAM ont comme caractéristique de pouvoir 

.. tikz:: Représentation graphique d'un flip-flop SR AND-OR
   :libs:  circuits.logic.US 

   [tiny circuit symbols, every circuit symbol/.style={fill=white,draw}]

   \node [or gate US, draw] (or) at (0,0) {};
   \node [and gate US,draw] (and) at ($(or.output) + (1,-0.5)$) {};
   
   \node (s) at ($(or.input 2) + (-1,0)$) {$S$}; 
   \node (q) at ($(and.output) + (2,0)$)  {$Q$}; 
   \draw (s) -- (or.input 2);

   \node [not gate US,draw] (not) at  ($(and.input 2) + (-1,0)$) {};
   \node (r) at ($(not) + (-1,0)$)  {$R$}; 
   \draw (r) -- (not.input);           
   \draw (not.output) -- (and.input 2);
   
   \draw (or.output) -- (and.input 1);
   \draw (and.output) -- ($(and.output) + (0.5,0)$) -- ($(and.output) + (0.5,1)$) --  ($(and.output) + (-2.5,1)$) -- ($(or.input 1) + (-0.5,0)$) -- (or.input 1); 

   \draw ($(and.output) + (0.5,0)$) -- (q);


Ce circuit très simple utilise une port `AND` et une porte `OR`. Il comporte deux  entrées : `S` et `R` et a comme sortie `Q`. Pour analyser le comportement de ce circuit, commençons par discuter de ce qu'il se passe lorsque `S` et `R` valent `0`. Dans ce cas, la sortie de la porte `OR` vaut la valeur de `Q`. Il en va de même pour celle de la sortie de la porte `AND` puisque sa deuxième entrée est mise à `1`. Quelle que soit la valeur initiale de `Q`, celle-ci est conservée lorsque `R` et `S` valent `0`.

Essayons maintenant de faire passer `S` à la valeur `1` tout en gardant `R` à `0`. Si `Q` valait initialement `0`, alors la sortie `Q` passe à `1` et cette valeur reste stable. Si `Q` valait initialement `1`, alors sa valeur reste à `1`. On utilise généralement le nom `Set` pour l'entrée `S` car elle permet de faire passer la valeur de `Q` à `1`.

Analysons maintenant ce qu'il se passe si `R` passe à `1`. Dans ce cas, la sortie `Q` va nécessairement passer à `0` puisque la seconde entrée de la porte `AND` est mise à `0`. Cette valeur restera quelle que soit la valeur de `S`  (`0` ou `1`). La deuxième entrée de ce flip-flop est généralement appelée l'entrée `Reset` car elle force une mise à zéro de la sortie. Il est important de noter que la valeur de `Q` reste conservée par le flip-flop lorsque `R` et `S` valent `0`.

.. avec une horloge ?

   


Cet élément de mémoire peut s'implémenter en utilisant des solutions technologiques très différentes. Une première solution est le :index:`flip-flop SR`. Ce circuit utilise deux portes `NOR` et a deux entrées : `R` et `S`. Une caractéristique importante de ce circuit est qu'il existe une boucle entre la sortie d'un porte `NOR` et l'entrée de l'autre porte. Par ce circuits, `R` et `S` sont les entrées tandis que `Q` et :math:`\overline{Q}` sont les sorties

Ce circuit est assez inhabituel. N'essayez pas de le tester avec le simulateur du livre. Par contre, il est intéressant d'analyser comment ce circuit fonctionne.

Commençons par analyser le cas où `R` et `S` valent `0`. Supposons qu'initialement `Q` valait `0` et :math:`\overline{Q}` valait `1`. Dans ce cas, la sortie de la port `NOR` supérieure reste à `0` tandis que la sortie de la porte `NOR` inférieure reste à `1`. Si par contre `Q` valait `1` et :math:`\overline{Q}` valait `0`, alors `Q` reste à `1` et :math:`\overline{Q}` reste à `0`. On dit que lorsque `R` et `S` valent `0`, la sortie du flip-flop reste stable. Cela revient à dire que notre flip-flop garde sa valeur.


Regardons maintenant ce qu'il se passe lorsque `R` vaut `1` tandis que `S` reste à `0`. Si `Q` valait initialement `1` tandis que :math:`\overline{Q}` valait `0`, alors la sortie de la porte `NOR` supérieure va passer à `0`.  Cette valeur va revenir dans la porte `NOR` inférieure et forcer un passage à `1` de la sortie :math:`\overline{Q}`. Lorsque cette sortie revient dans la porte `NOR` supérieure, elle force sa sortie à `0`. Si `Q` valait initialement `0` (et :math:`\overline{Q}` valait `1`), rien ne change.
On dit que l'entrée `R` est l'entrée `Reset` car elle permet de forcer la sortie `Q` à passer à `0`.


Regardons maintenant ce qu'il se passe lorsque `R` reset à `0` tandis que `S` passe à `0`. Si `Q` valait initialement `0` tandis que :math:`\overline{Q}` valait `1`, alors la sortie de la porte `NOR` supérieure va passer à `1`.  Cette valeur va revenir dans la porte `NOR` inférieure et forcer un passage à `0` de la sortie :math:`\overline{Q}`. Lorsque cette sortie revient dans la porte `NOR` supérieure, elle force sa sortie à `1`. Si `Q` valait initialement `1` (et :math:`\overline{Q}` valait `0`), rien ne change.
On dit que l'entrée `S` est l'entrée `Set` car elle permet de forcer la sortie `Q` à passer à `1`.

Lorsque `R` et `S` valent simultanément `1`, les sorties `Q` et :math:`\overline{Q}` passent à `0` toutes les deux.
    
.. _fig--sr-nor:   
.. tikz:: Représentation graphique d'un flip-flop SR utilisant des portes NOR 
   :libs:  circuits.logic.US 

   [tiny circuit symbols, every circuit symbol/.style={fill=white,draw}]
   
   \node (r) at (0,0) {$R$}; 
   \node (s) at (0,-1.7) {$S$}; 

   \node [nor gate US, draw] (nor1)  at ($(r) +(1.5,-0.2)$)  {}; 
   \node [nor gate US, draw] (nor2)  at ($(r) +(1.5,-1.2)$)  {}; 
   \draw (r) -- (nor1.input 1); 
   \draw (s) -- (nor2.input 2); 
   \draw (nor1.output) -- ($(nor1.output) + (0.5,0)$) -- ($(nor2.input 1) + (-0.5,0)$) -- (nor2.input 1) ; 
   \draw (nor2.output) -- ($(nor2.output) + (0.5,0)$) -- ($(nor1.input 2) + (-0.5,0)$) -- (nor1.input 2); 
   
   \node (q) at ($(nor1.output) + (1,0)$) {$Q$}; 
   \node (qb) at ($(nor2.output) + (1,0)$) {$\overline{Q}$}; 
   \draw ($(nor2.output) + (0.5,0)$) -- (qb); 
   \draw  ($(nor1.output) + (0.5,0)$) -- (q);


Exercices   
_________


1. Il est aussi possible de construire le flip-flop SR AND-OR en connectant la sortie `Q` à la sortie de la porte `OR`. Quel est le comportement de ce flip-flop dans ce cas ?

.. _fig-sr-and-or2:
.. tikz:: Variante du flip-flop SR AND-OR
   :libs:  circuits.logic.US 

   [tiny circuit symbols, every circuit symbol/.style={fill=white,draw}]

   \node [or gate US, draw] (or) at (0,0) {};
   \node [and gate US,draw] (and) at ($(or.output) + (1,-0.5)$) {};
   
   \node (s) at ($(or.input 2) + (-1,0)$) {$S$}; 
   \node (q) at ($(and) + (0,0.5)$)  {$Q$}; 
   \draw (s) -- (or.input 2);

   \node [not gate US,draw] (not) at  ($(and.input 2) + (-1,0)$) {};
   \node (r) at ($(not) + (-1,0)$)  {$R$}; 
   \draw (r) -- (not.input);           
   \draw (not.output) -- (and.input 2);
   
   \draw (or.output) -- (and.input 1);
   \draw (and.output) -- ($(and.output) + (0.5,0)$) -- ($(and.output) + (0.5,1)$) --  ($(and.output) + (-2.5,1)$) -- ($(or.input 1) + (-0.5,0)$) -- (or.input 1); 

   \draw (or.output) -- (q);

2. Le flip-flop SR peut-être construit en utilisant des portes `NOR` comme présenté ci-dessus. Il est aussi possible de construire un circuit du même type avec des portes `NAND` (:numref:`fig-sr-nand`). Expliquez le fonctionnement de ce circuit.

.. _fig-sr-nand:   
.. tikz:: Représentation graphique d'un flip-flop SR utilisant des portes NOR 
   :libs:  circuits.logic.US 

   [tiny circuit symbols, every circuit symbol/.style={fill=white,draw}]
   
   \node (r) at (0,0) {$\overline{S}$}; 
   \node (s) at (0,-1.7) {$\overline{R}$}; 
  
   \node [nand gate US, draw] (nor1)  at ($(r) +(1.5,-0.2)$)  {}; 
   \node [nand gate US, draw] (nor2)  at ($(r) +(1.5,-1.2)$)  {}; 
   \draw (r) -- (nor1.input 1); 
   \draw (s) -- (nor2.input 2); 
   \draw (nor1.output) -- ($(nor1.output) + (0.5,0)$) -- ($(nor2.input 1) + (-0.5,0)$) -- (nor2.input 1) ; 
   \draw (nor2.output) -- ($(nor2.output) + (0.5,0)$) -- ($(nor1.input 2) + (-0.5,0)$) -- (nor1.input 2); 
   
   \node (q) at ($(nor1.output) + (1,0)$) {$Q$}; 
   \node (qb) at ($(nor2.output) + (1,0)$) {$\overline{Q}$}; 

   \draw ($(nor2.output) + (0.5,0)$) -- (qb); 
   \draw  ($(nor1.output) + (0.5,0)$) -- (q);
    
Exercices
_________

Les fonctions suivantes sont-elles combinatoires ou séquentielles ? Justifiez votre réponse.

 - le poids d'un être humain en fonction du nombre de calories ingurgitées chaque jour
 - le

   ..todo


Element de mémoire
------------------

Le livre considère le :index:`flip-flop D` comme élement de base de la mémoire. Ce circuit, qui peut se construire en utilisant des circuits logiques de base comme nous le verrons très bientôt. Un flip-flop est un circuit qui a deux entrées:
 - un signal binaire à mémoriser
 - un signal d'horloge

La valeur du signal binaire à mémoriser est stockée dans le flip-flop au moment où le signal d'horloge prend la valeur `1`.

Schématiquement, le flip-flop peut se représenter comme ci-dessous.


.. tikz:: Un flip-flop D

   \node at ( 0,0) (in) {in};
   \node at (4,0) (out) {out};
   \node at (2,-1.5) (clock) {clock};
   \draw[draw=black] (1,-0.5) -- (1,0.5) -- (3,0.5) -- (3,-0.5) -- (1,-0.5) -- cycle;
   \draw [draw=black] (1.9,-0.5) -- (2, -0.4) -- (2.1,-0.5);
   \draw [->] (in) -- (1,0);
   \draw [->] (3,0) -- (out);
   \draw [->] (clock) -- (2,-0.5);


Le fonctionnement du flip-flop dépend du signal d'horloge. A l'instant `t`, la sortie `out` du flip-flop vaut la valeur du signal `in` à l'instant `t-1`.

    
