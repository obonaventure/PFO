.. LSINC1102 documentation master file, created by
   sphinx-quickstart on Tue Jan 28 18:06:33 2020.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Compléments d'assembleur
========================


Le chapitre précédent a présenté les instructions de base du minuscule assembleur. Dans ce chapitre, nous allons d'abord voir comment notre minuscule ordinateur peut interagir avec le monde extérieur (écran et clavier) et ensuite comment manipuler des tableaux et des chaînes de caractères en mémoires.


Entrées-sorties
---------------

Un ordinateur doit interagir avec son environnement. Les ordinateurs actuels comprennent de très nombreux dispositifs pour interagir avec les humains et le monde extérieur via des capteurs, clavier, souris, écran, ... Le minuscule ordinateur se limite à deux dispositifs: un écran qui est son unique dispositif de sortie et un clavier qui est son unique dispositif d'entrée. Les principes que l'on va discuter pour ces deux dispositifs sont génériques et peuvent s'appliquer à d'autres dispositifs d'entrée ou de sortie. En anglais, on parle généralement de dispositifs d'I/O pour Input/Output.


Commençons par le clavier qui est le dispositif le plus simple. Un clavier peut s'interfacer de différentes façons avec un ordinateur. On peut voir un clavier comme une sorte de matrice dans laquelle chaque touche correspond à une position dans la matrice. Lorsqu'un utilisateur pousse sur une touche, l'élément correspondant de la matrice est mis à une valeur convenue. Si l'utilisateur pousse sur plusieurs touches, les positions correspondantes de la matrice sont modifiées. Cela permet de supporter des claviers avec des touches telles que `shift` ou `ctrl` dont la pression modifie le caractères correspondant à une autre touche. 

Le minuscule ordinateur prend une approche beaucoup plus simple. Il ne représente pas les touches tapées par l'utilisateur mais retourne directement le mot de 16 bits qui correspond au caractère tapé par l'utilisateur. Il reste cependant à déterminer comment un programme peut accéder à ce caractère. Pour cela, le minusscule ordinateur utilise la technique des :index:`entrées/sorties mappées en mémoire` (:index:`memory-mapped I/O` en anglais). Cette technique est à la fois très simple, mais aussi très fréquemment utilisée pour supporter de très nombreux dispositifs d'entrée-sortie.


Notre clavier contient un registre qui contient le code ASCII du caractère sur lequel l'utilisateur tape actuellement sur le clavier. Si l'utilisateur ne tape pas sur le clavier, celui-ci contient la valeur ``0``. En outre, le minuscule ordinateur définit les caractères de contrôle repris dans le :numref:`table-keyboard`.

.. _table-keyboard:

.. table:: Caractères de contrôle

   ================= ==========
   Touche            Code ASCII
   ----------------- ----------   
   retour à la ligne 128
   backspace         129
   flèche gauche     130
   flèche haut       131
   flèche droite     132
   flèche bas        133
   home              134
   end               135
   page up           136
   page down         137
   insert            138
   delete            139
   escape            140
   f1-f12            141-152
   ================= ==========


Lors de la construction du minuscule ordinateur, on a simplement réservé une adresse mémoire pour ce registre du clavier : l'adresse ``24576`` (``0x6000`` en hexadécimal). La mémoire du minuscule ordinateur a été conçue de façon à ce que lorsqu'un programme demande à lire le mot se trouvant à cette adresse, il lise le contenu du registre du clavier. 

Le programme ci-dessous présente un exemple simple de lecture de caractères depuis le clavier. Le compteur ``c`` compte simplement le nombre de fois qu'une touche a été pressée.


.. literalinclude:: asm/keyb.asm
   :language: console


Lorsque l'on exécute ce programme en utilisant le simulateur du minuscule CPU, on observe facilement que le computer n'est incrémenté qu'à condition que la touche soit pressée au moment où le programme lit le mot à l'adresse ``24576`` en mémoire. Dès que l'utilisateur arrête de pousser sur un touche, ce mot revient à la valeur ``0``. Cela implique que sur le minuscule ordinateur, il est nécessaire de consulter très régulièrement l'information stockée à cette adresse pour réagir à la pression d'une touche sur le clavier. C'est le rôle notamment du :index:`système d'exploitation`, mais cela sort du cadre de ce cours.

