.. include:: defs.rst

.. spelling:word-list::

   Evolution
   Eléments

Mémoire
=======


Dans les deux chapitres précédents, nous avons travaillé sur des fonctions :index:`combinatoires`, c'est-à-dire des fonctions dont le résultat dépend uniquement de leurs entrées. C'est une simplification de la réalité. Dans un circuit électronique, c'est un signal électrique qui représente les valeurs `0` et `1`. Il y a différentes façons de représenter des valeurs binaires avec un signal électrique. Une des plus simples est de convenir d'utiliser un potentiel positif, par exemple `+5V` pour représenter la valeur binaire `1` et `0V` pour la valeur zéro. La :numref:`fig-signal` représente un tel signal électrique qui vaut initialement `1`, puis passe pendant un certain temps à `0` avant de revenir à la valeur `1`.


.. _fig-signal:
.. tikz:: Signal électrique

          \draw[thick,->] (0,0) -- (5,0) node[anchor=north east] {temps};
          
          \draw [thick,color=blue,-](0, -1) -- (2, -1) -- (2,-1.5) -- (4, -1.5) -- (4,-1) -- (5,-1);
                           
          \node [color=blue] at (-0.5,-1) {A};
          \node [color=blue] at (5.5,-1) {+5V};
          \node [color=blue] at (5.5,-1.5) {0V};

Un tel signal électrique ne se propage pas instantanément dans un circuit électronique. En pratique, il circule à une vitesse proche de celle de la lumière. A titre d'illustration, considérons que ce signal se propage à une vitesse de 200.000 km/sec. Cela implique que le signal parcourt 1 mètre en 5 nanosecondes.


.. note:: Unités de mesure du temps

   En informatique, on doit souvent manipuler des fractions de secondes. Il est important de bien connaître les fractions standard de la seconde.

   =================  ===============   =================
   nom                abréviation       durée en secondes
   -----------------  ---------------   -----------------
   seconde            :math:`s`         :math:`1`
   milliseconde       :math:`ms`        :math:`10^{-3}`
   microseconde       :math:`\mu{}s`    :math:`10^{-6}`
   nanoseconde        :math:`ns`        :math:`10^{-9}`
   picoseconde        :math:`ps`        :math:`10^{-12}`
   =================  ===============   =================

   
Dans un circuit électronique, il n'est pas impossible que le signal dans deux parties du circuit suive des chemins de longueurs différentes. Considérons la situation représentée en :numref:`fig-and-elec`. Imaginons que le signal `C` doit parcourir un chemin plus long que celui des signaux `A` et `B`. Initialement, les signaux `A` et `B` valent `0`. Après quelque temps, les signaux `A` et `C` passent à la valeur `1`, mais le signal `C` est un peu retardé par rapport au signal `A`. La :numref:`fig-abc` présente l'évolution de ces signaux et leur valeur juste avant les portes `AND` et `OR`. Remarquez que le signal `C` est un peu retardé par rapport au signal `A`. Le même raisonnement s'applique lorsque l'on prend en compte le fait qu'une porte logique ne réagit pas instantanément à une modification de son signal d'entrée.

