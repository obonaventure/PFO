.. LSINC1102 documentation master file, created by
   sphinx-quickstart on Tue Jan 28 18:06:33 2020.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Fonctions en assembleur
=======================

Le minuscule ordinateur peut être programmé en langage d'assemblage grâce aux
multiples instructions qu'il supporte. En théorie, ce langage d'assemblage est
suffisant pour écrire n'importe quel programme. Cependant, il est fastidieux et
dangereux d'écrire un programme sans le découper en fonctions et procédures
qui peuvent être testées indépendamment et qui sont ensuite combinées.

Vous avez utilisé des fonctions et procédures dans le langage python sans
analyser en détails comment ce langage supportait ces différentes
constructions. Nous allons maintenant les analyser en nous appuyant sur
le langage d'assemblage du minuscule CPU.

Commençons par réfléchir aux différentes opérations qu'un langage de
programmation tel que python doit réaliser pour supporter différents types
de fonctions.  Tout d'abord, analysons comment implémenter une procédure,
c'est-à-dire une fonction qui ne prend pas d'argument et ne retourne pas
de résultat. Notre premier exemple simple est une procédure qui affiche
de l'information à l'écran. Une telle procédure pourrait être utilisée
dans un programme pour afficher le contenu d'un menu à l'écran.

.. code-block:: python
		
   def p():
       print("Bonjour")

Il est intéressant d'analyser comment un langage tel que python fait appel à
une telle procédure dans un programme. Regardons plus en détails le code
ci-dessous. La première ligne initialise la variable ``a`` à la valeur ``1``.
La deuxième ligne transfère l'exécution du programme à la procédure ``p()``.
Le code de cette procédure est composé d'un ensemble d'instructions qui se
trouvent en mémoire et vont afficher ``Bonjour`` à l'écran. Après l'exécution
de cette procédure, le programme python retourne à l'exécution de la troisième
ligne et place la valeur ``2`` dans la variable ``a``. La quatrième ligne
relance l'exécution de la procédure ``p()``. Celle-ci va à nouveau exécuter
les instructions qui permettent d'afficher ``Bonjour`` à l'écran, mais
après son exécution le programme python exécutera la ligne ``5``. On remarque
une différence important entre les deux invocations de la procédure ``p()``.
Après la première invocation, on exécute la ligne ``3`` du programme python.
Après la deuxième invocation, on exécute la ligne ``5`` du programme python.

.. code-block:: python
		
   a=1            # ligne 1
   p()            # ligne 2
   a=2            # ligne 3
   p()            # ligne 4
   a=3            # ligne 5

En python, il est facile d'imprimer de l'information à l'écran. En minuscule
assembleur, cette opération nécessite nettement plus d'efforts. Analysons
un autre exemple en python qui utilise les variables globales. En python,
une fonction utilise normalement les arguments qu'elle a reçu ou définit
ses propres variables locales. Il est aussi possible de définir des variables
globales, c'est-à-dire des variables qui sont stockées dans la mémoire du
programme et sont accessibles à toutes les fonctions de ce programme. Cette
utilisation d'un variable globale est illustrée dans le programme
python ci-dessous.

.. literalinclude:: python/procedure.py


