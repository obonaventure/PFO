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

    