Cette technique de lecture de données sous la forme d'une boucle qui lit en permanence l'information mappée en mémoire à une adresse donnée s'appelle le :index:`polling`. Elle a l'avantage d'être très rapide puisqu'il suffit d'attendre le temps d'exécution de quelques instructions pour que la donnée soit disponible dans le programme. Elle est encore utilisée de nos jours lorsqu'il est nécessaire de réagir très rapidement sur certains dispositifs d'entrée. Malheureusement, elle souffre d'un inconvénient majeur. Le processeur doit en permanence consulter les adresses mappées en mémoire pour voir de l'information est disponible. Pour un dispositif tel que le clavier via lequel l'utilisateur pousse sur quelques touches chaque seconde, il n'est pas souhaitable que le processeur vérifie en permanence si une touche a été poussé et y consacre une bonne partie de sa puissance de calcul.

Pour éviter ce problème, les ordinateurs actuels supportent aussi les entrées-sorties par :index:`interruption`. Les détails de cette technique sortent du cadre de ce cours introductif. En simplifiant, l'idée de base des interruptions est la suivante. On ajoute sur le minuscule processeur un signal de contrôle baptisé interruption. Ce signal est connecté aux dispositifs d'entrée-sortie. Lorsqu'une nouvelle information est disponible sur un dispositif, celui-ci met le signal d'interruption à ``1``. Après l'exécution de chaque instruction, le processeur vérifie la valeur du signal d'interruption. Si celui-ci vaut ``0``, il continue l'exécution du programme en cours. Par contre, si le signal d'interruption vaut ``1``, le processeur sauvegarde la valeur actuelle du ``PC`` et passe à l'exécution d'un programme de traitement d'interruption. Ce programme, qui fait généralement partie du :index:`système d'exploitation` va consulter les différents dispositifs d'entrée-sortie pour voir quelle information est disponible et la traitera rapidement. Ensuite, il récupère l'ancienne valeur du ``PC`` et relance automatiquement l'exécution du programme qui avait été interrompu par l'interruption à l'adresse de l'instruction où il s'était arrêté. Un programme de traitement des interruptions doit être écrit avec précautions car il ne peut perturber le programme qui s'éxécutait au moment de l'interruption. 

La gestion de l'écran nous permet de voir comment gérer un dispositif de sortie sur le minuscule ordinateur. Tout comme pour le clavier, celui-ci utilise la technique des entrées-sorties mappées en mémoire. L'écran du minuscule ordinateur est un écran rectangulaire en noir et blanc de 256 pixels de haut et 512 pixels de large. Il est représenté par un bloc de 8192 adresses en mémoire à partir de l'adresse ``16384`` (``0x4000`` en hexadécimal) en RAM. La valeur de chaque pixel est encodé sur un bit (``1`` pour un pixel noir et ``0`` pour un pixel blanc). Voici un premier exemple qui remplit l'écran en noir en parcourant tous les pixels et toute la mémoire correspondant à l'écran.

.. literalinclude:: asm/screen.asm
   :language: console

En écrivant une donnée en mémoire, on peut donc afficher un pixel à l'écran. L'adresse ``16384`` correspond au pixel en au à gauche de l'écran. Si on attribue les coordonnées ``(0,0)`` à ce point et que l'axe des ordonnées (`y`) est croissant vers le bas tandis que celui des abscisses (`x`) est croissant vers la droite. Dans ce repère, le pixel en position `(x,y)` correspondant à l'adresse mémoire :math:`16384 + y \times 32 + x / 16` où `/` est le quotient de la division entière. Il y a donc 16 pixels qui sont encodés dans le même mot de 16 bits en mémoire. Dans celui-ci, le bit :math:`x \% 16` est celui qui correspond à notre pixel.

.. peut-être autre exemple avec le dessin d'une ligne, mais il faut des divisions

Utilisation des tableaux
------------------------

Jusque maintenant, nous avons manipulé des entiers qui correspondent chacun à une variable. Un ordinateur doit également pouvoir traiter des objets mathématiques tels que les vecteurs et les matrices. Ceux-u doivent être stockés en mémoire.

Commençons par analyser la façon dont un programme peut manipuler les coordonnées `(x,y)` d'un pixel à l'écran. Ces coordonnées sont toutes les deux représentées sous la forme d'un nombre entier. Une première approche serait d'associer une variable pour l'abscisse et une autre pour l'ordonnée. Malheureusement cette solution nous force à définir un très grand nombre de variables. Une autre possibilité est de dire que ces coordonnées constituent une paire d'entiers et que cette paire peut être stockée en mémoire en utilisant deux adresses consécutives. Par exemple, on peut prendre la convention que l'adresse ``C`` contiendra la valeur de l'abscisse tandis que l'adresse ``C+1`` contiendra la valeur de l'ordonnée. La :numref:`table-memxy` présente deux de ces coordonnées en mémoire. La première, `(3,7)` est stockée aux adresses ``16`` et ``17``. Tandis que la seconde, `(6,4)` occupe les adresses ``18`` et ``19``.


.. _table-memxy:

.. table:: Contenu de la mémoire

   ======= ======
   adresse valeur
   ------- ------   
   16       3   
   17       7
   18       6
   19       4
   ======= ======


Sur base de cette représentation, on peut écrire un petit programme assembleur qui permet de vérifier si deux coordonnées sont identiques.



.. literalinclude:: asm/coord-eq.asm
   :language: console
   :start-after: (DEBUT)


Vous pouvez tester ce programme via :download:`asm/coord-eq.asm`.


Cette solution peut être étendue pour stocker des vecteurs ou des tableaux d'entiers dont la taille est connue. Pour stocker des coordonnées `(x,y,z)`, il nous suffit de réserver trois mots contigus en mémoire. De mémoire, si l'on doit stocker le nombre de jours dans chaque mois de l'année civile, il suffit de réserver un bloc de 12 mots consécutifs en mémoire et d'y stocker les valeurs suivantes de la

.. _table-jour:

.. table:: Tableau contenant le nombre de jours dans chaque mois de l'année

   ======= ======
   adresse valeur
   ------- ------   
   m+0     31   
   m+1     28
   m+2     31
   m+3     30
   m+4     31
   m+5     30
   m+6     31
   m+7     31
   m+8     30
   m+9     31
   m+10    30
   m+11    31
   ======= ======


Sur base de ce tableau de douze nombres, on peut ensuite facilement écrire une programme qui calcule le nombre de jours durant une année en additionnant les nombres présents dans le tableau. Ce programme est téléchargeable depuis :download:`asm/mois-annee2.asm`.   

.. literalinclude:: asm/mois-annee.asm
   :language: console
   :start-after: (DEBUT)


		 
En python, ce programme aurait pu être écrit de la façon suivante.

.. literalinclude:: python/mois-annee.py
   :language: python
   :end-before: #fin
		 
Notre programme en assembleur contient une construction qui mérite d'être analysée plus en détails.

.. code-block:: console

   @20   // début tableau
   D=A
   @17   // variable contenant i
   A=M+D
   D=M   // charge le i ème élément du tableau


Tout d'abord, les deux premières lignes permettent de placer dans le registre ``A`` l'adresse du début de notre tableau. L'adresse ``17`` est celle de notre variable de boucle. L'instruction suivante, ``A=M+D`` nous permet de calculer une adresse en mémoire (le résultat est stocké dans le registre ``D``). Cette adresse est la somme entre la valeur actuelle du registre ``D``, c'est-à-dire l'adresse du début de notre tableau, et la valeur qui a été lue en mémoire à l'adresse ``17``, c'est-à-dire la valeur de notre compteur. Nous plaçons donc dans le registre ``A`` l'adresse du ième élément de notre tableau. L'instruction ``D=M`` qui suit nous permet donc de charger la valeur de cet élément dans le registre ``D``. Cette valeur peut ensuite être utilisée dans les calculs.    
   

Une construction similaire peut être utilisée pour initialiser à  ``0`` ou ``1`` la valeur du ième élément du tableau.

.. code-block:: console

   @20   // début tableau
   D=A
   @17   // variable contenant i
   A=M+D
   M=1   // initialise le i ème élément du tableau

Si l'on veut modifier la valeur du ième élément d'un tableau, il faut procéder en deux étapes. Il faut d'abord calculer l'adresse de cette élément et la stocker dans une adresse mémoire temporaire. Ensuite, on peut modifier la valeur de l'élément se trouvant à cette adresse.

.. mettre un exemple ?


De façon générale, si un tableau d'entier démarrer à l'adresse `A`, alors le `i
`ème élément de ce tableau se trouve en mémoire à l'adresse :math:`A+i`. Cette organisation peut également être utilisée pour stocker des matrices en mémoire. Il suffit simplement de définir une relation entre les indices d'un élément de la matrice et la zone mémoire correspondante. Les deux principales méthodes pour stocker une matrice en mémoire sont `ligne par ligne` et `colonne par colonne`. La r

Pour illustrer ces deux conventions, considérons la matrice à deux lignes et trois colonnes de la :numref:`fig-matrice`. 

.. _fig-matrice:

.. tikz:: Une matrice entière de deux lignes et trois colonnes

     
      \node (l11) at (0,0) {$7$};
      \node (l12) at (0.5,0) {$8$};
      \node (l13) at (1,0) {$9$};
      \node (l21) at (0,-0.7) {$4$};
      \node (l22) at (0.5,-0.7) {$5$};
      \node (l23) at (1,-0.7) {$6$};


La façon la plus classique pour stocker une telle matrice est de le faire ligne par ligne comme représenté dans la :numref:`fig-matrice-ll`. Dans cette représentation, si la matrice a `l` lignes et `c` colonnes, alors l'élement `i,j` de la matrice se trouve à l'adresse :math:`A+ i \times c + j` en supposant que les indices des lignes et colonnes commencent à `0`.       

.. _fig-matrice-ll:

.. tikz:: Stockage ligne par ligne d'une matrice 

     	   
     
      \node (l11) at (0,0) {$7$};
      \node (l12) at (0.75,0) {$8$};
      \node (l13) at (1.5,0) {$9$};
      \node (l21) at (0,-0.7) {$4$};
      \node (l22) at (0.75,-0.7) {$5$};
      \node (l23) at (1.5,-0.7) {$6$};

      \node (mem) at (3,0) {Mémoire};
      \node (m0) at (3,-1) {$7$};
      \node (m1) at (3,-1.33) {$8$};
      \node (m2) at (3,-1.66) {$9$};
      \node (m3) at (3,-2) {$4$};
      \node (m4) at (3,-2.33) {$5$};
      \node (m5) at (3,-2.66) {$6$};


      \draw [->,color=blue] (l11.west) |-  (m0.west);
      \draw [->,color=blue] (l12.west) |-  (m1.west);
      \draw [->,color=blue] (l13.west) |-  (m2.west);      

      \draw [->,color=green] (l21.east) |-  (m3.west);
      \draw [->,color=green] (l22.east) |-  (m4.west);
      \draw [->,color=green] (l23.east) |-  (m5.west);

      
Il est aussi possible de stocker cette matrice colonne par colonne comme représenté dans la :numref:`fig-matrice-cc`. Dans cette représentation, si la matrice a `l` lignes et `c` colonnes, alors l'élement `i,j` de la matrice se trouve à l'adresse :math:`A+ j \times l + i` en supposant que les indices des lignes et colonnes commencent à `0`.

.. _fig-matrice-cc:

.. tikz:: Stockage colonne par colonne d'une matrice 


      \node (l11) at (0,0) {$7$};
      \node (l12) at (0.75,0) {$8$};
      \node (l13) at (1.5,0) {$9$};
      \node (l21) at (0,-0.7) {$4$};
      \node (l22) at (0.75,-0.7) {$5$};
      \node (l23) at (1.5,-0.7) {$6$};	  


      \node (mem) at (3,0) {Mémoire};
      \node (m0) at (3,-1) {$7$};
      \node (m1) at (3,-1.33) {$4$};
      \node (m2) at (3,-1.66) {$8$};
      \node (m3) at (3,-2) {$5$};
      \node (m4) at (3,-2.33) {$9$};
      \node (m5) at (3,-2.66) {$6$};
      

      \draw [->,color=blue] (l11.west) |-  (m0.west);
      \draw [->,color=blue] (l12.west) |-  (m2.west);
      \draw [->,color=blue] (l13.west) |-  (m4.west);      

      \draw [->,color=green] (l21.east) |-  (m1.west);
      \draw [->,color=green] (l22.east) |-  (m3.west);
      \draw [->,color=green] (l23.east) |-  (m5.west);
   
.. somme des éléments d'un tableau   
   
.. somme de deux vecteurs


On est parfois amener à manipuler des tableaux de différentes tailles. Dans ce cas, il est intéressant de réserver un mot en mémoire pour stocker la taille du tableau. Tout tableau utilisant cette représentation contient donc comme premier élément sa taille. Un talbleau de `n` entiers occupe donc :math:`n+1` mots en mémoire.

A titre d'exemple, reprenons notre tableau avec le nombre de jours dans chaque mois. La représentation de notre tableau contient donc une entrée supplémentaire qui est sa taille (:numref:`table-jour2`).

.. _table-jour2:

.. table:: Tableau dont le premier élément est sa taille

   ======= ======
   adresse valeur
   ------- ------
   m       12
   m+1     31   
   m+2     28
   m+3     31
   m+4     30
   m+5     31
   m+6     30
   m+7     31
   m+8     31
   m+9     30
   m+10    31
   m+11    30
   m+12    31
   ======= ======



   
.. tableau dont la taille (en mots) est encodée du début, permet de vérifier que tout accès au tableau est correct

Cette représentation a deux avantages principaux. Tout d'abord, il est possible d'écrire un programme générique qui peut parcourir tous les éléments du tableau comme dans l'exemple ci-dessous. 
   
.. literalinclude:: asm/mois-annee2.asm
   :language: console
   :start-after: (DEBUT)

Ce programme est téléchargeable depuis :download:`asm/mois-annee2.asm`.   

De plus, il est facile dans un programme ou un langage de programmation de vérifier que les accès aux éléments d'un tableau respectent bien les limites de ce tableau.

.. exemple get ou set avec erreur en cas de non respect des bornes

.. buffer overflow / segmentation fault ?
   
Utilisation des chaînes de caractères
-------------------------------------

Notre minuscule assembleur utiliser un mot de 16 bits pour représenter chaque caractère. Une chaine de caractères peut être vue comme un tableau de caractères. Elle sera donc composée de caractères consécutifs qui sont stockés en mémoire. Un programme peut être amené à traiter des chaines de caractères de tailles très différentes. Il existe deux techniques pour stocker ces chaines de caractères
en mémoire. La première est de stocker la longueur de la chaine suivie est caractères qui la composent (:numref:`fig-hello`). Cette solution permet de facilement déterminer la longueur de la chaine de caractères puisque celle-ci est explictement stockée en mémoire. En utilisant un mot de 16 bits pour cette longueur, on peut supporter des chaines contenant au maximum 65535 caractères. C'est largement assez pour le minuscule ordinateur veut l'esapce de mémoire dont il dispose.

.. _fig-hello:

.. tikz:: Représentation en mémoire de la chaine de caractères Hello! avec une indication explicite de longueur

     
      \node (l11) at (0,0) {H};
      \node (l12) at (0.25,0) {e};
      \node (l13) at (0.5,0) {l};
      \node (l21) at (0.75,0) {l};
      \node (l22) at (1,0) {o};
      \node (l23) at (1.25,0) {!};

      \node (mem) at (3,0) {Mémoire};
      \node[color =red] (m) at (4,-0.66) {$0000000000000111$};

      \node (m0) at (4,-1) {$00000000 01001000$};
      \node (m1) at (4,-1.33) {$00000000 01100101$};
      \node (m2) at (4,-1.66) {$00000000 01101100$};
      \node (m3) at (4,-2) {$00000000 01101100$};
      \node (m4) at (4,-2.33) {$00000000 01101111$};
      \node (m5) at (4,-2.66) {$00000000 00100001$};

      \draw [->] (l11.south) |-  (m0.west);
      \draw [->] (l12.south) |-  (m1.west);
      \draw [->] (l13.south) |-  (m2.west);
      \draw [->] (l21.south) |-  (m3.west);
      \draw [->] (l22.south) |-  (m4.west);
      \draw [->] (l23.south) |-  (m5.west);


.. caractère is in

A titre d'exemple, considérons un petit programme qui permet de déterminer si un caractère est présent dans une chaine de caractères. En python, ce programme pourrait s'écrire comme suit:

.. literalinclude:: python/charin.py
   :language: python
   :end-before: #fin

		
      

Il existe une autre façon de stocker les chaines de caractères. C'est celle qui est utilisée notamment par le :index:`langage C`. Ce langage utilise un caractère spécial (la valeur binaire `00000000 00000000` sur le minuscule ordinateur) pour marquer la fin de la chaine de caractère.      
      

.. _fig-helloc:

.. tikz:: Représentation en mémoire de la chaine de caractères Hello! avec mrqueur de fin

	  
    
      \node (l11) at (0,0) {H};
      \node (l12) at (0.25,0) {e};
      \node (l13) at (0.5,0) {l};
      \node (l21) at (0.75,0) {l};
      \node (l22) at (1,0) {o};
      \node (l23) at (1.25,0) {!};

      \node (mem) at (3,0) {Mémoire};


      \node (m0) at (4,-1) {$00000000 01001000$};
      \node (m1) at (4,-1.33) {$00000000 01100101$};
      \node (m2) at (4,-1.66) {$00000000 01101100$};
      \node (m3) at (4,-2) {$00000000 01101100$};
      \node (m4) at (4,-2.33) {$00000000 01101111$};
      \node (m5) at (4,-2.66) {$00000000 00100001$};
      \node[color =red] (m6) at (4,-3)  {$00000000 00000000$};

      \draw [->] (l11.south) |-  (m0.west);
      \draw [->] (l12.south) |-  (m1.west);
      \draw [->] (l13.south) |-  (m2.west);
      \draw [->] (l21.south) |-  (m3.west);
      \draw [->] (l22.south) |-  (m4.west);
      \draw [->] (l23.south) |-  (m5.west);

      

.. python record coord xy

.. python objet simple (trop tôt ?)


   
.. python tableau d'entiers



.. chaine de caractères : style C ou avec une indication de longueur, faire les deux versions avec isin
   