La variable ``compteur`` est une variable globale (python impose l'utilisation du mot clé ``global`` dans sa définition dans la procédure ``compte``) qui est
initialisée dans le programme principal et modifiée dans la procédure
``compte``. Analysons l'exécution de ce programme
pas à pas. Ce programme manipule deux variables en mémoire : ``a`` et
``compteur``. La première ligne initialise la variable ``a`` à la valeur ``1``.
La deuxième ligne incrémente la variable ``compteur`` qui passe à ``1``. La
troisième ligne fait passer la valeur de la variable ``a`` à ``2``. La
quatrième ligne incrémente la variable ``compteur`` qui passe également à ``2``. Enfin, la dernière ligne place la valeur ``3`` dans la variable ``a``.

   
Pour bien comprendre comment une telle procédure peut être utilisée à plusieurs endroits dans un même programme, il est intéressant d'essayer de la convertir en minuscule assembleur.

Commençons par assigner une zone mémoire pour la variable ``a``, par exemple
l'adresse ``16``. Nous pouvons ensuite écrire en assembleur les lignes impaires
qui correspondent aux différentes assignations de cette variable.


.. code-block:: console

   // ligne 1
   @1
   D=A
   @a  
   M=D
   // à compléter
   // ligne 3
   @2
   D=A
   @a  
   M=D
   // à compléter
   // ligne 5
   @1
   D=A
   @a  
   M=D
   

Nous devons également assigner une zone mémoire pour stocker la variable ``compteur``. Supposons que celle-ci soit stockée à l'adresse ``17``. La :numref:`fig-mem-init` présente le contenu initial de notre mémoire.

.. _fig-mem-init:

.. tikz:: Contenu de la mémoire

   [cell/.style={rectangle,draw=black},
   space/.style={minimum height=1.5em,matrix of nodes,row sep=-\pgflinewidth,column sep=-\pgflinewidth,column 1/.style={font=\ttfamily}},text depth=0.5ex,text height=2ex,nodes in empty cells]

   \matrix (first) [space, column 1/.style={font=\ttfamily},column 2/.style={nodes={cell,minimum width=2em}}, column 3/.style={align=left}]
   {
   17   & 0 & \emph{variable }\texttt{compteur}\\   16  & 0 & \emph{variable }\texttt{a} \\   15   & 0 &  \\   };

   % source https://www.latex4technics.com/?note=3zrf
       

Il nous faut maintenant pouvoir faire appel à la procédure ``compte()`` après l'exécution des lignes ``1`` et ``3``. Le corps de cette procédure peut s'écrire en deux instructions en minuscule assembleur.

.. code-block:: console

   @compteur
   M=M+1

.. spelling::

   inline
   
Une première approche pour inclure notre procédure dans le programme en minuscule assembleur est d'intégrer directement ces instructions `en ligne`
(:term:`inline` en anglais). Cette technique est parfois utilisée dans certains
langages de programmation pour de très petites fonctions qui doivent
s'exécuter rapidement. 
   

.. literalinclude:: asm/procedure-ex1.asm
		    
Ce programme est téléchargeable depuis :download:`asm/procedure-ex1.asm`.
  
Cette approche fonctionne dans notre exemple simple, mais elle a deux inconvénient majeurs. Le premier est que le code de la procédure doit être recopié à chaque invocation de la procédure dans un programme. Cela consomme inutilement de l'espace mémoire surtout si le programme appelle la procédure à de nombreux endroits. Le deuxième inconvénient est que si la procédure modifie le contenu des registres ``A`` ou ``D``, elle pourrait avoir un impact non-voulu sur les instructions du programme principal.

Il serait préférable de pouvoir isoler les instructions de la procédure dans
une partie de la mémoire et d'y faire appel en exécutant un saut inconditionnel. Une première approche pourrait être la suivante. La code de la procédure ``compte`` est placé après l'étiquette ``COMPTE`` et on fait appel à la procédure en utilisant un saut inconditionnel vers cette adresse. 


.. literalinclude:: asm/procedure-ex2.asm


Malheureusement, ce n'est pas suffisant. Après la première exécution de la procédure ``compte``, l'exécution doit reprendre à l'adresse ``LIGNE3`` tandis qu'après la seconde exécution de la même procédure, il faut poursuivre l'exécution du programme principal à partir de l'adresse ``LIGNE5``. Pour résoudre ce problème, nous devons rendre le code de la procédure plus générique. Notre procédure doit pouvoir retourner, via une instruction ``JMP`` à l'adresse de l'instruction qui suit celle à partir de laquelle est a été appelée. Malheureusement, il n'est pas possible d'extraire cette information des registres du minuscule CPU durant l'exécution de notre procédure. Le programme appelant devra donc calculer cette adresse, souvent appelée :term:`adresse de retour` et la sauvegarder à un endroit où la procédure peut la récupérer. Sur le minuscule ordinateur, le seul endroit où nous pouvons stocker de l'information est dans la mémoire. Une première solution est de réserver une adresse en mémoire pour sauver cette adresse de retour. Dans ce cas, l'appel à un procédure se déroule comme suit :

 1. Sauvegarde de l'adresse de retour en mémoire
 2. Appel de la procédure (via l'instruction ``JMP``)
 3. Exécution du corps de la procédure
 4. Récupération de l'adresse de retour
 5. Saut à l'adresse de retour pour poursuivre l'exécution du programme appelant


Il nous reste à traduire cela en minuscule assembleur. Supposons que l'étiquette ``retour`` corresponde à l'adresse réservée en mémoire pour stocker l'adresse de retour. L'appel à une procédure peut se réaliser en utilisant les instructions suivantes :

.. code-block:: console

   // juste avant l'appel à la procédure
     @SUIVANT  // sauvegarde de l'adresse qui suit l'appel à la procédure
     D=A       // ...
     @retour   // ...
     M=D       // dans la zone mémoire "retour"
     @COMPTE   // appel de la procédure compte
     0;JMP     // ...
   (SUIVANT)   // adresse de l'instruction qui suit l'appel à la procédure



La fin de la procédure doit également être adaptée. Il faut d'abord charger l'adresse de retour depuis la mémoire avant d'exécuter le ``JMP``. Cela se fait en utilisant la séquence d'instructions suivante :    

.. code-block:: console

   (COMPTE) 
     @compteur  
     M=M+1
     @retour   // adresse où est stockée l'adresse de retour
     A=M       // chargement de l'adresse se trouvant en mémoire	  
     0;JMP     // saut vers l'adresse de retour

Le programme complet intègre ces deux modifications. Il est téléchargeable depuis :download:`asm/procedure-ex3.asm`.		    

.. literalinclude:: asm/procedure-ex3.asm


Il est intéressant d'observer l'évolution de la mémoire durant l'exécution de ce programme. La :numref:`fig-mem-addr11` présente l'état de la mémoire lors de l'exécution de l'instruction ``0;JMP`` se trouvant à l'adresse 11. A ce moment, l'adresse ``16`` contient le compteur initialisé à zéro, l'adresse ``17`` contient la variable ``a`` initialisée à ``1``. L'adresse de retour est l'adresse de l'instruction qui suit l'instruction ``0;JMP``, c'est-à-dire la valeur ``12``. Elle est stockée en mémoire à l'adresse ``18``.


.. _fig-mem-addr11:

.. tikz:: Contenu de la mémoire durant l'exécution de l'instruction (0;JMP) se trouvant à l'adresse 11

   [cell/.style={rectangle,draw=black},
   space/.style={minimum height=1.5em,matrix of nodes,row sep=-\pgflinewidth,column sep=-\pgflinewidth,column 1/.style={font=\ttfamily}},text depth=0.5ex,text height=2ex,nodes in empty cells]

   \matrix (first) [space, column 1/.style={font=\ttfamily},column 2/.style={nodes={cell,minimum width=2em}}, column 3/.style={align=left}]
   {
   18   & 12 & \emph{adresse de retour } \\   17  & 1 & \emph{variable }\texttt{a} \\   16   & 0 &  \emph{variable }\texttt{compteur} \\   };

Après l'exécution de cette instruction, le programme va exécuter le code de la procédure. Celui-ci va incrémenter la valeur de la variable ``compteur`` et ensuite revenir au programme principal à l'instruction se trouvant à l'adresse ``12``. La :numref:`fig-mem-addr12` présente l'état de la mémoire à ce moment.


.. _fig-mem-addr12:

.. tikz:: Contenu de la mémoire durant l'exécution de l'instruction se trouvant à l'adresse 12

   [cell/.style={rectangle,draw=black},
   space/.style={minimum height=1.5em,matrix of nodes,row sep=-\pgflinewidth,column sep=-\pgflinewidth,column 1/.style={font=\ttfamily}},text depth=0.5ex,text height=2ex,nodes in empty cells]

   \matrix (first) [space, column 1/.style={font=\ttfamily},column 2/.style={nodes={cell,minimum width=2em}}, column 3/.style={align=left}]
   {
   18   & 12 & \emph{adresse de retour } \\   17  & 1 & \emph{variable }\texttt{a} \\   16   & 1 &  \emph{variable }\texttt{compteur} \\   };
   

L'exécution du programme se poursuit. Lors de l'exécution de la seconde instruction ``0;JMP`` du programme principal, le contenu de la mémoire est tel que représenté en :numref:`fig-mem-addr21`.
   

.. _fig-mem-addr21:

.. tikz:: Contenu de la mémoire durant l'exécution de l'instruction se trouvant à l'adresse 21

   [cell/.style={rectangle,draw=black},
   space/.style={minimum height=1.5em,matrix of nodes,row sep=-\pgflinewidth,column sep=-\pgflinewidth,column 1/.style={font=\ttfamily}},text depth=0.5ex,text height=2ex,nodes in empty cells]

   \matrix (first) [space, column 1/.style={font=\ttfamily},column 2/.style={nodes={cell,minimum width=2em}}, column 3/.style={align=left}]
   {
   18   & 22 & \emph{adresse de retour } \\   17  & 1 & \emph{variable }\texttt{a} \\   16   & 1 &  \emph{variable }\texttt{compteur} \\   };



En pratique, une telle procédure n'est pas isolée et il est courant qu'une procédure fasse appel à une autre procédure. Analysons ce cas de figure en utilisant l'exemple ci-dessous en python.


.. literalinclude:: asm/procedure-ex4.py

Dans ce programme, la procédure ``compte()`` incrémente le compteur et
la procédure ``oppose()`` inverse le signe de ce compteur. Après exécution
de la ligne ``3``, la variable compteur contient la valeur ``-1``. A la fin
du programme, cette variable contient la valeur ``0``. Nous pouvons maintenant essayer de convertir ce petit programme en minuscule assembleur.

		    
.. literalinclude:: asm/procedure-ex4.asm


Ce programme (téléchargeable via :download:`asm/procedure-ex4.asm`) utilise les mêmes variables en mémoire que le programme précédent. Son exécution démarre de la même façon. Il est intéressant d'observer le
premier appel à la procédure ``compte``. Au début de son exécution la mémoire contient les valeurs représentées en :numref:`fig-mem-ex4-a`.


.. _fig-mem-ex4-a:

.. tikz:: Contenu de la mémoire durant la première instruction de la procédure compte

   [cell/.style={rectangle,draw=black},
   space/.style={minimum height=1.5em,matrix of nodes,row sep=-\pgflinewidth,column sep=-\pgflinewidth,column 1/.style={font=\ttfamily}},text depth=0.5ex,text height=2ex,nodes in empty cells]

   \matrix (first) [space, column 1/.style={font=\ttfamily},column 2/.style={nodes={cell,minimum width=2em}}, column 3/.style={align=left}]
   {
   18   & 12 & \emph{adresse de retour } \\   17  & 1 & \emph{variable }\texttt{a} \\   16   & 0 &  \emph{variable }\texttt{compteur} \\   };


La procédure incrémente la valeur de la variable ``compteur``. Ensuite elle fait appel à la procédure ``oppose()``. Pour cela, elle sauvegarde l'adresse qui suit celle de l'instruction ``0;JMP``, dans ce cas l'adresse ``36``. Elle exécute ensuite l'instruction ``0;JMP``. A ce stade, la mémoire contient les valeurs représentées dans la :numref:`fig-mem-ex4-b`.
   
.. _fig-mem-ex4-b:

.. tikz:: Contenu de la mémoire durant la première instruction de la procédure compte

   [cell/.style={rectangle,draw=black},
   space/.style={minimum height=1.5em,matrix of nodes,row sep=-\pgflinewidth,column sep=-\pgflinewidth,column 1/.style={font=\ttfamily}},text depth=0.5ex,text height=2ex,nodes in empty cells]

   \matrix (first) [space, column 1/.style={font=\ttfamily},column 2/.style={nodes={cell,minimum width=2em}}, column 3/.style={align=left}]
   {
   18   & \textbf{36} & \emph{adresse de retour } \\   17  & 1 & \emph{variable }\texttt{a} \\   16   & 1 &  \emph{variable }\texttt{compteur} \\   };


La procédure ``oppose()`` s'exécute et place la valeur ``-1`` dans la variable ``compteur``. Il ne lui reste plus qu'à retourner au programme appelant, c'est à dire dans le corps de la procédure ``compte()``. L'adresse ``36`` est donc chargée de la mémoire et l'instruction ``0;JMP`` est exécutée. Les trois instructions qu'il reste à exécuter dans la procédure ``compte()`` sont les suivantes :

.. code-block:: console

   (SUIVANT)                                   
       @retour                 // adresse 36
       A=M	
       0;JMP

Ces instructions vont recharger la valeur stockée à l'adresse de retour, c'est-à-dire ``36`` et ensuite l'instruction ``0;JMP`` va redémarrer l'exécution des instructions à cette adresse. Nous avons malheureusement construit une boucle infinie...

Le problème que nous observons est dû au fait qu'en sauvegardant l'adresse de retour dans la procédure ``compte()`` pour supporter l'appel à la procédure ``oppose()``, on écrase l'adresse qui devait permettre à la procédure ``compte()`` de retourner au bon endroit du programme appelant. Pour supporter une procédure qui appelle une autre procédure, nous avons besoin de stocker deux adresses de retour. Mais il est aussi possible qu'une procédure appelle une procédure qui elle-même appelle une autre procédure, ... En toute généralité la succession des appels de procédure n'est pas nécessairement bornée. De plus, une procédure ``p1()`` peut appeler une procédure ``p2()``, mais cette procédure ``p2()`` peut aussi être appelée par la procédure ``p4()`` qui elle-même est une procédure appelée par ``p5()`` qui est appelée par la procédure ``p1()``. Il suffit pour s'en convaincre de regarder le nombre d'appels à des fonctions de type ``print`` qu'un programme peut contenir.

.. spelling::

   push
   pop
   stack

Avant d'appeler une procédure, nous devons trouver une moyen pour sauvegarder l'adresse de retour de cette procédure. Lors de son exécution, notre procédure peut aussi sauvegarder des adresses de retour, mais à la fin de son exécution nous devons pouvoir récupérer l'adresse de retour que nous avions sauvegardée. Cela correspond au fonctionnement d'une :term:`pile` (`stack` en anglais). Une pile est une structure de données permettant de stocker un nombre quelconque de données. Elle supporte deux opérations: l'ajout d'une donnée au sommet de la pile (``push`` en anglais) et le retrait de la donnée se trouvant au sommet de la pile (``pop`` en anglais).

.. TODO exemple de pile avec push et pop, peut-être dessin avec des assiettes ou autre

La pile la plus connue dans la vie de tous les jours est la pile d'assiettes. Lorsque l'on a besoin d'un assiette, on prend celle qui se trouve au sommet de la pile. Après avoir fait la vaiselle, on remet les assiettes propres au sommet de la pile également. Pour bien comprendre le fonctionnement d'une structure de données en pile en informatique, il suffit de se rappeler comment on manipule une pile d'assiettes...
   

.. note:: Comment stocker une pile de mots en mémoire ?

	  
   La solution la plus simple pour stocker et manipuler une pile de mots
   en minuscule assembleur est d'utiliser une zone de mémoire contiguë. Une première approche est d'utiliser l'adresse ``p`` pour stocker l'élément se trouvant en bas de la pile et d'ajouter les éléments suivants aux adresses ``p+1``,  ``p+2``, ... Pour illustrer cette approche, la :numref:`fig-stack-up` présente l'évolution d'une pile initialement vide lors de l'exécution de la séquence ``push(3) ; pop ; push(2) ; push(5)`` d'opérations. Avec cette approche, le sommet de la pile est toujours l'élément dont l'adresse est numériquement la plus élevée.

   .. _fig-stack-up:

   .. tikz:: Evolution de la pile vers les adresses numériquement croissantes

      [cell/.style={rectangle,draw=black},
      space/.style={minimum height=1.5em,matrix of nodes,row sep=-\pgflinewidth,column sep=0.5cm,column 1/.style={font=\ttfamily}},text depth=0.5ex,text height=2ex,nodes in empty cells]

      \matrix (first) [space, column 1/.style={font=\ttfamily,minimum width=3em},column 2/.style={nodes={cell,minimum width=2em}}, column 3/.style={nodes={cell,minimum width=2em}}, column 4/.style={nodes={cell,minimum width=2em}},column 5/.style={nodes={cell,minimum width=2em}}, column 6/.style={nodes={cell,minimum width=2em}}]
      {
      p+2   &  &  &  &   &   &\\
      p+1  &  &   &  &   & 5 &\\
      p   &  &  3 &  & 2 & 2 &\\};

   Outre les données, une telle structure doit également stocker l'adresse de l'élément se trouvant au sommet de la pile. Après l'opération ``push(3)`` le sommet de la pile est à l'adresse ``p``. Il est à la même adresse après l'opération ``push(2)`` et atteint l'adresse ``p+1`` après l'opération ``push(5)``. 
   
   Une seconde approche est d'utiliser l'adresse ``p`` pour stocker le premier élément de la pile et d'ajouter les éléments suivants aux adresses ``p-1``,  ``p-2``, ... La :numref:`fig-stack-up` illustre l'évolution d'un telle pile lors de l'exécution des opérations suivantes: ``push(3) ; pop ; push(2) ; push(5)``. Avec cette approche, l'élément se trouvant au sommet de la pile est celui dont l'adresse est numériquement la plus basse.


   .. _fig-stack-down:

   .. tikz:: Evolution de la pile vers les adresses numériquement décroissantes

      [cell/.style={rectangle,draw=black},
      space/.style={minimum height=1.5em,matrix of nodes,row sep=-\pgflinewidth,column sep=0.5cm,column 1/.style={font=\ttfamily}},text depth=0.5ex,text height=2ex,nodes in empty cells]

      \matrix (first) [space, column 1/.style={font=\ttfamily},column 2/.style={nodes={cell,minimum width=2em}}, column 3/.style={nodes={cell,minimum width=2em}}, column 4/.style={nodes={cell,minimum width=2em}},column 5/.style={nodes={cell,minimum width=2em}}, column 6/.style={nodes={cell,minimum width=2em}}]
      {
      p     &  & 3  &  & 2 & 2  &\\
      p-1   &  &    &  &   & 5 &\\
      p-2   &  &    &  &   &  &\\};
      

   Outre les données, cette structure doit également stocker l'adresse de l'élément se trouvant au sommet de la pile. Après l'opération ``push(3)`` le sommet de la pile est à l'adresse ``p``. Il est à la même adresse après l'opération ``push(2)`` et atteint l'adresse ``p-1`` après l'opération ``push(5)``. 

   Même si la première solution peut paraître la plus naturelle par analogie aux piles d'assietes, c'est généralement la deuxième solution qui est préférée car elle facilite la gestion de la mémoire et maximise l'espace qui est disponible pour la pile sans inutilement contraindre la mémoire utilisée par un programme.


Avant de modifier notre programme pour y intégrer une pile, il est intéressant de réfléchir à la façon dont on peut implémenter une pile d'entiers en utilisant le minuscule assembleur. Les deux opérations que nous devons supporter sont :

 - ``push(x)`` place au sommet de la pile la valeur ``x``. Après l'exécution de ``push``, la pile contient un élément de plus.
 - ``y=pop()`` récupère la valeur se trouvant au sommet de la pile et la retire. Cette opération ne peut être réalisée que sur une pile qui contient au moins un élément. Après l'exécution de ``pop``, la pile contient un élément de moins.


Pour implémenter ces deux opérations, nous adoptons la représentation de la pile qui démarre aux adresses hautes et réservons 10 mots en mémoire pour stocker notre pile en supposant qu'elle ne contiendra jamais plus d'éléments. Nous supposons également que cette zone mémoire commence à l'adresse 1000. De plus, la variable ``pile`` contient à tout moment l'adresse de l'élément se trouvant au sommet de la pile.    

   .. _fig-stack-down-1000:

   .. tikz:: Pile pouvant stocker mots éléments

      [cell/.style={rectangle,draw=black},
      space/.style={minimum height=1.5em,matrix of nodes,row sep=-\pgflinewidth,column sep=0.5cm,column 1/.style={font=\ttfamily}},text depth=0.5ex,text height=2ex,nodes in empty cells]

      \matrix (first) [space, column 1/.style={font=\ttfamily},column 2/.style={nodes={cell,minimum width=2em}}]
      {
      1000     & 0 \\
       999     & 0 \\
       998     & 0 \\
       997     & 0 \\
       996     & 0 \\
       995     & 0 \\
       994     & 0 \\
       993     & 0 \\
       992     & 0 \\
       991     & 0 \\
       };

       
      \matrix (second) [below=of first.south, space, column 1/.style={font=\ttfamily},column 2/.style={nodes={cell,minimum width=2em}}]
      {
      pile     & 1000 \\
      };

Avant d'écrire les opérations ``push`` et ``pop`` en minuscule assembleur, nous devons encore déterminer où doit se trouver la valeur que ``push`` sauve sur le stack et où l'opération ``pop`` va sauver le mot qui se trouvait au sommet de la pile. Dans ces deux cas, nous choisissons le registre ``D``. Celui-ci devra contenir l'entier à écrire sur la pile avant d'exécuter le code correspondant à l'opération ``push``. De façon similaire, l'opération ``pop`` se terminera en laissant la valeur se trouvant au sommet de la pile dans le registre ``D``. A tout moment, la variable ``pile`` contiendra l'adresse de l'élément se trouvant au sommet de la pile. 

 
Nous pouvons maintenant écrire les instructions pour implémenter l'opération ``push``. Il faut tout d'abord décrémenter la variable qui contient le sommet de la pile pour "faire de la place" pour ce nouvel élément. Comme notre pile grandit en mémoire vers les adresses basses, il suffit pour cela de décrémenter l'adresse contenue dans la variable ``pile``. Nous devons ensuite sauvegarder la valeur se trouvant dans le registre ``D`` à cette adresse. 

.. code-block:: console

   // opération push		
            // D contient l'entier à placer au sommet de la pile
   @pile
   M=M-1    // libération d'une place au sommet de la pile 	
   @pile
   A=M 	    // l'adresse contenue dans la variable pile est placée dans A
   M=D      // sauvegarde de la valeur contenue dans le registre D		  

L'opération ``pop`` est assez proche. Nous devons d'abord récupérer la valeur se trouvant à l'adresse contenue dans le registre ``pile`` et la placer dans le registre ``D``. Ensuite, il faut indiquer que l'élément qui était au sommet de la pile ne s'y trouve plus. Pour cela, il suffit d'incrémenter l'adresse contenue dans la variable ``pile`` puisque notre pile grandit vers les adresses basses.


.. code-block:: console

   // opération pop
                
   @pile
   A=M        // chargement de l'adresse contenue dans la variable pile
   D=M	      // sauvegarde de la donnée se trouvant au sommet de la pile       
   @pile
   M=M+1      // libération de la place correspondant au sommet de la pile
              // la donnée lue au sommet de la pile est dans le registre D


Le programme ci-dessous (téléchargeable depuis :download:`asm/pile-exemple.asm`) illustre le fonctionnement d'une telle pile.

.. literalinclude:: asm/pile-exemple.asm
	      
   
Durant son exécution, la mémoire d'un de nos programmes en minuscule assembleur comprendra trois parties. Tout d'abord, le bas de la mémoire (adresses de ``0`` à ``15``) est réservé pour stocker des valeurs particulières. Le livre en définit plusieurs dans les derniers chapitres. Nous en discuterons prochainement. La deuxième partie de la mémoire contient les variables, tableaux et chaînes de caractères utilisés par le programme. Dans le minuscule assembleur, cette zone démarre à l'adresse ``16`` et peut grandir vers le haut si le programme a besoin de plus de mémoire (nous ne discuterons pas de ce cas de figure dans ce cours introductif, mais vous en entendrez parler l'an prochain en langage C notamment). La dernière partie de la mémoire est réservée à la pile. Celle-ci démarre à une adresse haute et grandit vers le bas au fur et à mesure que l'on y stocke des adresses et des données. Nous verrons que cette pile a de nombreuses utilisations en assembleur et par extension dans les langages de programmation.

   
   .. _fig-memoire:

   .. tikz:: Organisation de la mémoire de données d'un programme

      \draw (2,0) -- (4,0) -- (4,3) ;
      \draw[dashed] (4,3) -- (4,4);
      \draw[dashed] (2,3) -- (2,4);
      \draw (4,4) -- (4,6) -- (2,6) -- (2,4);
      \draw (2,3) -- (2,0);
      \draw[color=red,<->] (4.1,0) -- (4.1,1) node [midway, below,rotate=90] {\small{rés.}};
      \draw[color=red] (2,1) -- (4,1);

      \draw[color=green,->] (4.1,1) -- (4.1,3) node[midway,below,rotate=90] {\small{var., \ldots}} ;

      \draw[color=blue,->] (4.1,6) -- (4.1,4) node [midway,below, rotate=90] {pile};

      \node at (1,0) {\small{\texttt{0}}};
      \node at (1,1) {\small{\texttt{16}}};
      \node at (1,6) {\small{\texttt{16383}}};

Pour pouvoir utiliser cette pile, nous devons d'abord convenir de l'adresse qui correspond au sommet de la pile. Nous prenons la convention de débuter la pile à l'adresse la plus haute en mémoire RAM, ``16383``. 
      
Nous pouvons maintenant réécrire notre programme en assembleur en utilisant cette pile. Le livre réserve l'adresse ``0`` en mémoire de données pour stocker l'adresse du sommet de la pile. Grâce à cette pile, nous pouvons réécrire les fonctions ``compte`` et ``oppose``.


La fonction ``oppose`` est la plus simple. Elle calcule d'abord l'opposé de la variable ``compteur``. Ensuite, elle récupère sur le pile l'adresse de retour et incrémente l'adresse du sommet de pile. Elle se termine par un saut à cette adresse de retour.

La fonction ``compte`` est un peu plus compliquée puisqu'elle contient un appel à la fonction ``oppose`` et qu'elle doit retourner au programme appelant. Elle incrémente d'abord la valeur de la variable ``compteur``. Ensuite, elle sauve l'adresse de retour sur la pile avant d'appeler la procédure ``oppose``. Au retour de celle-ci, elle récupère l'adresse de retour qui est au sommet de la pile pour retourner au programme appelant.


Le programme complet est repris ci-dessous. Il est téléchargeable depuis :download:`asm/procedure-pile.asm`. 

.. literalinclude:: asm/procedure-pile.asm


Grâce à cette pile, il est possible d'écrire des programmes qui contiennent un nombre quelconque de procédures qui s'appellent l'une l'autre et dans un ordre quelconque. La pile grandira au fur et à mesure des appels successifs à des procédures et rétrécira chaque fois qu'une procédure se termine. Il est important de noter que pour que ce système fonctionne correctement il est nécessaire que chaque procédure manipule correctement la pile. Si le sommet de la pile se situe à l'adresse ``A`` au début de l'exécution d'une procédure, à la fin de celle-ci la pile dont contenir exactement les mêmes informations. Si une procédure laissait la pile avec un élément en plus ou un élément en moins lorsqu'elle retourne à l'adresse de retour dans le programme appelant, alors le programme complet ne fonctionnerait plus correctement. Pour s'en rendre compte, il suffit de prendre le programme ci-dessous et de l'exécuter après avoir par exemple remplacé une des instructions qui modifie la pile dans les fonctions ``compte`` ou ``oppose``. Il faut être très rigoureux lorsque l'on écrit des programmes en langage assembleur qui manipulent la pile.

.. spelling::

   Stack
   overflow

.. note:: Stack overflow

   Les langages de programmation tels que :term:`python` utilisent aussi une pile pour supporter les appels de procédures et de fonctions. C'est à l'interpréteur ou au compilateur de gérer correctement la pile. En général, le langage de programmation réserve une zone mémoire pour stocker la pile du programme. Certains langages de programmation comme :term:`python` ou :term:`Java` vérifient que la pile ne déborde pas lors de l'exécution d'un programme. Le cas échéant, ils lancent une exception qui indique un dépassement de pile (`stack overflow` en anglais) et le programme est arrêté. Pour cela, ils doivent vérifier l'état de la pile avant chaque opération ``push`` ou ``pop``. D'autres langages de programmation comme le :term:`C` ne vérifient pas la taille de la pile à chaque opération. Avec ces langages, il est possible que la pile croisse tellement qu'elle rencontre la zone contenant les données du programme. Dans ce cas, le programme aura un comportement totalement incohérent. Certaines attaques sur des programmes écrits en :term:`C` exploitent ce genre de limitations du langage.

   	  
Nous avons utilisé la pile pour stocker les adresses de retour des procédures. En assembleur, et par extension dans la plupart des langages de programmation, la pile joue un rôle fondamental. C'est grâce à la pile que nous allons pouvoir également supporter les fonctions auxquelles il faut passer des arguments du programme appelant vers la fonction, mais aussi récupérer des valeurs de retour. Il faut aussi permettre à une fonction d'utiliser de la mémoire pour stocker des données temporaires pendant son exécution et de libérer correctement cette mémoire après.

Revenons à un exemple simple en python pour bien comprendre ce qu'il se passe avec des fonctions. Notre première fonction, ``f1``, prend un entier en argument et retourne un entier également. Durant son exécution, elle utilise une variable locale, ``y``. La deuxième fonction, ``f2`` prend également un entier en argument et retourne un résultat entier. Le corps de la fonction ``f2`` fait deux appels à la fonction ``f1`` et utilise deux variables locales. Enfin, la fonction ``min`` prend deux arguments entiers et retourne un résultat entier. Elle utilise une variable locale.


.. literalinclude:: python/fonctions.py


Pour supporter ces différents types de fonctions, nous devons répondre à trois questions :

  1. Comment un programme appelant peut-il passer les arguments à une fonction ?
  2. Comment un programme appelant peut-il récupérer le résultat d'une fonction ?
  3. Comment une fonction peut-elle utiliser de la mémoire pour stocker ses variables locales ?


Commençons par la première question. Avant d'appeler une fonction, il est nécessaire d'avoir d'abord calculé les valeurs des arguments que l'on doit passer à cette fonction. Une fonction peut avoir un, deux, ou un nombre quelconque d'arguments. Ceux-ci devront être placés en mémoire dans une zone qui est accessible à la fonction lors de son exécution. Notre fonction doit déjà récupérer l'adresse de retour sur la pile. Les arguments de la fonction seront également placés sur la pile, dans l'ordre dans lequel ils sont passés à la fonction. Durant son exécution, la fonction pourra facilement récupérer ses arguments depuis la pile.

Pour le résultat de la fonction, deux approches sont possibles. La première est d'utiliser la pile pour retourner ce résultat. La seconde est de placer le résultat de la fonction dans un registre du processeur. La première solution a l'avantage de permettre à une fonction de retourner plusieurs résultats, comme en python par exemple. La seconde est utilisée par de très nombreux langages de programmation. C'est celle que nous adoptons dans ce chapitre. Par convention, une fonction écrite en minuscule assembleur retournera un seul mot de 16 bits et celui-ci sera placé dans le registre ``D`` qui est le seul registre vraiment utilisable sur le minuscule processeur.

Commençons par la fonction ``f1`` pour illustrer le passage des arguments et
de la valeur de retour d'une fonction simple. Pour le passage des arguments, nous devons convenir de l'ordre dans lequel ceux-ci et l'adresse de retour doivent être placés sur la pile. Le livre de référence choisit de placer d'abord les arguments et ensuite l'adresse de retour. Lors d'un appel à la fonction ``f1(7)``, la pile ressemblera à la :numref:`fig-pile-avant-f1` où ``sp`` est l'adresse du sommet de la pile.


.. _fig-pile-avant-f1:

.. tikz:: Contenu de la pile lors de l'appel à la fonction ``f1``

   [cell/.style={rectangle,draw=black},
   space/.style={minimum height=1.5em,matrix of nodes,row sep=-\pgflinewidth,column sep=-\pgflinewidth,column 1/.style={font=\ttfamily}},text depth=0.5ex,text height=2ex,nodes in empty cells]

   \matrix (first) [space, column 1/.style={font=\ttfamily},column 2/.style={nodes={cell,minimum width=2em}}, column 3/.style={align=left}]
   {
   sp+2   & - &  \emph{pile de la fonction appelante} \\
   sp+1  & 7 & \emph{argument }\texttt{x} \\ 
   sp   & \textbf{20} & \emph{adresse de retour} \\ 
   };


Pour récupérer son argument, la fonction ``f1`` doit donc lire l'information se trouvant à l'adresse ``sp+1`` tandis que l'adresse de retour se trouve au sommet de la pile. Le programme complet est téléchargeable via :download:`asm/f1.asm`.

.. literalinclude:: asm/f1.asm

Il est intéressant d'examiner un peu plus en détails l'implémentation de la fonction ``f1``. Tout d'abord, notre fonction doit récupérer son argument. Celui-ci étant le deuxième élément sur la pile, il suffit de mettre son adresse dans le registre ``A``. C'est ce que font les deux premières instructions de notre fonction. Après l'exécution de ces deux instructions, le registre ``A`` contient l'adresse de la zone mémoire contenant l'argument de la fonction ``f1``. Pour incrémenter cet argument, il nous suffit de calculer ``M+1``. Comme le résultat de ce calcul est aussi la valeur de retour de la fonction ``f1``, il suffit de le stocker dans le registre ``D``. En trois lignes nous avons donc implémenté le corps de la fonction. Il nous reste ensuite à récupérer l'adresse de retour de la fonction ``f1`` sur la pile et de retirer cette adresse ainsi que l'argument pour que la fonction appelante retrouve la pile dans l'état dans lequel celle-ci se trouvait avant l'appel à ``f1``. Toutes ces opérations doivent se faire sans utiliser le registre ``D`` puisque celui-ci contient déjà la valeur retournée par notre fonction. Les trois instructions suivantes (``@SP``, ``M=M+1`` et ``M=M+1``) modifient l'adresse du sommet de pile et "suppriment" donc l'adresse et l'argument qui s'y trouvent. Il est utile de noter qu'il suffit d'incrémenter l'adresse contenue dans ``SP`` pour retirer un élément sur la pile. Il n'est pas nécessaire de remplacer la valeur qui s'y trouve par zéro. Mettre cette valeur à zéro serait une perte de temps et donc de performance. Après l'exécution de ces trois instructions, ``SP`` contient la bonne valeur. Il nous reste à récupérer l'adresse de retour. Si ``X`` est l'adresse actuelle du sommet de la pile, alors l'adresse de retour se trouver à l'adresse ``X-2``. Les quatre instructions qui suivent permettent de récupérer cette adresse et de la stocker dans le registre ``A`` pour pouvoir exécuter un saut vers cette adresse sans utiliser le registre ``D``.

Nous pouvons maintenant analyser une fonction qui prend deux arguments comme celle qui calcule le minimum. 

.. literalinclude:: asm/min.asm

		    
L'implémentation de cette fonction en minuscule assembleur est téléchargeable via :download:`asm/min.asm`. Le script de test est téléchargeable via :download:`asm/min.tst`. Par rapport à la fonction ``f1`` que nous avons présentée précédemment, il faut regarder comment chaque argument est récupéré de la pile. A la fin de l'exécution de la fonction ``min``, il faut retirer les trois éléments qui avaient étés placés sur la pile par le programme appelant. De cette façon, le programme qui a appelé la fonction ``min`` retrouve la pile dans l'état dans lequel elle se trouvait avant l'appel à la fonction.

.. note:: Utilisation de la pile par une fonction

   Une fonction telle que ``f1`` ou ``min`` qui utilise la pile doit respecter plusieurs principes pour garantir le bon fonctionnement du programme qui l'a appelée :

     1. La fonction ne peut accéder aux éléments qui ont été placés sur la pile `avant` ses arguments et son adresse de retour. Les informations qui se trouvent dans le bas de la pile sont nécessaires à l'exécution d'autres fonctions et ne peuvent en aucun cas être modifiées par la fonction.
     2. La fonction peut rajouter des éléments sur la pile, soit directement soit en appelant d'autres fonctions. Cela implique que l'adresse du sommet de pile peut changer `durant`  l'exécution de la fonction. Quelles que soient les modifications qu'elle fait à la pile, la fonction doit garantir qu'après `n'importe laquelle` de ses exécutions la pile retrouvera l'état qu'elle avait avant l'appel à la fonction.

  Si un de ces principes n'est pas respecté par une fonction, le programme qui utilise cette fonction risque d'avoir un comportement erratique voire totalement incorrect. C'est le développeur d'une fonction en assembleur qui doit garantir la correction de sa fonction pour toutes ses exécutions possibles. Comme dans des langages de programmation de plus haut niveau, les tests les plus exhaustifs possibles sont une excellente façon de vérifier le bon fonctionnement d'un fonction. Notez qu'il existe également des techniques qui permettent de prouver la correction d'une fonction, mais celles-ci sortent largement du cadre de ce document.	

.. passage par valeur et passage par référence ou adresse

Dans notre implémentation des fonctions ``f1`` et ``min``, nous avons utilisé la technique du :term:`passage par valeur`, c'est-à-dire que lorsqu'elle est appelée, une fonction reçoit du programme appelant les valeurs de ses argumentsr. Ces valeurs sont copiées sur la pile par le programme appelant et utilisées par la fonction. Cette technique est utilisée par de nombreux langages de programmation comme python lorsque l'on passe des valeurs d'un type primitif comme des réels ou des entiers à une fonction.

Il existe une seconde technique pour passer les arguments à une fonction. C'est le :term:`passage par référence`. Dans ce cas, le programme appelant fournit à la fonction qu'il appelle une référence vers son argument. Cette référence est l'adresse en mémoire à laquelle la variable contenant l'argument est stockée. La différence fondamentale entre le :term:`passage par référence` et le :term:`passage par valeur` est que comme la fonction connaît l'adresse de la variable contenant son argument, elle peut modifier son contenu alors que c'est impossible avec le passage par valeur. En python, le :term:`passage par référence` est utilisé lorsque l'argument passé à une fonction est une référence à un objet ou une liste. Il est possible de mixer le passage par référence et le passage par valeur dans une même fonction avec un argument entier passé par valeur et une liste passée par référence.


A titre d'illustration, la fonction ``inc`` ci-dessous permet d'incrémenter la variable dont l'adresse est passée par le programme appelant comme argument. Le cors de la fonction ``inc`` accède à l'adresse de la variable utilisée par le programme appelant et modifie sa valeur avant de terminer son exécution.


.. literalinclude:: asm/inc.asm


Le programme complet (:download:`asm/inc.asm`) et son script de test (:download:`asm/inc.tst`) sont téléchargeables.  		    
  
		    
Nous devons maintenant trouver une réponse à la troisième question. Lors de son exécution, une fonction doit souvent utiliser de la mémoire, pour stocker des résultats intermédiaires de calculs ou des variables locales. C'est le cas de la fonction ``fct`` dans l'exemple en python ci-dessous. Celle-ci a besoin de mémoire pour réaliser les calculs qui se trouvent dans son corps. Il en va de même par exemple pour une fonction qui contiendrait une simple boucle. 


.. literalinclude:: python/fonctions-var.py


Chacune des variables locales d'une fonction doit être stockée à une adresse mémoire. Une première approche naïve pour résoudre ce problème serait de réserver une zone de mémoire fixe pour les variables locales utilisées par chaque fonction. Dans une implémentation en assembleur de l'exemple ci-dessus, on pourrait réserver une adresse en mémoire RAM pour la variable ``r`` de la fonction ``fct``. Malheureusement, cette approche a deux inconvénients. Premièrement, toute la mémoire qu'une fonction peut utiliser durant son exécution doit être réservée en RAM avant de pouvoir exécuter cette fonction. Si une fonction doit utiliser un grand tableau lorsqu'elle est appelée avec une valeur spécifique d'un argument, alors la zone nécessaire pour ce tableau doit toujours être réservée, même si la fonction n'est jamais exécutée par le programme. Le deuxième inconvénient est qu'il est impossible avec cette approche de supporter une fonction ``f`` qui appelle une fonction ``g`` qui elle-même appelle une fonction  ``f`` car le premier appel à la fonction ``f`` aura initialisé les "variables locales de la fonction ``f``" puis fera appel à la fonction ``g``. Lorsque ``g`` fait appel de son côté à la fonction ``f``, cette seconde invocation de la fonction ``f`` va modifier les données stockées aux adresses en mémoire qui correspondent à ses variables locales et donc modifier les variables utilisées par la première invocation de la fonction ``f``. Si ce second inconvénient peut paraître un peu théorique et hypothétique à ce stade, il est malheureusement bien réel en pratique.

On peut éviter ces deux inconvénients en utilisant la pile comme mémoire pour stocker les variables locales d'une fonction. La pile n'utilise la RAM que durant l'exécution de la fonction, il n'y a donc pas de gaspillage de mémoire comment avec la solution précédente. Dans le cas où une invocation de la fonction ``f`` appelle la fonction ``g`` qui appelle elle-même la fonction ``f``, le bas de la pile contiendra les arguments, adresse de retour et variables de la première invocation de la fonction ``f``. Au-dessus de ces informations, on trouvera les arguments, adresses de retour et variables locales de la fonction ``g``. Enfin, les arguments, adresse de retour et variables locales de la seconde invocation de la fonction ``f`` sont au sommet de la pile. A la fin de son exécution, cette invocation de la fonction ``f`` libère la mémoire qu'elle utilise sur la pile.

La meilleure illustration de l'utilisation de la pile par les fonctions en assembleur est le support des fonctions récursives. En informatique, on parle de :term:`récursion` lorsqu'une fonction s'appelle elle-même. C'est le cas par exemple de la fonction ``sumn`` qui permet de calculer la somme des ``n`` premiers naturels.


.. literalinclude:: python/sumn.py


Cette fonction peut être traduite en minuscule assembleur. Il y a trois parties distinctes dans cette fonction récursive. La première, généralement baptisée le cas de base, est la partie du code qui calcule la valeur de retour lorsque l'argument de la fonction est nul. Les premières instructions récupèrent l'argument de la pile et le placent dans le registre ``D``. Si celui-ci est nul, il contient déjà la valeur de retour (``0``). Il suffit ensuite d'exécuter les instructions qui permettent de retirer l'argument et l'adresse de retour de la pile et ensuite de retourner au programme appelant.

La deuxième partie de la fonction ``sumn`` est l'appel récursif (à partir de l'étiquette ``RECURSION``). Dans ce cas, nous commençons par décrémenter l'argument qui avait préalablement été placé dans le registre ``D``. La valeur calculée est celle qui est passée à l'appel ``sumn(n-1)``. Elle est placée sur la pile ainsi que l'adresse de retour (``RETSUMN``).

La troisième partie de la fonction ``sumn`` est le retour de l'appel récursif (après ``RETSUMN``). Nous recevons dans le registre ``D`` le résultat du calcul de ``sumn(n-1)``. Il nous reste à y additionner la valeur de l'argument qui se trouve sur la pile. Cette addition est réalisée par les trois premières instructions de cette partie. Ensuite, il suffit de retirer l'argument et l'adresse de retour de la pile pour retourner au programme appelant.

.. literalinclude:: asm/sumn.asm


Ce programme (:download:`asm/sumn.asm`) et son script de test (:download:`asm/sumn.tst`) sont téléchargeables.		    

Pour bien comprendre le fonctionnement d'un tel programme récursif et son utilisation de la pile, il est intéressant d'observer son exécution pas à pas en parallèle avec l'évolution de la pile. La :numref:`fig-pile-avant-sumn` présente l'état de la pile lors de l'appel à la fonction ``sumn`` avec ``3`` comme argument. Par convention, le sommet de la pile se trouve en bas de la figure et utilise une police de caractères grasse. 

.. _fig-pile-avant-sumn:

.. tikz:: Contenu de la pile lors de l'appel à la fonction sumn(3)

   [cell/.style={rectangle,draw=black},
   space/.style={minimum height=1.5em,matrix of nodes,row sep=-\pgflinewidth,column sep=-\pgflinewidth,column 1/.style={font=\ttfamily}},text depth=0.5ex,text height=2ex,nodes in empty cells]

   \matrix (first) [space, column 1/.style={font=\ttfamily},column 2/.style={nodes={cell,minimum width=7em}}, column 3/.style={align=left}]
   {
   16382  & 3 & \emph{argument } \\ 
   \textbf{16381}   & \textbf{RETOUR} & \emph{adresse de retour} \\ 
   };

Durant son exécution, cette fonction fait appel à ``sumn(2)``. La :numref:`fig-pile-avant-sumn2` présente l'état de l'appel au moment de cet appel.
   
.. _fig-pile-avant-sumn2:

.. tikz:: Contenu de la pile lors de l'appel à sumn(2)

   [cell/.style={rectangle,draw=black},
   space/.style={minimum height=1.5em,matrix of nodes,row sep=-\pgflinewidth,column sep=-\pgflinewidth,column 1/.style={font=\ttfamily}},text depth=0.5ex,text height=2ex,nodes in empty cells]

   \matrix (first) [space, column 1/.style={font=\ttfamily},column 2/.style={nodes={cell,minimum width=7em}}, column 3/.style={align=left}]
   {
   16382  & 3 & \emph{argument } \\ 
   16381   & RETOUR & \emph{adresse de retour} \\
   16380  & 2 & \emph{argument } \\
   \textbf{16379}   & \textbf{RETSUMN} & \emph{adresse de retour} \\
   };
   

Lors de son exécution, l'invocation de la fonction ``sumn`` avec ``2`` comme argument va d'abord faire appel à ``sumn(1)``. La :numref:`fig-pile-avant-sumn1` présente l'état de l'appel au moment de cet appel.

.. _fig-pile-avant-sumn1:

.. tikz:: Contenu de la pile lors de l'appel à sumn(1)

   [cell/.style={rectangle,draw=black},
   space/.style={minimum height=1.5em,matrix of nodes,row sep=-\pgflinewidth,column sep=-\pgflinewidth,column 1/.style={font=\ttfamily}},text depth=0.5ex,text height=2ex,nodes in empty cells]

   \matrix (first) [space, column 1/.style={font=\ttfamily},column 2/.style={nodes={cell,minimum width=7em}}, column 3/.style={align=left}]
   {
   16382  & 3 & \emph{argument } \\ 
   16381   & RETOUR & \emph{adresse de retour} \\
   16380  & 2 & \emph{argument } \\
   16379   & RETSUMN & \emph{adresse de retour} \\
   16378  & 1 & \emph{argument } \\
   \textbf{16377}   & \textbf{RETSUMN} & \emph{adresse de retour} \\
   };


Lors de son exécution, l'invocation de la fonction ``sumn`` avec ``1`` comme argument va d'abord faire appel à ``sumn(0)``. La :numref:`fig-pile-avant-sumn0` présente l'état de l'appel au moment de cet appel.


.. _fig-pile-avant-sumn0:

.. tikz:: Contenu de la pile lors de l'appel à sumn(0)

   [cell/.style={rectangle,draw=black},
   space/.style={minimum height=1.5em,matrix of nodes,row sep=-\pgflinewidth,column sep=-\pgflinewidth,column 1/.style={font=\ttfamily}},text depth=0.5ex,text height=2ex,nodes in empty cells]

   \matrix (first) [space, column 1/.style={font=\ttfamily},column 2/.style={nodes={cell,minimum width=7em}}, column 3/.style={align=left}]
   {
   16382  & 3 & \emph{argument } \\ 
   16381   & RETOUR & \emph{adresse de retour} \\
   16380  & 2 & \emph{argument } \\
   16379   & RETSUMN & \emph{adresse de retour} \\
   16378  & 1 & \emph{argument } \\
   16377   & RETSUMN & \emph{adresse de retour} \\
   16376  & 0 & \emph{argument } \\
   \textbf{16375}   & \textbf{RETSUMN} & \emph{adresse de retour} \\
   };
   

Nous sommes maintenant dans l'éxécution de la fonction ``sumn(0)``. Celle-ci retourne la valeur ``0`` dans le registre ``D`` et retire les deux mots se trouvant au sommet de la pile. Elle retourne à l'adresse ``RETSUMN`` avec la pile dans l'état représenté à la :numref:`fig-pile-avant-sumn1`. Grâce à cette pile, la fonction ``sumn`` récupère son argument (``1``) et retourne la valeur ``1`` qui est la somme entre la valeur du registre ``D`` et son argument. A la fin de son exécution, cette invocation de la fonction ``sumn`` retire les deux mots qui se trouvaient au sommet de la pile.

L'état de la pile est maintenant celui de la :numref:`fig-pile-avant-sumn2` et le registre ``D`` contient la valeur ``1``. Nous sommes dans la dernière partie de l'invocation de la fonction ``sumn(2)``. Celle-ci calcule son résultat (``3``) et retire les deux mots se trouvant au sommet de la pile avant de faire un saut à l'adresse ``RETSUMN``.

Nous sommes maintenant dans l'invocation de la fonction ``sumn(3)``. L'état de la pile est celui de la :numref:`fig-pile-avant-sumn`. La fonction récupère son argument (``3``) et l'ajoute au résultat de la fonction appelée qu'elle a reçu dans le registre ``D`` (``3``). Le registre ``D`` contient maintenant le résultat final (``6``) de l'appel ``sumn(3)``. Il ne reste plus qu'à retirer les deux mots se trouvant au sommet de la pile et retourner à l'adresse ``RETOUR`` dans le programme appelant.


.. note::

   Pour aller au delà


   L'explication des fonctions récursives marque la fin de notre exploration des principes de fonctionnement des ordinateurs. Même si nous avons couvert différents aspects du fonctionnement des ordinateurs modernes, nous sommes loin d'en avoir fait le tour. Vous aurez d'autres occasions de compléter votre formation dans ce domaine passionnant dans la suite de vos études.

   En deuxième année du bachelier, vous apprendrez à exploiter les processeurs multi-coeurs en utilisant notamment le langage :term:`Java` dans le cours `Informatique 2 <https://uclouvain.be/cours-2020-LEPL1402>`_. Vous apprendrez aussi à programmer en langage :term:`C` dans le cours `Projet 3 <https://uclouvain.be/cours-2020-LEPL1503>`_. De nos jours, le langage :term:`C` est le langage de programmation qui remplace l'assembleur dans la plupart des cas où il est nécessaire de contrôler finement le matériel. Le cours de `Calculabilité, logique et complexité <https://uclouvain.be/cours-2020-LINFO1123>`_ vous permettra d'apprendre les bases théoriques de l'informatique et notamment un modèle théorique du fonctionnement des ordinateurs qui est la `machine de Turing`. Le cours de `Paradigmes de programmation et concurrence <https://uclouvain.be/cours-2020-LINFO1104>`_ vous permettra de mieux comprendre comment fonctionent les langages de programmation.

   En troisième année du bachelier, le cours de `Systèmes informatiques <https://uclouvain.be/cours-2020-LINFO1252>`_ vous permettra de comprendre comment fonctionne un :term:`système d'exploitation`. Vous aurez à nouveau l'occasion d'écrire des programmes en langage C et en assembleur mais sur des processeurs réels cette fois. Le cours de `Réseaux informatiques <https://uclouvain.be/cours-2020-LINFO1341>`_ vous permettra de comprendre comment les ordinateurs connectés à Internet peuvent s'échanger de l'information.

   En Master, le cours `Architecture and performance of computer systems <https://uclouvain.be/cours-2020-LINGI2241>`_ vous permettra de comprendre plus en profondeur les interactions entre le matériel et le logiciel et les facteurs qui influencent les performances d'un ordinateur. D'autres cours à option sont accessibles dans ce domaine comme `Design and Architecture of digital electronic systems <https://uclouvain.be/en-cours-2020-LELEC2531>`_ ou `Design of Embedded and real-time systems <https://uclouvain.be/cours-2020-LINGI2315>`_.

   
   En attendant, si vous cherchez des informations complémentaires, il existe de nombreux livres de références très complets :

     - la seconde partie du livre `The Elements of Computing Systems <https://www.nand2tetris.org>`_ écrit par Noam Nisan et Shimon Schocken et publié au MIT Press poursuit son exploration des ordinateurs en développant les différentes couches logicielles dont un assembleur et une machine virtuelle qui supporte un langage un peu plus faicle à utiliser que le minuscule assembleur. Cette machine virtuelle est ensuite utilisée pour implémenter un langage de programmation orienté objet simple et un petit système d'exploitation.
     - la série de livres `Computer Organization and Design - The Hardware/Software Interface` écrits par David Patterson et John Hennessy. Ces livres présentent le fonctionnement des ordinateurs en détaillant un microprocesseur particulier. Il en existe trois versions. La première, `Computer Organization and Design MIPS Edition <https://www.elsevier.com/books/computer-organization-and-design-mips-edition/patterson/978-0-12-820109-1>`_ se concentre sur les processeurs MIPS que l'on trouve dans différents types d'ordinateurs embarqués. La deuxième, `Computer Organization and Design RISC-V Edition <https://www.elsevier.com/books/computer-organization-and-design-risc-v-edition/patterson/978-0-12-820331-6>`_ s'appuie sur les nouveaux processeurs RISC-V dont toutes les spécifications sont disponibles en open-source. La troisième, `Computer Organization and Design ARM Edition <https://www.elsevier.com/books/computer-organization-and-design-arm-edition/patterson/978-0-12-801733-3>`_ présente les processeurs ARM que l'on retrouve sur la plupart des smartphones de nos jours. Une ancienne édition de ce livre a été traduite en français mais n'est malheureusement plus disponible. David Patterson et John Hennessy ont également écrit le livre `Computer Architecture : A quantitative approach <https://www.elsevier.com/books/computer-architecture/hennessy/978-0-12-811905-1>`_ qui fait référence dans le domaine, mais s'adresse plutôt à des étudiants de master ou des professionnels.