.. _fig-and-elec:
.. tikz:: Un circuit simple à trois entrées

   [label distance=2mm, scale=2,
   connection/.style={draw,circle,fill=black,inner sep=1.5pt}
   ]
   
   \node (a) at (0.5,0) {$A$}; 
   \node (b) at (1,0) {$B$};
   \node (c) at (1.5,0) {$C$}; 

   \node[or gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at ($(c)+(0.4,-1)$) (t1) {};

   \node[and gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at ($(c)+(1,-1.5)$) (t2) {};
   
   
   \node (out) at ($(t2.output)+(1,0)$) {$out$}; 

   \draw (a) -- ($(a) + (0,-2.5)$);
   \draw (b) -- ($(b) + (0,-2.5)$);
   \draw (c) -- ($(c) + (0,-2.5)$);
      
   \draw (a) |- (t1.input 1) node[connection,pos=0.5]{}; 
   \draw (b) |- (t1.input 2) node[connection,pos=0.5]{};
   \draw (c) |- (t2.input 1) node[connection,pos=0.5]{}; 
   \draw (t1.output) |- (t2.input 2) node[connection,pos=0.5]{};


   \draw (t2.output) -- (out);


En analysant le signal de sortie (:numref:`fig-abc`), on remarque que les délais différents pour les signaux `A` et `B` ont provoqué un court changement de valeur dans le signal de sortie. Cela peut poser des problèmes si ce signal doit ensuite passer dans d'autres circuits et un seul processeur peut contenir des millions de portes logiques.
   
.. _fig-abc:
.. tikz:: Evolution des signaux d'entrée et de sortie

          \draw[thick,->] (0,0) -- (5,0) node[anchor=north east] {temps};
          
          \foreach \tick in {0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5}
          \draw [dotted,-] (\tick, 0) -- (\tick, -5) node [below] {};


          \draw [thick,color=blue,-] (0,-1.5) -- (2,-1.5) -- (2,-1) -- (5,-1);
          \draw [thick,color=orange,-] (0,-2.5) -- (5,-2.5);                    
          \draw [thick,color=green,-] (0,-3) -- (2.1,-3) -- (2.1,-3.5) -- (5,-3.5);
          \node [color=blue] at (-0.5,-1) {A}; 
          \node [color=blue] at (5.5,-1) {1}; 
          \node [color=blue] at (5.5,-1.5) {0};

          \node [color=orange] at (-0.5,-2) {B}; 
          \node [color=orange] at (5.5,-2) {1}; 
          \node [color=orange] at (5.5,-2.5) {0};

          \node [color=green] at (-0.5,-3) {C}; 
          \node [color=green] at (5.5,-3) {1}; 
          \node [color=green] at (5.5,-3.5) {0};

          \node [color=black] at (-0.5,-4) {out}; 
          \node [color=black] at (5.5,-4) {1}; 
          \node [color=black] at (5.5,-4.5) {0}; 

           \draw [thick,color=black,-] (0,-4.5) -- (2,-4.5) -- (2,-4) -- (2.1,-4) -- (2.1,-4.5) -- (5,-4.5); 

Le signal d'horloge
-------------------
	   
          
Pour éviter ces problèmes, la plupart des ordinateurs utilisent un signal d'horloge qui régule le fonctionnement des différents circuits qui sont utilisés. Ce signal d'horloge est un :index:`signal périodique`, c'est-à-dire un signal qui répète sa valeurs à des intervalles réguliers. Les fonctions trigonométriques sont des exemples de signaux périodiques. En informatique on travaille avec des signaux binaires. On dira qu'un signal :math:`S(t)` sera périodique si il existe un réel :math:`P` qui est tel que : :math:`\forall t, S(t+P) = S(t)`. :math:`P` est appelé la période du signal et s'exprime en secondes. La :numref:`fig-clock-signal` présente un exemple de signal binaire périodique aussi appelé signal d'horloge.

.. _fig-clock-signal:
.. tikz:: Signal d'horloge d'un ordinateur

          \draw[thick,->] (0,0) -- (5,0) node[anchor=north east] {temps};
          
          \foreach \tick in {0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5}
          \draw [dotted,-] (\tick, 0) -- (\tick, -2) node [below] {};

          \foreach \y in {-1}
           \foreach \tick in {0,1,2,3,4}
           \draw [thick,color=red,-] (\tick, \y-0.5) -- (\tick+0.5, \y-0.5 ) --
                           (\tick+0.5, \y ) -- (\tick+0.7, \y ) --
                           (\tick+0.7, \y-0.5 ) -- (\tick+1, \y-0.5);
                           
          \node [color=red] at (-0.5,-1) {Clock};
          \node [color=red] at (5.5,-1) {1};
          \node [color=red] at (5.5,-1.5) {0};

          \draw[thick,<->] (0.5,-0.7) -- (1.5, -0.7) node[above] {période}; 

La période d'un signal périodique s'exprime en secondes. Souvent, plutôt que de donner la période du signal on préfère indiquer sa fréquence. La fréquence (`f`) d'un signal est définie comme étant l'inverse de sa période : :math:`f = \frac{1}{P}`. Si la période est exprimée en secondes, alors la fréquence est exprimée en :index:`Hz` (Hertz, du nom du découvreur des ondes électromagnétiques). En pratique, on rencontrera plus fréquemment des fréquences exprimées en :math:`MHz` et :math:`GHz`. 

.. note:: Unités de mesure de la fréquence 


   =================  ===============   =======================
   fréquence          abréviation       durée d'une période (s) 
   -----------------  ---------------   -----------------------
   hertz              :math:`Hz`        :math:`1`
   kilohertz          :math:`kHz`       :math:`10^{-3}`
   Mégahertz          :math:`MHz`       :math:`10^{-6}`
   Gigahertz          :math:`GHz`       :math:`10^{-9}`
   Térahertz          :math:`THz`       :math:`10^{-12}`
   =================  ===============   =======================

   

Un tel signal d'horloge permet de contrôler le fonctionnement des circuits combinatoires en forçant ceux-ci à ne retourner leur résultat que lorsque le signal d'horloge est à la valeur `1`. Cela peut se réaliser en ajoutant simplement une porte `AND` qui est combinée avec le signal de sortie comme représenté en :numref:`fig-and-elec-clock`.
   
          
.. _fig-and-elec-clock:
.. tikz:: Un circuit simple à trois entrées contrôlé par une horloge

   [label distance=2mm, scale=2,
   connection/.style={draw,circle,fill=black,inner sep=1.5pt}
   ]
   
   \node (a) at (0.25,0) {$A$}; 
   \node (b) at (0.5,0) {$B$};
   \node (c) at (0.75,0) {$C$};
   \node [color=red] (clock) at (1.2,0) {$Clock$}; 

   \node[or gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at ($(clock)+(0.4,-1)$) (t1) {};

   \node[and gate US, draw, rotate=0, logic gate inputs=nn, scale=1] at ($(clock)+(1,-1.5)$) (t2) {};
   \node[and gate US, draw, color=red, rotate=0, logic gate inputs=nn, scale=1] at ($(clock)+(1.5,-2)$) (t3) {}; 
   
   
   \node (out) at ($(t3.output)+(1,0)$) {$out$}; 

   \draw (a) -- ($(a) + (0,-2.5)$);
   \draw (b) -- ($(b) + (0,-2.5)$);
   \draw (c) -- ($(c) + (0,-2.5)$);   
   \draw [color=red] (clock) -- ($(clock) + (0,-2.5)$);

   \draw (a) |- (t1.input 1) node[connection,pos=0.5]{}; 
   \draw (b) |- (t1.input 2) node[connection,pos=0.5]{};
   \draw (c) |- (t2.input 1) node[connection,pos=0.5]{}; 
   \draw [color=red] (clock) |- (t3.input 2) node[connection,color=red,pos=0.5]{}; 
   \draw (t1.output) |- (t2.input 2) node[connection,pos=0.5]{};
   \draw (t2.output) |- (t3.input 1) node[connection,pos=0.5]{};

   
   \draw (t3.output) -- (out);


Grâce à ce signal d'horloge et à la porte `AND` que nous avons ajoutés, nous pouvons maintenant observer (:numref:`fig-abc-clock`) que la valeur du signal de sortie (`out`) ne se modifie pas malgré le délai dans le signal `C`. En pratique, on choisira la période de l'horloge de façon à ce qu'elle soit supérieur à la différence de délais de propagation dans le circuit électronique. On veillera également à ce que le signal d'horloge lui-même soit acheminé suivant le chemin le plus court vers tous les circuits qu'il contrôle.
   
   
.. _fig-abc-clock:
.. tikz:: Evolution des signaux d'entrée et de sortie

          \draw[thick,->] (0,0) -- (5,0) node[anchor=north east] {temps};
          
          \foreach \tick in {0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5}
          \draw [dotted,-] (\tick, 0) -- (\tick, -6) node [below] {};


          \draw [thick,color=blue,-] (0,-1.5) -- (2,-1.5) -- (2,-1) -- (5,-1);
          \draw [thick,color=orange,-] (0,-2.5) -- (5,-2.5);                    
          \draw [thick,color=green,-] (0,-3) -- (2.1,-3) -- (2.1,-3.5) -- (5,-3.5);
          \node [color=blue] at (-0.5,-1) {A}; 
          \node [color=blue] at (5.5,-1) {1}; 
          \node [color=blue] at (5.5,-1.5) {0};

          \node [color=orange] at (-0.5,-2) {B}; 
          \node [color=orange] at (5.5,-2) {1}; 
          \node [color=orange] at (5.5,-2.5) {0};

          \node [color=green] at (-0.5,-3) {C}; 
          \node [color=green] at (5.5,-3) {1}; 
          \node [color=green] at (5.5,-3.5) {0};

          \node [color=black] at (-0.5,-5) {out}; 
          \node [color=black] at (5.5,-5) {1}; 
          \node [color=black] at (5.5,-5.5) {0};

          \foreach \y in {-4}
           \foreach \tick in {0,1,2,3,4}
           \draw [thick,color=red,-] (\tick, \y-0.5) -- (\tick+0.5, \y-0.5 ) --
                           (\tick+0.5, \y ) -- (\tick+0.7, \y ) --
                           (\tick+0.7, \y-0.5 ) -- (\tick+1, \y-0.5);
                           
          \node [color=red] at (-0.5,-4) {Clock};
          \node [color=red] at (5.5,-4) {1};
          \node [color=red] at (5.5,-4.5) {0};

           \draw [thick,color=black,-] (0,-5.5) -- (5,-5.5); 



L'horloge va jouer un rôle très important dans le fonctionnement des ordinateurs comme nous le verrons dans les prochains chapitres. Un autre élément essentiel du fonctionnement des ordinateurs est la possibilité de mémoriser une information. Si le fonctionnement de l'ordinateur est rythmé par un signal d'horloge, comment peut-on mémoriser une valeur binaire d'un cycle d'horloge à l'autre ?

La mémorisation d'un bit
------------------------

Le livre de référence construit cet élément de mémoire en démarrant d'un :index:`data flip-flop` (DFF). Ce DFF est un circuit qui prend deux entrées: `in` et un signal d'horloge et a une sortie : `out`. Ce circuit est conçu de façon à ce que sa sortie au cycle d'horloge `t` corresponde à la valeur de l'entrée au cycle d'horloge `t-1`. Ce circuit est représenté en :numref:`fig-dff`.



.. _fig-dff:
.. tikz:: Un data flip-flop

   \node at ( 0,0) (in) {in};
   \node at (4,0) (out) {out};
   \node [color=red] at (2,-1.5) (clock) {clock};
   \draw[draw=black] (1,-0.5) -- (1,0.5) -- (3,0.5) -- (3,-0.5) -- (1,-0.5) -- cycle;
   \draw [draw=black] (1.9,-0.5) -- (2, -0.4) -- (2.1,-0.5);
   \draw [->] (in) -- (1,0);
   \draw [->] (3,0) -- (out);
   \draw [color=red,->] (clock) -- (2,-0.5);
   \node [color=black] at (2,0) (dff) {DFF};


Pour comprendre le fonctionnement de ce circuit, il est intéressant d'analyser comment sa sortie évolue en fonction de son entrée et du signal d'horloge. Lorsque le signal d'entrée change, le signal de sortie attend le prochain cycle de l'horloge pour changer de valeur. On observe donc un décalage dans le temps entre le signal d'entrée et le signal de sortie.


.. _fig-dff-exemple:
.. tikz:: Data flip-flop - exemple 

          \draw[thick,->] (0,0) -- (5,0) node[above] {temps};
          
          \foreach \tick in {0.5,1.5,2.5,3.5,4.5}
          \draw [dotted,-] (\tick, 0) -- (\tick, -4) node [below] {};

          \draw [thick,color=blue,-] (0,-1.5) -- (1.5,-1.5) -- (1.5,-1) -- (2.5,-1) -- (2.5, -1.5) -- (3.5,-1.5) -- (3.5,-1) -- (5,-1);
  
          \node [color=blue] at (-0.5,-1) {in}; 
          \node [color=blue] at (5.5,-1) {1}; 
          \node [color=blue] at (5.5,-1.5) {0};

          \foreach \y in {-2}
           \foreach \tick in {0,1,2,3,4}
           \draw [thick,color=red,-] (\tick, \y-0.5) -- (\tick+0.5, \y-0.5 ) --
                           (\tick+0.5, \y ) -- (\tick+0.7, \y ) --
                           (\tick+0.7, \y-0.5 ) -- (\tick+1, \y-0.5);
                           
          \node [color=red] at (-0.5,-2) {Clock};
          \node [color=red] at (5.5,-2) {1};
          \node [color=red] at (5.5,-2.5) {0};
          
          \node [color=black] at (-0.5,-3) {out}; 
          \node [color=black] at (5.5,-3) {1}; 
          \node [color=black] at (5.5,-3.5) {0};
          
          \draw [thick,color=black,-] (0,-3.5) -- (2.5,-3.5) -- (2.5,-3) -- (3.5,-3) -- (3.5, -3.5) -- (4.5,-3.5) -- (4.5,-3) -- (5,-3);
          
          
Ce décalage est intéressant dans certains applications, mais il serait nettement plus utile de pouvoir mémoriser un bit d'informatique dans un flip-flop de ce type. On pourrait se dire que pour mémoriser une information pendant plusieurs cycles d'horloge, il suffira de prendre la sortie d'un data flip-flop et de la connecter à son entrée comme en :numref:`fig-bit-bad`. 
   

.. _fig-bit-bad:
.. tikz:: Un circuit pour mémoriser un bit ?
          
   [
   connection/.style={draw,circle,fill=black,inner sep=1.5pt}
   ]
          
   \node at ( 0,0) (in) {in};
   \node at (4,0) (out) {out};
   \node [color=red] at (2,-1.5) (clock) {clock};
   \draw[draw=black] (1,-0.5) -- (1,0.5) -- (3,0.5) -- (3,-0.5) -- (1,-0.5) -- cycle;
   \draw [draw=black] (1.9,-0.5) -- (2, -0.4) -- (2.1,-0.5);
   \draw [->] (in) -- (1,0) node[connection,pos=0.5] (in0) {};
   \draw [->] (3,0) -- (out)  node[connection,pos=0.5] (out0) {} ;
   \draw [color=red,->] (clock) -- (2,-0.5);
   \node [color=black] at (2,0) (dff) {DFF};
   \draw [->] (out0) -- ($(out0) + (0,-1)$) -- ($(in0) + (0,-1)$) -- (in0) ;
 
Malheureusement, un tel circuit pose deux problèmes. Premièrement, puisque sa sortie dépend avec un délai de son entrée, il n'est pas possible de le forcer à mémoriser une valeur donnée à un instant donné. Deuxièmement, au niveau électronique, il est compliqué de connecter deux signaux simultanément sur une entrée puisque cela revient à créer un court-circuit au niveau électrique ...

La solution pour résoudre ce problème est d'utiliser un multiplexeur en amont du flip-flop pour choisir entre le signal d'entrée `in` et le signal de sortie qui est bouclé comme entrée pour le flip-flop. Ce multiplexeur est commandé par un signal `load` qui permet de forcer le chargement du bit du signal `in` dans le flip-flop. Lorsque `load` vaut `1`, le signal `in` est mémorisé par le flip-flop durant le cycle d'horloge. Lorsque `load` vaut `0`, le flip-flop reçoit sa sortie en entrée et celle-ci est conservée pour le cycle d'horloge suivant. Ce registre est présenté en :numref:`fig-bit-registre`.

.. _fig-bit-registre:
.. tikz:: Un registre permettant de mémoriser un bit 
          
   [
   connection/.style={draw,circle,fill=black,inner sep=1.5pt}
   ]
          
   \node at (-2,0.25) (in) {in};
   \node at (4,0) (out) {out};
   \node [color=red] at (2,-1.5) (clock) {clock};
   \node [color=blue] at (-0.5,1) (load) {load};
   \draw [color=blue,->] (load) -- (-0.5,0.25);
   \node[color=blue] at (-0.9,0.25) {\tiny 1};
   \node[color=blue] at (-0.9,-0.25) {\tiny 0};
   
   \draw[draw=black] (1,-0.5) -- (1,0.5) -- (3,0.5) -- (3,-0.5) -- (1,-0.5) -- cycle;
   \draw [draw=black] (1.9,-0.5) -- (2, -0.4) -- (2.1,-0.5);

   \draw [draw=black] (-1,-0.5) -- (-1, 0.5) -- (0,0) -- cycle;
   
   \draw [->] (in) -- (-1,0.25) node[pos=0.5] (in0) {};
   \draw [->] (3,0) -- (out)  node[connection,pos=0.5] (out0) {} ;
   \draw [color=red,->] (clock) -- (2,-0.5);
   \node [color=black] at (2,0) (dff) {DFF};
   \draw [->] (out0) -- ($(out0) + (0,-1)$) -- (-1.5,-1) -- (-1.5, -0.25) -- (-1,-0.25) ;
   \draw [->] (0,0) -- (1,0);


Cette mémoire d'un bit va jouer un rôle très important dans la construction de tous les éléments de mémoire d'un ordinateur. Pour pouvoir la réutiliser dans d'autres circuits, nous allons lui choisir une représentation standard (:numref:`fig-bit`). 

.. _fig-bit:
.. tikz:: Une mémoire pour un bit
   :libs: calc,quotes
          
   \tikzset{
       bitr/.pic ={
       \coordinate (-out) at (.5,0.25);
       \coordinate (-in) at (0,0.25);
       \coordinate (-load) at (0.25,0.5);
       \draw (0,0) -- (0,0.5) -- (0.5,0.5) -- (0.5,0) -- cycle; 
       \draw [color=red, fill] (.2,0) -- (0.25,0.05) -- (0.3,0) -- cycle; 
       \node at (0.25,0.25) {\tiny \tikzpictext};
       }
   }


   \pic at (0,-0.25) (bit) [draw, pic text={Bit}] {bitr};
   \node at (-0.75,0) (in) {in};
   \node at (1.25,0) (out) {out};
   \node at (0.25,1) (load) [text=blue] {load};
   \draw[->] (in) -- (bit-in);
   \draw[->] (bit-out) -- (out);
   \draw[->, color=blue] (load) -- (bit-load);

    
Dans la :numref:`fig-bit`, le triangle rouge rappelle la présence du signal d'horloge qui est présent dans tous les circuits de mémoire. Pour simplifier les prochaines représentations graphiques, nous le retirerons souvent, mais si il restera bien présent en réalité.

Un registre pour mémoriser un quartet
-------------------------------------

Nous pouvons maintenant utiliser cet élément de mémoire pour construire un registre qui permet de mémoriser la valeur d'un quartet. Ce circuit a six entrées :

 - le signal d'horloge
 - le signal `load`
 - le bit :math:`B_{3}` du quartet à mémoriser
 - le bit :math:`B_{2}` du quartet à mémoriser
 - le bit :math:`B_{1}` du quartet à mémoriser
 - le bit :math:`B_{0}` du quartet à mémoriser

et quatre sorties :

 - le bit :math:`Out_{3}` du quartet mémorisé
 - le bit :math:`Out_{2}` du quartet mémorisé
 - le bit :math:`Out_{1}` du quartet mémorisé
 - le bit :math:`Out_{0}` du quartet mémorisé


   
.. _fig-reg4:
.. tikz:: Un registre à 4 bits

   [
   connection/.style={draw,circle,fill=black,inner sep=1.5pt}
   ]
	  
   \tikzset{
       bitr/.pic ={
       \coordinate (-out) at (.5,0.25);
       \coordinate (-in) at (0,0.25);
       \coordinate (-load) at (0.25,0.5);
       \coordinate (-clock) at (0.25,0);
       \draw (0,0) -- (0,0.5) -- (0.5,0.5) -- (0.5,0) -- cycle; 
       \draw [color=red, fill] (.2,0) -- (0.25,0.05) -- (0.3,0) -- cycle; 
       \node at (0.25,0.25) {\tiny \tikzpictext};
       }
   }
   
   \node [color=blue] (load) at (0,0) {$Load$};
   \node [color=red] (clock) at (0,-5) {$Clock$}; 

   \foreach \b in {3,2,1,0}
     \pic at ($(2,-1.25) +(\b,-\b)$) (bit\b) [draw, pic text={$Bit_{\b}$}] {bitr};

   \foreach \b in {3,2,1,0}     
     \node (B\b) at ($(0,-1) + (0,-\b)$) {$B_{\b}$};

   \foreach \b in {3,2,1,0}     
     \node (O\b) at ($(7,-1) + (0,-\b)$) {$Out_{\b}$}; 

   \foreach \b in {3,2,1,0}     
     \draw[->] (bit\b-out) -- (O\b);

   \foreach \b in {3,2,1,0}     
     \draw[->] (B\b) -- (bit\b-in);      

   \draw[color=blue] (load) -- ($(load)+(6,0)$);
   \draw[color=red] (clock) -- ($(clock)+(6,0)$);


   \foreach \b in {3,2,1,0}
     \draw[color=red,->] ($(clock)+(2.25+\b,0)$) -- (bit\b-clock) node[color=red,connection,pos=0,fill=red] {};
   \foreach \b in {3,2,1,0}
     \draw[color=blue,->] ($(load)+(2.25+\b,0)$) -- (bit\b-load) node[color=blue,connection,pos=0,fill=blue] {};


De la même façon, on peut construire des registres qui permettent de stocker un octet ou un mot de 16, 32 voire même 64 bits. Dans la suite de ce chapitre, nous représenterons un tel registre sous la forme d'un rectangle.


De tels registres s'utilisent généralement en groupe. Un microprocesseur contient plusieurs registres et une mémoire peut stocker des millions ou même des milliards d'octets. A titre d'illustration, considérons un bloc de registre qui stocke quatre bits. Ce bloc de registres comprend bien entendu quatre registres qui stockent chacun un bit. Outre le signal d'horloge (non représenté en :numref:`fig-reg4`), nous devons connecter le signal `load`, les 4 bits d'entrée et les 4 bits de sortie à cet ensemble de registres. Le signal d'horloge peut être directement connectés à chacun de nos quatre registres.


.. _fig-reg4b:
.. tikz:: Eléments d'un registre à 4 bits
   :libs: positioning

   [node distance=0.1cm]
	  
      \definecolor{g}{gray}{0.8}
      \node (r0) [draw,fill=g] {Registre 0};
      \node (r1) [draw,fill=g,below =of r0] {Registre 1};
      \node (r2) [draw,fill=g,below =of r1] {Registre 2};
      \node (r3) [draw,fill=g,below =of r2] {Registre 3};
      \node (load) [color=blue, above =of r0] {\tiny Load};
      \node (B) [left =of r1] {$B_{3-0}$};
      \node (out) [right =of r1] {$out_{3-0}$};


Pour la connexion des bits d'entrée et des bits de sortie, nous devons trouver une solution qui nous permet d'identifier le registre dans lequel nous souhaitons effectuer une opération de lecture ou d'écriture. Pour cela, nous devons identifier chacun de nos registres avec un numéro. Le premier registre a `0` comme identifiant, le deuxième `1`, le troisième `2` et le dernier `3`. Comme nous nous avons 4 identifiants, il nous suffit de deux signaux binaires pour encoder la valeur de l'identifiant du registre concerné. Ces deux signaux s'ajoutent au bloc de registre représenté en :numref:`fig-reg4b`. Ils doivent nous permettre de sélectionner le registre dans lequel l'information arrivant est écrite ou  lue en fonction de la valeur du signal `load`. Cet identifiant est généralement appelé une :index:`adresse`. Dans notre exemple, nous avons 4 adresses possibles qui sont encodées sur deux bits.

Commençons par analyser l'opération de lecture à travers notre bloc de quatre registres. A chaque cycle d'horloge, chaque registre envoie sur sa sortie la valeur qu'il a stocké. Pour choisir comme sortie globale du bloc de 4 registres une de ces valeurs, il nous suffit d'utiliser un multiplexeur auquel nos quarte registres sont connectés. Ce multiplexeur est commandé par les deux bits d'adresse. Il est représenté sur la droite de la :numref:`fig-reg4c`.

Analysons maintenant l'opération d'écriture dans un de nos quatre registres. La valeur à enregistrer arrive via les signaux :math:`B_{3}B_{2}B_{1}B_{0}`. Elle peut être connectée à nos quatre registres. L'important est de pouvoir activer le signal `load` uniquement sur le registre dans lequel l'information doit être stockée. Lorsque l'adresse est `00` en binaire, le signal `load` doit activer le registre `0`. De même, c'est le registre `3` qui doit être activé pour l'adresse `11` en binaire. Nous avons déjà résolu un problème similaire il y a quelques chapitres en utilisant un démultiplexeur. Celui-ci est connecté à l'entrée `load` et commandé par les deux bits d'adresse. Ses quatre sorties sont attachées aux quatre entrées `load` de nos registres. Ce démultiplexeur est représenté dans la partie gauche de :numref:`fig-reg4c`.
      
      
.. _fig-reg4c: 
.. tikz:: Un registre à 4 bits 
   
      
   [
      node distance=0.3cm
   ]
	  



   \draw (0,2) -- (1,3) -- (1,1) node (out0) [pos=0.2,left] {\tiny 0} node (out1) [pos=0.4,left] {\tiny 1} node(out2) [pos=0.6,left] {\tiny 2} node (out3) [pos=0.8,left] {\tiny 3} -- (0,2) node (addr0) [pos=0.75,right] {\tiny A0} node (addr1) [pos=0.95,right] {\tiny A1} ;

   \node (in) at (0,0) {};
	  
   \definecolor{g}{gray}{0.8}
   \node (r0) at (3,0.8) [draw, fill=g] {\small Registre 0};
   \node (r1) at (4.5,0) [draw,fill=g] {\small Registre 1};
   \node (r2) at (6,-0.8) [draw,fill=g] {\small Registre 2};
   \node (r3) at (7.5,-1.6) [draw,fill=g] {\small Registre 3};
   \node (load) at (5,3.5) [color=blue] {Load};
   \node (B) at (-1,0) {\textbf{$B_{3-0}$}};
   \node (a1) at (-1.5,-2) {$Addr_{1}$};
   \node (a0) at (-1.5,-2.5) {$Addr_{0}$};
   
   \node (out) at (11,0) {\textbf{$out_{3-0}$}};
   \foreach \n in {0,1,2,3}
      \draw[->,thick] (B) -- (1,0) |- (r\n.west);

   \foreach \n in {0,1,2,3}
      \draw[->,color=blue] (out\n) -| (r\n.north);

  \draw [->,color=blue] (load) -| (0,2);   
  \draw [->] (a0) -| (addr0);
  \draw [->] (a1) -| (addr1);
  
  \draw (10,0) -- (9,1) -- (9,-1) node (mout0) [pos=0.2,right] {\tiny 0} node (mout1) [pos=0.4,right] {\tiny 1} node(mout2) [pos=0.6,right] {\tiny 2} node (mout3) [pos=0.8,right] {\tiny 3} -- (10,0) node (maddr0) [pos=0.75,left] {\tiny A0} node (maddr1) [pos=0.95,left] {\tiny A1} ;

  \draw [->] (a0) -| (maddr0);
  \draw [->] (a1) -| (maddr1);

  \foreach \n in {0,1,2,3}
      \draw[->] (r\n.east) -- (mout\n);

  \draw[->,thick] (10,0) -- (out);


Ce schéma général peut se reproduire sans difficulté pour des mémoires de plus grande capacité. La seule limitation sera technologique et liée au nombre de registres et de multiplexeurs/démultiplexeurs que l'on pourra placer sur une surface donnée.

A titre d'exemple, regardons comment construire un bloc de huit registres. Ce bloc doit avoir en entrée les signaux suivants :

 - les données à mémoriser (:math:`B_{3}B_{2}B_{1}B_{0}` pour des quartets)
 - le signal d'horloge (non représenté sur les figures)
 - le signal `load`
 - 3 bits pour indiquer l'adresse du registre où il faut lire/écrire

Pour construire cette mémoire contenant huit registres, nous pouvons partir du bloc de quatre registres que nous venons de construire. Celui-ci peut être schématisé comme en :numref:`fig-reg4-bloc`.

.. _fig-reg4-bloc:
.. tikz:: Représentation schématique d'un bloc de 4 registres

    \node (bloc) [draw, align=center] {
    Bloc\\
    de\\
    4\\
    registres};

    \node(b) [left =of bloc.150] {\textbf{$B_{3-0}$}};
    \node(a1) [left =of bloc.205] {A1};
    \node(a0) [left =of bloc.220] {A0};
    \node(load) [text=blue, above =of bloc.north] {load};
    \node(out) [right =of bloc.east] {$out_{3-0}$};
    
    \draw[->,thick] (b) -- (bloc.150);
    \draw[->] (a1) -- (bloc.205);
    \draw[->] (a0) -- (bloc.220);
    \draw[->] (bloc.east) -- (out);
    \draw[->,color=blue] (load) -- (bloc.north);


Grâce à ce bloc de quatre registres, nous pouvons facilement construire notre bloc de huit registres. Il suffit de considérer que l'un des blocs de registres correspond aux adresses 0 à 3 et le second aux adresses allant de 4 à 7. En notation binaire, les adresses correspondant au premier bloc vont de :math:`000` à :math:`011` tandis que celle du second bloc vont de :math:`100` à :math:`111`. On peut donc utiliser le bit de poids fort de l'adresse (:math:`A_2`) pour choisir entre le premier bloc de registres et le second. Pour l'opération de lecture, il suffit de connecter un multiplexeur connecté aux sorties et de le commandé en utilisant le bit de poids fort de l'adresse. Ce bit de poids fort doit aussi commander le démultiplexeur se trouvant sur la gauche de :numref:`fig-reg8` pour acheminer le signal `load` vers le `bloc 0` ou le `bloc 1`. 
    

.. _fig-reg8:
.. tikz:: Un bloc de 8 registres

   \draw (0,2.5) -- (1,3.5) -- (1,1.5) node (out0) [pos=0.4,left] {\tiny 0} node (out1) [pos=0.8,left] {\tiny 1} -- (0,2.5) node (addr0) [pos=0.75,right] {\tiny A} ;	  
    \node(load) at (-1.5,2.5) [text=blue] {load};	  
    \node (B) at (-1.5,0) {\textbf{$B_{7-0}$}};

    \node (a2) at (-1.5,-3) {$A_2$};
    \node (a1) at (-1.5,-3.5) {$A_1$};
    \node (a0) at (-1.5, -4) {$A_0$};	  

    \draw [->, color=blue] (load) -- (0,2.5);
    
    \node (bloc0) at (3,0.8) [draw, fill=white,align=center] { 
    Bloc \textbf{0}\\
    4\\
    registres};
	  

    \node (bloc1) at (4.5,-0.8) [draw, fill=white,align=center] {
    Bloc \textbf{1}\\
    4\\
    registres};


    \draw (7.5,0) -- (6.5,1) -- (6.5,-1) node (mout0) [pos=0.4,right] {\tiny 0} node (mout1) [pos=0.8,right] {\tiny 1} -- (7.5,0) node (maddr0) [pos=0.75,left] {\tiny A} ;

    \draw[->,color=blue] (out0) -| (bloc0.north);
    \draw[->,color=blue] (out1) -| (bloc1.north);

    \draw[->,thick ] (bloc0.east) -- (mout0);
    \draw[->, thick] (bloc1.east) -- (mout1);


    \draw [->] (a1) -- (1.5,-3.5) |- (bloc0.205);
    \draw [->] (a0) -- (1.7,-4) |- (bloc1.220);

    \draw [->] (a1) -- (1.5,-3.5) |- (bloc1.205);
    \draw [->] (a0) -- (1.7,-4) |- (bloc0.220);

    \draw [->] (a2) -| (addr0);
    \draw [->] (a2) -| (maddr0);

    \node (out) at (9,0) {\textbf{$out_{3-0}$}};
    \draw [->,thick] (7.5,0) -- (out.west);

    \draw [->,thick] (B)-- (1,0) |- (bloc0.150);
    \draw [->,thick] (B)-- (1,0) |- (bloc1.150);

Ce schéma général peut se reproduire sans difficulté pour des mémoires de plus grande capacité. La seule limitation sera technologique et liée au nombre de registres et de multiplexeurs/démultiplexeurs que l'on pourra placer sur une surface donnée.


Exercice
________

Il est souvent nécessaire de compter le nombre de cycles d'horloge qui se sont écoulés depuis un instant donné. Parmi les circuits que vous devez réaliser pour cette mission, l'on retrouve un compteur. Celui que vous devez réaliser a une sortie sur 16 bits et quatre entrées :

 - un entier sur 16 bits
 - un signal de contrôle `load`
 - un signal de contrôle `inc`
 - un signal de contrôle `reset`

Ces différents signaux de contrôle permettent de forcer le compteur à réaliser certaines opérations. Si `reset` est mis à `1` durant un cycle d'horloge, alors la sortie du compteur doit valoir `0` durant le cycle suivant. Ce signal de contrôle permet donc de réinitialiser le compteur.

Si `inc` est mis à `1` durant un cycle d'horloge, alors la sortie durant le cycle d'horloge suivant sera celle du cycle d'horloge courant incrémentée d'une unité. C'est le mode de fonctionnement normal du compteur.

Si `load` est mis à `1` durant un cycle d'horloge, alors le compteur lit la valeur en entrée et c'est cette valeur qui sera retournée sur la sortie du compteur durant le cycle d'horloge suivant.

La :numref:`fig-compteur` présente l'évolution dans le temps d'un compteur à deux bits (:math:`out_1` est le bit de poids fort et :math:`out_0` le bit de poids faible) en fonction des différents signaux de contrôle. On suppose dans cet exemple que les deux signaux d'entrée sont mis à `1` ainsi que :math:`out_1` et :math:`out_0`.



.. _fig-compteur:
.. tikz:: Evolution de la sortie du compteur en fonction du temps

          \draw[thick,->] (0,0) -- (5,0) node[anchor=north east] {temps};
          
          \foreach \tick in {0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5}
          \draw [dotted,-] (\tick, 0) -- (\tick, -7) node [below] {};


          \draw [thick,color=blue,-] (0,-1.5) -- (0.5,-1.5) -- (0.5,-1) -- (1,-1) -- (1,-1.5) -- (5,-1.5);
          \draw [thick,color=orange,-] (0,-2.5) -- (4,-2.5) -- (4, -2) -- (4.5,-2) -- (4.5,-2.5) -- (5,-2.5);                    
          \draw [thick,color=green,-] (0,-3.5) -- (1,-3.5) -- (1,-3) -- (3.5,-3) -- (3.5,-3.5) -- (5,-3.5);
          \node [color=blue] at (-0.5,-1) {Reset}; 
          \node [color=blue] at (5.5,-1) {1}; 
          \node [color=blue] at (5.5,-1.5) {0};

          \node [color=orange] at (-0.5,-2) {Load}; 
          \node [color=orange] at (5.5,-2) {1}; 
          \node [color=orange] at (5.5,-2.5) {0};

          \node [color=green] at (-0.5,-3) {Inc}; 
          \node [color=green] at (5.5,-3) {1}; 
          \node [color=green] at (5.5,-3.5) {0};

          \node [color=black] at (-0.5,-5) {$out_{1}$}; 
          \node [color=black] at (5.5,-5) {1}; 
          \node [color=black] at (5.5,-5.5) {0};

          \node [color=black] at (-0.5,-6) {$out_{0}$}; 
          \node [color=black] at (5.5,-6) {1}; 
          \node [color=black] at (5.5,-6.5) {0};



	  \foreach \y in {-4}
           \foreach \tick in {0,0.5,1,1.5,2,2.5,3,3.5,4,4.5}
           \draw [thick,color=red,-] (\tick, \y-0.5) -- (\tick, \y) --
                           (\tick+0.1, \y ) -- (\tick+0.1, \y-0.5 ) --
                           (\tick+0.5, \y-0.5 ) ;
                           
          \node [color=red] at (-0.5,-4) {Clock};
          \node [color=red] at (5.5,-4) {1};
          \node [color=red] at (5.5,-4.5) {0};

          \draw [thick,color=black,-] (0,-5) -- (1,-5) -- (1,-5.5) -- (2,-5.5) -- (2, -5) -- (3,-5) -- (3,-5.5) -- (4,-5.5) -- (4.5,-5.5) -- (4.5,-5) -- (5,-5);

	  \draw [thick,color=black,-] (0,-6) -- (1,-6) -- (1,-6.5) -- (1.5,-6.5) -- (1.5,-6) -- (2,-6) -- (2,-6.5) -- (2.5,-6.5) -- (2.5,-6) -- (3,-6) -- (3,-6.5) -- (3.5,-6.5) -- (3.5,-6) -- (4,-6) -- (5,-6); 


Durant le premier cycle d'horloge, tous les signaux de contrôle sont à `0` et la sortie garde donc sa valeur initiale. Durant le second cycle d'horloge, le signal de contrôle `reset` est activé. Cela provoque une réinitialisation des sorties :math:`out_1` et :math:`out_0` à `0`, mais celle-ci n'est visible qu'autre troisième cycle d'horloge. Durant ce troisième cycle d'horloge, le signal de contrôle `Inc` est activé. Le compteur commence à s'incrémenter. Durant le quatrième cycle, le compteur retourne la valeur binaire `01`. Durant le sixième cycle, il retourne la valeur binaire `11` qui est la valeur maximale pour un compteur sur deux bits. Comme le signal de contrôle `Inc` reste à `1` le compteur repasse à la valeur binaire `00` durant le cycle suivant. Durant le septième cycle, `Inc` est toujours activé. C'est pour cette raison que le compteur retourne la valeur binaire `01` durant le huitième cycle d'horloge. Le signal `Inc` étant désactivé durant ce cycle, le compteur ne modifie pas sa valeur qui reste inchangée pour le neuvième cycle d'horloge. Enfin, durant le dernière cycle d'horloge sur :numref:`fig-compteur`, on observe le résultat de l'activation du signal `Load` sachant que les deux entrées du compteur sont mises à `1`.


	  

1.  Quels sont, à votre avis, les circuits de base qui sont nécessaires pour construire un tel compteur ? Pensez aux différents circuits que vous avez construit durant les dernières semaines.

.. un registre, trois multiplexeurs et un incrémenteur

Les mémoires RAM et ROM
-----------------------

Les mémoires utilisées dans un ordinateur peuvent être divisées en plusieurs classes. La première distinction est entre les mémoires de type :index:`ROM` (`Read-Only Memory`) et de type :index:`RAM` (`Random Access Memory`). Comme son nom l'indique, une mémoire :index:`ROM` est une mémoire dont le contenu ne peut qu'être lu. Le contenu de cette mémoire est écrit lors de la construction du circuit et elle ne peut jamais être modifiée. Ces mémoires sont utilisées pour stocker des données ou des programmes qui ne changent jamais, comme par exemple le code qui permet de faire démarrer un ordinateur et de lancer son système d'exploitation. Une mémoire :index:`ROM` peut se représenter comme dans la :numref:`fig-rom`.


.. _fig-rom:
.. tikz:: Une mémoire ROM
	  
   [
      node distance=0.1cm
   ]

   \node (addr) at (0,0) {\small Addr};
   \node (rom) [draw,right =of addr, align=center] {
   R\\
   O\\
   M
   };
   \node (out) [right =of rom] {\small out};
   \draw [->] (addr) -- (rom.west);
   \draw [->] (rom.east) -- (out);

Une caractéristique important des mémoires de type :index:`ROM` est que leur contenu est préservé même lorsque la mémoire est mise hors tension. Certaines mémoires de type :index:`ROM` sont dites programmables car il est possible d'effacer et de modifier leur contenu. C'est le cas par exemple des :index:`EPROM` ou des :index:`EEPROM`. La programmation d'un tel circuit se fait en utilisant un dispositif spécialisé. 
   

Dans une mémoire :index:`RAM`, outre les entrées relatives aux adresses, il faut aussi avoir une entrée `load` (parfois appelée `read/write`) pour déterminer si la mémoire doit lire ou écrire une donnée et une entrée `data` permettant de charger des données dans la `RAM`. Le nombre de bits d'adresses dépend uniquement de la capacité de la mémoire. En général, une adresse correspond à un octet stocké en mémoire. L'entrée `data` quant à elle peut permettre de charger des octets, des mots de 16, 32 bits ou encore plus. La :numref:`fig-ram` représente une mémoire :index:`RAM` de façon schématique. 
   
.. _fig-ram:
.. tikz:: Une mémoire RAM
	  
   [
      node distance=0.1cm
   ]

   \node (empty) at (0,0) {};
   \node (addr) at (-0.5,-0.5) {\small Addr};
   \node (data) at (-0.5,0.5) [text=green] {\small Data};
   \node (ram) [draw,right =of empty, align=center] {
   R\\
   A\\
   M
   };
   \node (load) [above =of ram,text=blue] {\small load};
   \node (out) [right =of ram] {\small out};
   \draw [->] (addr.east) -- (ram.225);
   \draw [->,color=green] (data.east) -- (ram.135);
   \draw [->] (ram.east) -- (out);
   
   \draw [->,color=blue] (load) -- (ram.north);   


Exercice
________


1. En utilisant uniquement les portes logiques de base `AND`, `OR` et `NOT`, pourriez-vous construire une mémoire `ROM` de 4 octets qui contient les valeurs suivantes :

    - à l'adresse `00` : `11110000`
    - à l'adresse `01` : `10101010`
    - à l'adresse `10` : `00001111`
    - à l'adresse `11` : `01010101`   


Une mémoire :index:`RAM` est dite volatile. Elle ne préserve son contenu que tant qu'elle est sous tension. L'ensemble des données stockées dans une :index:`RAM` disparaît dès que celle-ci est mise en tension. Il existe deux grandes familles de mémoires :index:`RAM`:

 - les :index:`SRAM` ou mémoires RAM statiques
 - les :index:`DRAM` ou mémoires RAM dynamiques
   
En simplifiant fortement la technologie utilisée par ces deux grandes familles de mémoire :index:`RAM`, on peut dire que dans une :index:`SRAM`, une valeur binaire correspond à la présence ou l'absence d'un courant électrique. Pour cette raison, une mémoire :index:`SRAM` consomme en permanence de l'électricité et cela limite la densité de ces mémoires, c'est-à-dire le nombre de bits que l'on peut stocker sur une surface donnée. Dans une mémoire :index:`DRAM`, les bits sont stockés comme une charge électrique présente dans un minuscule condensateur. Comme la charge d'un condensateur décroît naturellement avec le temps, il est nécessaire de réécrire régulièrement (on parle généralement de rafraîchir) les données qui sont stockées en mémoire :index:`DRAM`. Ce rafraîchissement est réalisé automatiquement par un circuit électronique spécialisé. Les mémoires :index:`DRAM` consomment moins d'électricité que les mémoires de type :index:`SRAM`. Cela leur permet d'être beaucoup plus denses et moins coûteuses pour une même quantité de données. Par contre, les mémoires :index:`DRAM` sont généralement plus lentes que les mémoires :index:`SRAM`.


Les mémoires :index:`RAM` jouent un rôle extrêmement important dans le fonctionnement d'un ordinateur comme nous les verrons dans les prochains chapitres. Durant les dernières décennies, elles ont fortement évolué. Sans entrer dans trop de détails technologiques, il est intéressant d'analyser trois éléments de performance de ces dispositifs de mémoire. Pour cela, nous nous basons sur les données reprises dans le livre `Computer Architecture: A Quantitative Approach <https://www.elsevier.com/books/computer-architecture/hennessy/978-0-12-811905-1>`_ écrit par John Hennessy et David Patterson. Ce livre va bien au-delà des concepts qui sont vus dans ce cours, mais c'est un des livres de référence du domaine. Son premier chapitre reprend plusieurs chiffres très intéressant que nous analysons.

Une première métrique pour analyser l'évolution des mémoires RAM est de regarder leur capacité. Celle-ci s'exprime généralement en Mbits par puce. En 1980, date de la sortie de l'IBM PC-AT, une puce de mémoire DRAM contenait 64 Kbits. Cette capacité a été quadruplée en 1983 et ensuite portée à 1 Mbits en 1986. En 2000, une puce de mémoire contenait 256 Mbits. En 2016, une puce de mémoire DDR4 a une capacité de 4096 Mbits. En 33 ans, la capacité de mémoire RAM d'une ordinateur de bureau standard a donc été multipliée par 64000 ! La :numref:`fig-ram-capacite` résume cette évolution.

.. voir https://www.overleaf.com/learn/latex/Pgfplots_package pour une brève démo de pgfplot


.. _fig-ram-capacite:
.. tikz:: Evolution de la capacité des DRAMs
   
   \pgfplotstableread[row sep=\\,col sep=&]{
    an & capa \\
    1980  & 0.06 \\
    1983  & 0.25 \\ 
    1986  & 1 \\
    1993  & 16 \\
    1997  & 64 \\
    2000  & 256 \\
    2016  & 4096 \\
    }\mydata


    \begin{semilogyaxis}[            
            xmin=1975,
	    ymax=2020
            nodes near coords,
            nodes near coords align={vertical},
            ymin=1,ymax=5000,
            ylabel={Mbits},
	    legend pos= north west,
	    x tick label style={
		/pgf/number format/1000 sep=},
        ]
        \addplot table[x=an,y=capa]{\mydata};
        \legend{Capacité d'un chip (Mbits)}
    \end{semilogyaxis}

La deuxième métrique que l'on peut utiliser pour comparer des mémoires est de regarder le débit auquel il est possible de lire des données depuis une telle mémoire. Ce débit s'exprime en MBytes/s. En 1980, celui-ci était de seulement 13 MBytes/s. En 2000, il est passé à 1600 MBytes/s et en 2016 il a atteint 27000 MBytes/s. L'amélioration en performance reste importante, mais nettement moindre que pour la capacité des mémoires. En 33 ans, le débit ne s'est amélioré que d'un facteur d'environ 2000. Cela reste impressionnant évidemment (:numref:`fig-ram-debit`).
    

.. _fig-ram-debit:    
.. tikz:: Evolution du débit des mémoires RAM
   
   \pgfplotstableread[row sep=\\,col sep=&]{
    an & debit \\
    1980  & 13 \\
    1983  & 40 \\ 
    1986  & 160 \\
    1993  & 267 \\
    1997  & 640 \\
    2000  & 1600 \\
    2016  & 27000 \\
    }\mydata


    \begin{semilogyaxis}[            
            xmin=1975,
	    ymax=2020
            nodes near coords,
            nodes near coords align={vertical},
            ymin=1,ymax=40000,
            ylabel={Mbytes/sec},
	    legend pos=north west,
	    x tick label style={
		/pgf/number format/1000 sep=},
        ]
        \addplot table[x=an,y=debit]{\mydata};
        \legend{Débit en MBytes/s}
    \end{semilogyaxis}

    
La dernière métrique importante pour une mémoire :index:`RAM` est son temps d'accès, c'est-à-dire le temps qui s'écoule entre le moment où l'on place une adresse en entrée de la mémoire et le moment où la valeur stockée à cette adresse est disponible. En 1980, il fallait 225 ns pour accéder à une information stockée en mémoire DRAM. En 2000, ce temps d'accès était passé à 52 ns. En 2016, les mémoires DDR4 affichent des temps d'accès de 30 ns. En 33 ans, on n'a donc gagné qu'un facteur 7 du point de vue du temps d'accès aux mémoires RAM (:numref:`fig-ram-access`). Malheureusement, les limitations technologiques ont fait qu'il n'a pas été possible d'améliorer les temps d'accès des mémoires RAM aussi rapidement que leur capacité ou leur débit. Nous aurons l'occasion de discuter à la fin du cours de l'impact de ces temps d'accès relativement élevés.


.. source: CAQA

.. _fig-ram-access:
.. tikz:: Evolution du temps d'accès des DRAMs
   
   \pgfplotstableread[row sep=\\,col sep=&]{
    an & latence \\
    1980  & 225 \\
    1983  & 170 \\ 
    1986  & 125 \\
    1993  & 75 \\
    1997  & 62 \\
    2000  & 52 \\
    2016  & 30 \\
    }\mydata


    \begin{axis}[            
            xmin=1975,
	    ymax=2020
            nodes near coords,
            nodes near coords align={vertical},
            ymin=0,ymax=300,
            ylabel={ns},
	    x tick label style={
	       /pgf/number format/1000 sep=},

        ]
        \addplot table[x=an,y=latence]{\mydata};
        \legend{Temps d'accès}
    \end{axis}


.. compteur
    
            
.. Dans la suite de ce chapitre, nous distinguerons entre deux types de circuits:
..  - les circuits purement combinatoires dans lesquels la sortie ne dépend que des entrées présentes
..  - les circuits :index:`séquentiels` dans lesquels la sortie dépend des entrées présentes *et* de l'état du circuit, c'est-à dire de calculs effectués par les passé.

La construction d'un data flip-flop
-----------------------------------
    
Le livre a choisi de prendre le data flip-flop comme élément de base pour la construction de tous les dispositifs de mémoire. En pratique, un tel flip-flop peut aussi se construire en utilisant des portes logiques standard. Il existe différentes réalisations de tels flip-flops. Nous en considérons deux afin de comprendre leur fonctionnement. Le flip-flop le plus simple est le :index:`flip-flop RS` comprenant une porte `AND`, une porte `OR` et un inverseur.
    

.. tikz:: Représentation graphique d'un flip-flop RS AND-OR
   :libs:  circuits.logic.US 

   [tiny circuit symbols, every circuit symbol/.style={fill=white,draw},
   connection/.style={draw,fill=black,circle,inner sep=1.5pt}
   ]

   \node [or gate US, draw] (or) at (0,0) {};
   \node [and gate US,draw] (and) at ($(or.output) + (1,-0.5)$) {};
   
   \node (s) at ($(or.input 2) + (-1,0)$) {$S$}; 
   \node (q) at ($(and.output) + (2,0)$)  {$Q$}; 
   \draw [->] (s) -- (or.input 2);

   \node [not gate US,draw] (not) at  ($(and.input 2) + (-1,0)$) {};
   \node (r) at ($(not) + (-1,0)$)  {$R$}; 
   \draw [->] (r) -- (not.input);           
   \draw (not.output) -- (and.input 2);
   
   \draw (or.output) -- (and.input 1);
   \draw (and.output) -- ($(and.output) + (0.5,0)$)  -- ($(and.output) + (0.5,1)$) --  ($(and.output) + (-2.5,1)$) -- ($(or.input 1) + (-0.5,0)$) -- (or.input 1); 

   \draw [->]  ($(and.output) + (0.5,0)$) -- (q);


   
Ce circuit très simple utilise une porte `AND` et une porte `OR`. Il comporte deux  entrées : `S` et `R` et a comme sortie `Q`. Pour analyser le comportement de ce circuit, commençons par discuter de ce qu'il se passe lorsque `S` et `R` valent `0`. Dans ce cas, la sortie de la porte `OR` vaut la valeur de `Q`. Il en va de même pour celle de la sortie de la porte `AND` puisque sa deuxième entrée est mise à `1`. Quelle que soit la valeur initiale de `Q`, celle-ci est conservée lorsque `R` et `S` valent `0`.

Essayons maintenant de faire passer `S` à la valeur `1` tout en gardant `R` à `0`. Si `Q` valait initialement `0`, alors la sortie `Q` passe à `1` et cette valeur reste stable. Si `Q` valait initialement `1`, alors sa valeur reste à `1`. On utilise généralement le nom `Set` pour l'entrée `S` car elle permet de faire passer la valeur de `Q` à `1`.

Analysons maintenant ce qu'il se passe si `R` passe à `1`. Dans ce cas, la sortie `Q` va nécessairement passer à `0` puisque la seconde entrée de la porte `AND` est mise à `0`. Cette valeur restera quelle que soit la valeur de `S`  (`0` ou `1`). La deuxième entrée de ce flip-flop est généralement appelée l'entrée `Reset` car elle force une mise à zéro de la sortie. Il est important de noter que la valeur de `Q` reste conservée par le flip-flop lorsque `R` et `S` valent `0`.

.. avec une horloge ?

.. spelling:word-list::

   latch


Notre second circuit est le :index:`latch SR`. Ce circuit utilise deux portes `NOR` et a deux entrées : `R` et `S`. Une caractéristique importante de ce circuit est qu'il existe une boucle entre la sortie d'un porte `NOR` et l'entrée de l'autre porte. Par ce circuit, `R` et `S` sont les entrées tandis que `Q` et :math:`\overline{Q}` sont les sorties

Ce circuit est assez inhabituel. N'essayez pas de le tester avec le simulateur du livre. Par contre, il est intéressant d'analyser comment ce circuit fonctionne.

Commençons par analyser le cas où `R` et `S` valent `0`. Supposons qu'initialement `Q` valait `0` et :math:`\overline{Q}` valait `1`. Dans ce cas, la sortie de la port `NOR` supérieure reste à `0` tandis que la sortie de la porte `NOR` inférieure reste à `1`. Si par contre `Q` valait `1` et :math:`\overline{Q}` valait `0`, alors `Q` reste à `1` et :math:`\overline{Q}` reste à `0`. On dit que lorsque `R` et `S` valent `0`, la sortie du flip-flop reste stable. Cela revient à dire que notre flip-flop garde sa valeur.

Regardons maintenant ce qu'il se passe lorsque `R` vaut `1` tandis que `S` reste à `0`. Si `Q` valait initialement `1` tandis que :math:`\overline{Q}` valait `0`, alors la sortie de la porte `NOR` supérieure va passer à `0`.  Cette valeur va revenir dans la porte `NOR` inférieure et forcer un passage à `1` de la sortie :math:`\overline{Q}`. Lorsque cette sortie revient dans la porte `NOR` supérieure, elle force sa sortie à `0`. Si `Q` valait initialement `0` (et :math:`\overline{Q}` valait `1`), rien ne change.
On dit que l'entrée `R` est l'entrée `Reset` car elle permet de forcer la sortie `Q` à passer à `0`.


Regardons maintenant ce qu'il se passe lorsque `R` reset à `0` tandis que `S` passe à `0`. Si `Q` valait initialement `0` tandis que :math:`\overline{Q}` valait `1`, alors la sortie de la porte `NOR` supérieure va passer à `1`.  Cette valeur va revenir dans la porte `NOR` inférieure et forcer un passage à `0` de la sortie :math:`\overline{Q}`. Lorsque cette sortie revient dans la porte `NOR` supérieure, elle force sa sortie à `1`. Si `Q` valait initialement `1` (et :math:`\overline{Q}` valait `0`), rien ne change.
On dit que l'entrée `S` est l'entrée `Set` car elle permet de forcer la sortie `Q` à passer à `1`.

Lorsque `R` et `S` valent simultanément `1`, les sorties `Q` et :math:`\overline{Q}` passent à `0` toutes les deux.
    
.. _fig--sr-nor:   
.. tikz:: Représentation graphique d'un latch SR utilisant des portes NOR 
   :libs:  circuits.logic.US 

   [tiny circuit symbols, every circuit symbol/.style={fill=white,draw}]
   
   \node (r) at (0,0) {$R$}; 
   \node (s) at (0,-1.7) {$S$}; 

   \node [nor gate US, draw] (nor1)  at ($(r) +(1.5,-0.2)$)  {}; 
   \node [nor gate US, draw] (nor2)  at ($(r) +(1.5,-1.2)$)  {}; 
   \draw [->] (r) -- (nor1.input 1); 
   \draw [->] (s) -- (nor2.input 2); 
   \draw (nor1.output) -- ($(nor1.output) + (0.5,0)$) -- ($(nor2.input 1) + (-0.5,0)$) -- (nor2.input 1) ; 
   \draw (nor2.output) -- ($(nor2.output) + (0.5,0)$) -- ($(nor1.input 2) + (-0.5,0)$) -- (nor1.input 2); 
   
   \node (q) at ($(nor1.output) + (1,0)$) {$Q$}; 
   \node (qb) at ($(nor2.output) + (1,0)$) {$\overline{Q}$}; 
   \draw [->] ($(nor2.output) + (0.5,0)$) -- (qb); 
   \draw [->] ($(nor1.output) + (0.5,0)$) -- (q);


Exercices   
_________


1. Il est aussi possible de construire le flip-flop RS AND-OR en connectant la sortie `Q` à la sortie de la porte `OR`. Quel est le comportement de ce flip-flop dans ce cas ?

.. _fig-sr-and-or2:
.. tikz:: Variante du flip-flop RS AND-OR
   :libs:  circuits.logic.US 

   [tiny circuit symbols, every circuit symbol/.style={fill=white,draw}]

   \node [or gate US, draw] (or) at (0,0) {};
   \node [and gate US,draw] (and) at ($(or.output) + (1,-0.5)$) {};
   
   \node (s) at ($(or.input 2) + (-1,0)$) {$S$}; 
   \node (q) at ($(and) + (0,0.5)$)  {$Q$}; 
   \draw [->] (s) -- (or.input 2);

   \node [not gate US,draw] (not) at  ($(and.input 2) + (-1,0)$) {};
   \node (r) at ($(not) + (-1.2,0)$)  {$R$}; 
   \draw [->] (r) -- (not.input);           
   \draw (not.output) -- (and.input 2);
   
   \draw (or.output) -- (and.input 1);
   \draw (and.output) -- ($(and.output) + (0.5,0)$) -- ($(and.output) + (0.5,1)$) --  ($(and.output) + (-2.5,1)$) -- ($(or.input 1) + (-0.5,0)$) -- (or.input 1); 

   \draw (or.output) -- (q);

2. Le latch SR peut-être construit en utilisant des portes `NOR` comme présenté ci-dessus. Il est aussi possible de construire un circuit du même type avec des portes `NAND` (:numref:`fig-sr-nand`). Expliquez le fonctionnement de ce circuit.

.. _fig-sr-nand:   
.. tikz:: Représentation graphique d'un latch SR utilisant des portes NOR 
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
    

 
