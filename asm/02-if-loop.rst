.. include:: defs.rst



L'instruction de comparaison
----------------------------


Outre les instructions arithmétiques et logiques, notre processeur contient
également une instruction de comparaison dénommée :index:`CMP`. Cette
instruction permet de comparer deux séquences de bits pour déterminer
si elles sont égales. Elle compare la valeur se trouvant
dans le registre qui est son premier argument avec son second argument qui
peut être :

 - un autre registre (``CMP reg1, reg2``)
 - une valeur se trouvant à une adresse en mémoire (``CMP reg, [adr]``)
 - une constante (``CMP reg, cst``)

Lors de son exécution, l'instruction de comparaison ne modifie pas
la valeur contenue dans le registre qui est son premier argument. Elle stocke
son résultat dans un drapeau (`flag` en anglais). Ce drapeau occupe 1 bit dans le
processeur (le bit ``Z``). Il est mis à la valeur `vrai` par l'instruction ``CMP`` si
la comparaison a réussi et à `faux` sinon. Dans l'exemple ci-dessous,
le drapeau ``Z`` est mis à la valeur `faux` après exécution de la première instruction
``CMP``. Ce drapeau passe à la valeur `vrai` après exécution de la seconde
instruction ``CMP``.

.. code-block:: nasm

   MOV A, 2
   MOV B, 3
   MOV C, 2
   CMP A, B
   CMP A, C

L'instruction ``CMP`` n'est pas la seule à modifier le drapeau ``Z``. C'est le cas
pour toutes les instructions arithmétiques et logiques: ``ADD``, ``SUB``, ``MUL``,
``INC``, ``DEC``, ... Après exécution de chacune de ces instructions, le drapeau
``Z```est mis à `vrai` si le résultat de l'opération est le bloc de 16 bits
dont tous les bits valent zéro. Lorsque l'on veut utiliser la valeur du drapeau
``Z``, il faut le faire immédiatement après l'exécution de l'instruction ``CMP``.


.. todo:: Attention revoir cette partie si on met du complément à 2

Notre processeur supporte un deuxième drapeau, :index:`Carry` (report en anglais)
ou :index:`C`. Ce drapeau est utilisé par les opérations arithmétiques et logiques.
Notre processeur stocke des données sur 16 bits dans chacun de ses registres.
Lorsque l'on réalise une opération arithmétique, il est possible que le résultat
nécessite plus de 16 bits pour stocker sa représentation binaire. C'est
le cas par exemple pour les opérations d'addition ou de multiplication. Dans le programme
ci-dessous, le drapeau ``C`` sera mis à `vrai` à la seconde instruction ``INC`` car
le résultat (``65536```) doit être stocké sur 17 bits et non 16.

.. code-block:: nasm
		
   MOV A, 65534
   INC A          ; C mis à false
   INC A          ; C mis à vrai


Il en va de même pour l'instruction de multiplication qui provoque également
un dépassement de capacité (et donc fixe le drapeau ``C`` à `vrai` après
son exécution.

.. code-block:: nasm

   MOV A, 40000
   MUL A         ; dépassement de capacité
		

Le compteur de programme et les instructions de saut
----------------------------------------------------


.. spelling:word-list::

   PC
   instruction
   pointer
   PC
   Program
   Counter

Outre les registres ``A``, ``B``, ``C`` et ``D``, un microprocesseur contient
également un registre spécial généralement dénommé :index:`Compteur de Programme`
ou :index:`Program Counter` (:index:`PC`) en anglais. Certains documents
parlent de :index:`pointeur d'instruction` ou :index:`instruction pointer` en
anglais. Dans ce syllabus, nous
utiliserons le terme :index:`PC` pour parler de ce registre. Le :index:`PC` stocke
à tout moment l'adresse en mémoire de l'instruction à exécuter. Lors de l'exécution
d'une instruction arithmétique, le :index:`PC` est simplement incrémenter de
façon à contenir l'adresse de l'instruction suivante. A titre d'exemple, considérons
la suite d'instruction de la section précédente.

.. code-block:: nasm

   i1: MOV A, 2
   i2: MOV B, 3
   i3: MOV C, 2
   i4: CMP A, B
   i5: CMP A, C


Au démarrage de l'ordinateur, le :index:`PC` est initialisé à l'adresse
de la première instruction à exécuter (``0`` dans notre processeur simple, mais
ce n'est pas toujours le cas). Durant l'exécution de l'instruction
``MOV A,2``, le :index:``PC`` contient l'adresse de l'étiquette ``i1``. A
la fin de l'exécution de cette instruction, le :index:`PC` est modifié pour
contenir l'adresse de l'instruction qui suit, c'est-à-dire ``i2``. Cette
mise à jour du compteur de programme s'effectue lors de l'exécution de toutes les
instructions arithmétiques et logiques. Cela permet l'exécution séquentielle
des instructions du programme.

Notre microprocesseur, comme tous les autres processeurs, supporte également
des instructions qui permettent de modifier la valeur stockée dans le :index:`PC`.
Ce sont les instructions de saut. Il existe deux types d'instructions de saut:

 - les instructions de saut *inconditionnelles* qui permettent de remplacer l'adresse 
   stockée dans le :index:`PC` par une autre adresse.
 - les instructions de saut *conditionelles* qui permettent de remplacer l'adresse
   stockée dans le :index:`PC` par une autre adresse lorsqu'une *condition particulière
   est remplie*. Si la condition n'est pas remplie, l'adresse stockée dans le :index:`PC`
   n'est pas modifiée.

L'instruction de saut inconditionnelle s'appelle :index:`JMP` (pour `jump`, `saut`
en anglais). Cette instruction prend un argument qui est une adresse (ou une étiquette).
A titre d'illustration, considérons la suite d'instructions ci-dessous. A votre avis,
l'instruction ``CMP`` va-t-elle mettre le drapeau ``Z`` à `vrai` ou `faux` ?

.. code-block:: nasm

   i1: MOV A, 2
   i2: JMP i4
   i3: MOV A, 9
   i4: MOV B, 9
   i5: CMP A, B


La première instruction place la valeur ``2`` dans le registre ``A``. La deuxième
instruction (étiquette ``i2``) modifie le compteur de programme de façon à ce
que l'adresse de l'instruction suivante soit celle de l'étiquette ``i4``. Le
processeur exécute donc ensuite l'instruction ``MOV B,9`` qui se trouve à l'adresse
de l'étiquette ``i4``. Ensuite il exécute l'instruction de comparaison qui place
la valeur `faux` dans le drapeau ``Z`` puisque le registre ``A`` contient la valeur
``2`` et le registre ``B`` la valeur ``9``.


L'instruction de saut inconditionnel a plusieurs utilisations comme nous le
verrons bientôt. Pour rendre le code assembleur plus facile à lire, il
est intéressant de définir les constantes au début du programme plutôt qu'à la
fin. Comme le processeur commence par exécuter l'instruction se trouvant à l'adresse
0, nous ne pouvons pas commencer un programme par le mot clé ``DB`` pour définir une
constante. Par contre, nous pouvons facilement associer une étiquette ``start``
au début "réel" de notre programme et avoir comme première instruction ``JMP start``.
Cette instruction peut être suivie d'une définition des différentes constantes utilisées
par le programme avec une suite de mot-clés ``DB`` et les étiquettes associées.


A titre d'exemple, reprenons le programme python ci-dessous.

.. code-block:: python

   x=3
   y=5
   z=x+2*y


Ce programme peut être de façon plus lisible comme suit.

.. code-block:: nasm

   JMP start		 
   ;  Variables et données du programme
   x: DB 3
   y: DB 5	 
   z: DB 0
   start: MOV A, [y]     ; place la valeur de la variable y dans A
   MUL 2          ; multiplie le contenu de A par 2
   ADD A, [x]     ; ajoute au contenu de A la valeur de la variable x
   MOV [z], A     ; sauvegarde du résultat du calcul dans la variable z
   HLT
   


Nous pouvons maintenant aborder les instructions de saut conditionnelles. Ces
instructions réalisent la modification du :index:`PC` en fonction des valeurs
des drapeaux ``Z`` et ``C``. Elles prennent toutes un seul argument: l'adresse
qu'il faut placer dans le :index:`PC` si la condition est remplie.

Les deux premières instructions conditionnelles sont :index:`JE` (`Jump if Equal`)
et :index:`JNE` (`Jump if Not Equal`). Ces instructions s'utilisent après
une instruction ``CMP`` et testent la valeur du drapeau ``Z``. L'instruction
``JE`` modifie le :index:`PC` si le drapeau ``Z`` contient la valeur
`vrai`. L'instruction ``JE``, elle, modifie le :index:`PC`
lorsque le drapeau ``Z`` contient la valeur `vrai`. 

Imaginons que nous devions écrire un programme qui place la valeur ``0`` dans
le registre ``C`` si les valeurs contenues dans les registres ``A`` et ``B`` sont
égales et ``1`` sinon. Une première version de ce programme pourrait
s'écrire comme suit.

.. code-block:: nasm

          MOV A, 123
	  MOV B, 123
	  CMP A, B
	  JE equal
	  MOV C, 0
   equal: MOV C, 1
          HLT

Lors de son exécution, ce programme charges les deux valeurs dans les registres
``A`` et ``B`` puis l'instruction ``CMP`` fixe la valeur du drapeau ``Z``. Si ce
drapeau est à la valeur `vrai`, tout va bien, l'instruction ``JE`` modifie
le ``PC`` pour y mettre l'adresse correspondant à l'étiquette ``equal`` et
l'instruction ``MOV C,1`` est exécutée. Par contre, si le drapeau est
à la valeur `faux`, le processeur exécute l'instruction `MOV C,0` et place
la valeur attendue dans le registre ``C``. Malheureusement, l'instruction
suivante est ``MOV C, 1`` et la valeur de ce registre est modifiée.

On peut éviter ce problème en utilisant un saut inconditionnel après exécution
de l'instruction ``MOV C,0`` comme ci-dessous.

.. code-block:: nasm

           MOV A, 123
	   MOV B, 123
	   CMP A, B
	   JE equal
   ne:     MOV C, 0
	   JMP suite:
   equal:  MOV C, 1
   suite:  HLT
   

Dans cette séquence d'instructions, le saut inconditionnel permet d'empêcher
l'exécution de l'instruction se trouvant à l'adresse correspondant à l'étiquette
``equal``. C'est une utilisation assez fréquente de l'instruction de saut
inconditionnel comme nous le verrons bientôt.

Il existe une deuxième paire d'instructions de saut qui testent uniquement
la valeur du drapeau ``Z``: :index:`JZ` (`Jump if Zero`) et :index:`JNZ`
(`Jump if Not Zero`). L'instruction
:index:`JZ` modifie le :index:`PC` si le drapeau ``Z`` est à la valeur `vrai`.
L'instruction :index:`JNZ` réalise cette modification lorsque le drapeau
``A`` a la valeur `faux`. Ces instructions peuvent s'utiliser sans être
précédées de l'instruction ``CMP`` comme dans l'exemple ci-dessous.

.. code-block:: nasm

            MOV A, 1
	    DEC A
	    JZ zero
   nz:      MOV C, 1
            JMP suite:
   zero:    MOV C, 0
   suite:   HLT

Les instructions conditionnelles permettent aussi de réaliser des comparaisons pour
déterminer si la valeur stockée dans un registre est supérieure, inférieur, inférieur
ou égale à celle d'un autre registre. Ces instructions s'utilisent directement après
une opération ``CMP reg1, reg2``. Les instructions suivantes sont supportées
par notre assembleur:

 - :index:`JA` (`Jump Above`): le saut conditionnel est effectué si la valeur stockée
   dans le premier registre argument de l'instruction ``CMP`` est *strictement supérieure*
   à la valeur stockée dans le second registre 
 - :index:`JB` (`Jump Below`): le saut conditionnel est effectué si la valeur stockée
   dans le premier registre argument de l'instruction ``CMP`` est *strictement inférieure*
   à la valeur stockée dans le second registre 
 - :index:`JAE` (`Jump Above or Equal`): le saut conditionnel est effectué si la valeur
   stockée dans le premier registre argument de l'instruction ``CMP`` est *supérieure
   ou égale* à la valeur stockée dans le second registre 
 - :index:`JBE` (`Jump Below or Equal`): le saut conditionnel est effectué si la valeur
   stockée dans le premier registre argument de l'instruction ``CMP`` est *inférieure
   ou égale* à la valeur stockée dans le second registre 


A titre d'exemple, nous pouvons utiliser ces instructions conditionnelles pour
implémenter un petit programme qui calcule la valeur absolue de la différence
entre deux variables et place le résultat dans le registre ``C``.

.. code-block:: nasm

            JMP start
   ; déclarations des variables et constantes
   x:       DB 12
   y:       DB 9
   start:   MOV A, [x]
            CMP A, [y]
            JBE petit
            MOV C, A
	    SUB C, [y]
	    JMP fin
   petit:   MOV C, [y]
	    SUB C, A
   fin: HLT

   

Enfin, il est aussi possible de vérifier simplement le drapeau ``C`` via les
instructions :index:`JC` (`Jump if Carry`) et :index:`JNC` (`Jump if Not Carry`).
Ces instructions sont utiles pour détecter un dépassement de capacité, notamment
sur les opérations arithmétiques telles que la multiplication. En cas de dépassement,
il est parfois préférable d'avertir l'utilisateur ou d'arrêter l'ordinateur
plutôt que que continuer l'exécution du programme avec des données erronées dans
un registre qui pourraient provoquer des erreurs en cascade. L'exemple ci-dessous
montre comme utiliser l'instruction :index:`JNC` pour vérifier si une instruction
de multiplication a provoqué un dépassement de capacité.

.. code-block:: nasm

             MOV A, 1000
	     MOV B, 123
	     MUL B
	     JNC correct
   ; dépassement de capacité
	     HLT
   correct:  MOV B, D
   ; suite du programme


Un autre problème mathématique qui peut survenir est lorsque l'on effectue
une division par zéro. Notre microprocesseur ne dispose pas de drapeau qui permet
de détecter cette situation. Lors de l'exécution d'une instruction telle que ``DIV 0``,
le processeur s'arrête et affiche le message `Division by 0`. Si vous souhaitez
éviter qu'un programme qui réalise une division ne s'arrête de cette façon, vous devez
vous assurer de ne jamais avoir ``0`` comme diviseur dans un de vos quotients.


Les instructions conditionnelles
--------------------------------

Les instructions de saut que nous venons de voir jouent un rôle critique dans les
programmes écrits en assembleur. C'est grâce à ces instructions que l'on peut
implémentation à la fois des instructions conditionnelles de type ``if ... else``, mais
aussi les boucles et même les appels à des fonctions et procédures comme nous le
verrons plus tard.

En python, il est facile d'écrire une instruction conditionnelle. Il suffit
d'utiliser le mot clé ``if``, d'indiquer la condition et ensuite la
séquence d'instructions à exécuter. Considérons à titre d'exemple la recherche du
maximum entre deux variables, ``x`` et ``y``. En python, ce calcul peut se réaliser
comme suit:

.. code-block::  python

		 
   if x>y :
      max=x
   else:
      max=y
      

En assembleur, nous devons utiliser une instruction de saut conditionnelle pour
obtenir le même résultat. Commençons pas déclarer nos trois variables: ``x``,
``y`` et ``max``. Ensuite nous devons comparer les valeurs des variables
``x`` et ``y``. Pour cela, nous les plaçons dans les registres ``A`` et ``B``.
Si la valeur de la variable ``x`` est strictement supérieure
à celle de la variable ``y``, nous devons placer la valeur de ``x`` (qui est
actuellement dans le registre ``A``) dans la variable ``max``. Sinon, nous plaçons
la valeur de la variable ``y`` dans la zone mémoire correspondant à la
variable ``max``.

.. code-block:: nasm

            JMP start
   x:       DB 12
   y:       DB 9
   max:     DB 0
   start:   MOV A, [x]
	    MOV B, [y]
	    CMP A, B
	    JA xmax
	    MOV [max], B
	    JMP fin
   xmax:    MOV [max], A
   fin:     HLT


Un approche similaire peut être utilisée pour implémenter d'autres instructions
conditionnelles. Le tout est de ramener toute condition à une comparaison avec
la valeur `0` ou à une relation d'ordre. 

Pour les conditions plus complexes, il faut parfois réécrire l'instruction conditionnelle.
Prenons deux exemples en python pour illustrer cette réécriture.


.. code-block:: python

   if (a>0) AND (b<1):
      x=2


Dans ce cas, on peut réécrire l'instruction conditionnelle sous la forme :

.. code-block:: python

   if (a>0) :
     if (b<1) :
       x=2

       
Ces deux instructions conditionnelles imbriquées peuvent facilement s'implémenter avec les
instructions de saut conditionnel que nous avons présenté. Il en va de même pour une
disjonction logique. L'instruction ci-dessous :

.. code-block:: python

   if (a>0) OR (b<1):
      x=3

peut se réécrire de la façon suivante pour supprimer la disjonction logique.
      
.. code-block:: python

   if (a>0) :
     x=3
   else :
     if (b<1) :
         x=2

	 
Les boucles
-----------

.. spelling:word-list::

   while
   for




Après les opérations arithmétiques et logiques et les instructions conditionnelles, il nous
reste à voir comment supporter les boucles. Python supporte deux types principaux de boucles :

 - les boucles ``while``
 - les boucles ``for``



   
Les boucles ``while`` sont les boucles les plus générales. Une boucle ``for`` est
généralement une boucle d'un type particulier qui est écrite de façon compacte.
Nous nous focaliserons  sur les boucles ``while`` dans cette section. Une boucle
``while`` comprend toujours une condition qui est une expression booléenne et
un corps comprenant une ou plusieurs instructions
à exécuter.

Commençons par une boucle inutile, mais que vous avez probablement déjà rencontré:
la boucle infinie. 

.. code-block:: python

   while True:
     x=x+1

En assembleur, cette boucle peut s'écrire en utilisant une instruction
de saut inconditionnel ``JMP``.

.. code-block:: nasm

            JMP start
   ; variables et constantes	     
   x:       DB 0
   ; programme
   start:   MOV A, [x]
            INC A
	    MOV [x], A
	    JMP start

Parfois, on obtient une boucle infinie en python car la condition d'arrêt de
la boucle n'est sont jamais réalisée, même si python vérifie cette condition à
chaque itération.

.. code-block:: python

   x=1		
   while x!=0:
     x=x+1  


Ce programme python être traduit par les instructions suivantes en assembleur.

.. code-block:: nasm

            JMP start
   ; variables et constantes	    
   x: DB 1
   start:   MOV A, [x]
            CMP A, 0
            JZ fin
            INC A
            MOV [x], A
            JMP start
   fin:     HLT


Ce programme place la valeur de la variable ``x`` dans le registre ``A`` et
regarde si elle est différente de zéro. Si cette valeur est égale à zéro, il
sort de la boucle. Sinon, il incrémente la valeur du registre ``A`` puis sauve
le résultat en mémoire à l'adresse de la variable ``x``.

La sauvegarde en mémoire de la valeur de la variable ``x`` n'est pas nécessaire
puisque cette valeur se trouve également dans le registre ``A``. On peut donc
accélérer le programme comme présenté ci-dessous.

.. code-block:: nasm

            JMP start
   ; variables et constantes	    
   x: DB 1
   start:   MOV A, [x]
   boucle:  CMP A, 0
            JZ fin
            INC A
            JMP boucle
   fin:     MOV [x], A
            HLT

Cette nouvelle version du programme incrémente la valeur du registre ``A`` à chaque
itération mais ne sauvegarde la valeur du registre ``A`` en mémoire à l'adresse
de la variable ``x`` qu'à la sortie de la boucle (étiquette ``fin``). Ce programme est
plus efficace que le précédent même si il aboutit au même résultat final.

Si vous exécutez le programme python, vous verrez qu'il ne s'arrête jamais et
que vous devrez manuellement arrêter l'interpréteur python. Si vous faites le même essai
avec le programme en assembleur sur le simulateur, vous verrez que le programme en
assembleur finit par s'arrêter. Cette différence de comportement s'explique par
la façon dont les nombres naturels sont stockés en python et dans notre assembleur.
Le langage python a été conçu de façon à pouvoir réaliser des calculs sans limitation
sur les nombres entiers qui sont représentés. Le langage python adapte dynamiquement
le nombre de bits utilisés pour représenter chaque nombre à ce nombre. En python,
vous pouvez calculer avec les valeurs ``1000``, ``2000000``, ```5000000000`` ou
``9000000000000`` sans aucun souci.

Notre assembleur utilise 16 bits pour représenter les nombres naturels. Avec 16 bits
qui peuvent prendre les valeurs ``0`` et ``1``, il peut stocker :math:`2^{16}` nombres
naturels différents. Le plus petit est ``0`` (ou ``0b0000000000000000``) et le
plus grand ``65535`` (:math:`2^{16}-1` ou ``0b1111111111111111``). Analysons ce qu'il
se passe dans la boucle. Au début, la valeur dans le registre ``A`` passe de
``0b0000000000000000`` à puis ``0b0000000000000001``, ``0b0000000000000010``, ...
Après quelque temps, le registre ``A`` contient la valeur ``65534`` ou ``0b1111111111111110``.
Après incrémentation, cette valeur passe à ``0b1111111111111111``. C'est le plus
grand naturel que l'on peut représenter en utilisant 16 bits. L'incrémentation
suivante devrait faire passer la valeur du registre à ``0b10000000000000000``
ou ``65536``. Comme le registre ``A`` ne peut stocker que 16 bits, il mémorise
les 16 bits de poids faible, à savoir ``0b000000000000000`` ou ``0`` en notation
décimale. Après l'exécution de cette instruction, le drapeau ``C`` est mis à
`vrai` pour indiquer qu'il y a eu un dépassement de capacité lors de l'exécution
de l'instruction ``INC``, mais notre programme ne vérifie pas ce drapeau...
Le nouvelle valeur stockée dans le registre ``A``  est numériquement égale à ``0``
et notre programme en assembleur s'arrête.

      
Nous pouvons nous inspirer de cette approche pour traduire une boucle ``while`` en une
séquence d'instructions en assembleur. Pour cela, notre programme doit :

 1. Évaluer la valeur de la condition
 2. Si la condition est `vrai`, exécuter le corps de la boucle puis revenir au point 1
 3. Sinon, passer à l'exécution des instructions placées juste après le corps de la boucle

   
Pour illustrer cette traduction, considérons la boucle ci-dessous. Après l'exécution de
cette boucle, la variable ``x`` contient la valeur `512`.


.. code-block:: python

   x=1
   n=1
   while (n<10) :
      n=n+1
      x=x+x



Ce fragment de code peut se traduire en langage assembleur. Il faut d'abord charger
la valeur de la variable ``n`` (ligne 5) et la comparer à ``10``. Si ``n`` est
supérieure ou égale à ``10``, il faut sortir de la boucle. En général, pour implémenter
une condition en assembleur, utilise l'instruction de saut qui correspond à la condition
inverse puisque l'on cherche à faire un saut pour sortir de la boucle si la condition
n'est pas vérifiée. Ensuite, il suffit d'incrémenter la valeur de la variable ``n``
puis de la sauvegarder en mémoire. On peut ensuite charger la variable ``x`` dans un
registre et calculer ``x+x``. Enfin, on utilise une instruction de saut inconditionnel
``JMP`` pour revenir au début de la boucle et réévaluer la condition ``n<10``.
     
.. code-block:: nasm
   :linenos:
		
            JMP boucle
   ; variables et constantes
   x: DB 1
   n: DB 1
   boucle:  MOV A, [n]
            CMP A, 10
            JAE fin
            INC A
            MOV [n], A
            MOV B, [x]
            ADD B, B
            MOV [x], B
            JMP boucle
   fin:     HLT


Tout comme dans l'exemple précédent, on aurait pu réduire le nombre de transferts
vers la mémoire et d'instructions en plaçant les variables ``x`` et ``n`` dans les
registres ``B`` et ``A`` au début de la boucle, avant l'évaluation de la condition
d'arrêt. Si on procède de cette façon, il ne faut bien entendu pas oublier de
sauver les valeurs stockées dans les registres en mémoire en sortie de boucle.

.. code-block:: nasm



            JMP boucle
   ; variables et constantes
   x: DB 1
   n: DB 1
            MOV A, [n]
            MOV B, [x]
   boucle:  CMP A, 10
            JAE finb
            INC A
            ADD B, B
            JMP boucle
   finb:    MOV [n], A   ; sauvegarde variable n
            MOV [x], B   ; sauvegarde variable x 
   fin:     HLT


En python, il existe différentes formes de boucles :index:`for`. Nous nous limiterons
aux boucles qui itèrent sur des naturels comme ``for i in range (0,4):`` ou
``for x in range (1, 5, 2):``. Ces boucles peuvent facilement se traduire sous la
forme d'une boucle :index:`while` en python. Ainsi, les deux boucles ci-dessous
sont équivalentes.

.. code-block:: python

   for x in range(2,7):
       print(x)

.. code-block:: python

   x=2
   while (x<=7):
     print(x)
     x=x+1
     

De la même façon, les deux boucles ci-dessous sont également équivalentes.

.. code-block:: python

   for x in range (10, 5, -2):
     print(x)
     
.. code-block:: python

   x=10
   while (x>=5):
     print(x)
     x=x-2

     
.. todo pas convaincu de continue et break

Chacune de ces boucles :index:`while` peut être convertie en assembleur
en utilisant notamment des instructions de saut.


Utilisation des tableaux
------------------------

Jusque maintenant, nous avons manipulé des variables entières qui sont stockées en mémoire ou dans des registres. Un ordinateur doit également pouvoir traiter des objets mathématiques tels que les vecteurs et les matrices. Ceux-ci doivent pouvoir être stockés en mémoire.

Commençons par analyser la façon dont un programme peut manipuler les coordonnées `(x,y)` d'un point sur un plan. Ces coordonnées sont toutes les deux représentées sous la forme d'un naturel. Une première approche serait d'associer une variable pour l'abscisse et une autre pour l'ordonnée. C'est ce que nous faisons dans l'exemple ci-dessous avec les variables ``CAx``
et ``CAy`` pour les coordonnées du point ``A``. Le programme charge simplement les
coordonnées ``x`` puis ``y`` des deux points à comparer et met la variable ``eq`` à ``1``
si les deux points sont égaux et ``0`` sinon.

.. code-block:: nasm

   JMP start
   ; mis à 1 si égales, 0 sinon
   eq: DB 0
   ; premier point
   CAx: DB 1 ; coordonnée x
   CAy: DB 2 ; coordonnée y
   ; second point
   CBx: DB 1 ; coordonnée x
   CBy: DB 7 ; coordonnée y
   start: MOV A, [CAx]
   MOV B, [CBx]
   CMP A, B
   JNE diff
   MOV A, [CAy]
   MOV B, [CBy]
   CMP A, B
   JNE diff
   egal:
   MOV [eq], 1
   JMP fin
   diff: 
   MOV [eq], 0
   fin: HLT


   
Malheureusement cette solution nous force à définir un très grand nombre de variables. Si on
analyse un peut comment l'assembleur place les données en mémoire, on se rend compte que
les variables ``CAx`` et ``CAy`` occupent des positions consécutives en mémoire. Il en va
de même pour les variables ``CBx`` et ``CBy``. Ainsi, la mémoire initialisée par le programme
ci-dessus peut se visualiser comme dans la table :numref:`table-memxy` où l'adresse ``03``
est utilisée par la variable ``eq``.


.. _table-memxy:

.. table:: Contenu de la mémoire

   ======= ======
   adresse valeur
   ------- ------   
   03       0   
   05       1
   07       2
   09       1
   0B       7
   ======= ======

On peut profiter de cette organisation de la mémoire et déclarer nos variables
en utilisant une étiquette pour chaque paire de deux entiers qui représente
une coordonnée.


.. code-block:: nasm

   ; mis à 1 si égales, 0 sinon
   eq: DB 0
   ; premier point
   CA: DB 1 ; coordonnée x
       DB 2 ; coordonnée y
   ; second point
   CB: DB 1 ; coordonnée x
       DB 7 ; coordonnée y


Ces déclarations définissent deux variables: ``CA`` et ``CB`` qui utilisent chacune
deux blocs de 16 bits en mémoire. Avec ces étiquettes, nous pouvons adapter notre
programme de façon à ce qu'il puisse tester l'égalité des coordonnées ``x`` et
``y`` de chaque point. Pour les coordonnées ``x``, c'est facile. Il suffit de réutiliser
les mêmes instructions que dans le programme précédent en adaptant le nom des
variables.

.. code-block:: nasm

   start: MOV A, [CA]
   MOV B, [CB]
   CMP A, B
   JNE diff


Pour comparer les coordonnées ``y``, cette approche ne fonctionne plus car nous n'avons
pas défini d'étiquette correspondant à l'adresse de la coordonnée ``y`` du point ``CA``
en mémoire. Par contre, nous savons que cette coordonnée se trouve à l'adresse
qui suit celle de la coordonnée ``x``. Si la coordonnée ``x`` se trouve à l'adresse
``Adr`` en mémoire, alors la coordonnée ``y`` se trouve à l'adresse ``Adr+2`` puisque
sur notre processeur un entier occupe 16 bits. On voudrait pouvoir écrire les instructions
suivantes :

.. code-block:: nasm

   MOV A, [CA+2]
   MOV B, [CB+2]
   CMP A, B
   JNE diff

   
Dans ce programme, ``CA`` correspond à une adresse en mémoire et ``CA+2`` est donc
l'adresse de l'entier 16 bits qui suit celui qui se trouve à l'adresse ``CA`` en mémoire.
Malheureusement, notre assembleur ne nous permet pas de calculer une adresse
de cette façon dans l'instruction ``MOV``. Il permet de réaliser ce genre de calcul
simple (addition ou soustraction) avec une adresse, mais uniquement si celle-ci se
trouve dans un registre. On peut donc placer l'adresse ``CA`` dans le registre ```C``
avec l'instruction ``MOV C, CA``. Une fois cette opération réalisée, on peut utiliser
l'adresse se trouvant dans le registre ``C``. Ainsi, l'instruction ``MOV A, [C]`` placera
dans le registre ``A`` le bloc de 16 bits qui se trouve en mémoire à l'adresse qui se
trouve actuellement dans le registre ``C``. L'instruction ``MOV B, [C+2]`` placera
dans le registre ``B`` le bloc de 16 bits qui se trouve actuellement en mémoire à l'adresse
qui *suit* l'adresse qui est dans le registre ``C``. Enfin, l'instruction
``MOV D, [C-2]`` placera dans le registre ``D`` le bloc de 16 bits qui se trouve en mémoire
à l'adresse qui *précède* celle qui est dans le registre ``C``. 

Nous pouvons donc écrire les instructions suivantes pour comparer les coordonnées
``y`` 


.. code-block:: nasm

   MOV C, [CA]
   MOV A, [C+2]
   MOV D, [CB]
   MOV B, [D+2]
   CMP A, B
   JNE diff

.. note::

   Notez bien la différence entre les instructions

    - ``MOV A, Adr``
    - ``MOV A, [Adr]``

  La première place dans le registre ``A`` l'adresse qui est son second argument.
  La seconde place dans le registre ``A`` la valeur qui est actuellement stockée en
  mémoire à l'adresse ``Adr``.


Nous pouvons maintenant écrire le programme complet pour comparer les
coordonnées ``x`` et ``y`` de nos deux points.
  
.. code-block:: nasm

   JMP start
   ; mis à 1 si égales, 0 sinon
   eq: DB 0
   ; premiere paire	
   CA: DB 1
   DB 2
   ; seconde paire
   CB: DB 1
   DB 2
   start: MOV A, CA
   MOV B, CB
   MOV C, [A]
   MOV D, [B]
   CMP C, D
   JNE diff
   MOV C, [A+2]
   MOV D, [B+2]
   CMP C, D
   JNE diff
   egal:
   MOV [eq], 1
   JMP fin
   diff: 
   MOV [eq], 0
   fin: HLT

	  
Cette solution peut être étendue pour stocker des vecteurs ou des tableaux d'entiers dont la taille est connue. Pour stocker des coordonnées `(x,y,z)`, il nous suffit de réserver trois mots contigus en mémoire. De la même façon, si l'on doit stocker le nombre de jours dans chaque mois de l'année civile, il suffit de réserver un bloc de 12 mots consécutifs en mémoire et d'y stocker les valeurs reprises dans le :numref:`table-jour`.

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


En python, ce programme aurait pu être écrit de la façon suivante.

.. literalinclude:: python/mois-annee.py
   :language: python
   :end-before: #fin


En assembleur c'est un tout petit peu plus compliqué, mais il suffit de bien faire
attention aux instructions que l'on écrit et d'être systématique. Notre programme assembleur
va parcourir le tableau du nombre de jours dans chaque mois. Pour cela, nous aurons besoin
de conserver l'indice du tableau ``mois`` qui est en cours de traitement. Nous
choisissons d'utiliser le registre ``C`` pour stocker cette information. Il est
initialisé à ``0`` avant d'entrer dans la boucle. Connaissant cet indice, il est possible
de calculer l'adresse du `Cème` élément du tableau ```mois``. Pour cela, il suffit de
calculer la somme entre l'adresse du tableau et le double de l'indice ``C`` puisque chaque
entier prend 16 bits et donc deux adresses en mémoire. Nous choisissons d'utiliser le registre
``A`` pour stocker cette adresse car c'est le seul registre qui supporte l'opération de
multiplication. Nous aurions pu aussi prendre le registre ``D`` et remplacer l'instruction
``MUL 2`` par ``ADD D, D`` qui donne le même résultat et en pratique est généralement
plus rapide.

.. code-block:: nasm
   :linenos:
      
   JMP start
   ; No
   jours: DB 0
   mois: DB 31
   DB 28
   DB 31
   DB 30
   DB 31
   DB 30
   DB 31
   DB 31
   DB 30
   DB 31
   DB 30
   DB 31
   start: MOV C, 0  ; index dans le tableau
   boucle: MOV A, C
   MUL 2
   ADD A, mois ; adresse en mémoire du Ceme mois 
   MOV B, [A]
   ADD B, [jours]
   MOV [jours], B
   INC C
   CMP C,11
   JA fin
   JMP boucle
   fin: HLT
		


De façon générale, si un tableau d'entier démarre à l'adresse `A`, alors le `ième` élément de ce tableau se trouve en mémoire à l'adresse :math:`A+2*i`. Cette organisation peut également être utilisée pour stocker des matrices en mémoire. Il suffit simplement de définir une relation entre les indices d'un élément de la matrice et la zone mémoire correspondante. Les deux principales méthodes pour stocker une matrice en mémoire sont `ligne par ligne` et `colonne par colonne`. 

Pour illustrer ces deux conventions, considérons la matrice à deux lignes et trois colonnes de la :numref:`fig-matrice`. 

.. _fig-matrice:

.. tikz:: Une matrice entière composée de deux lignes et trois colonnes

     
      \node (l11) at (0,0) {$7$};
      \node (l12) at (0.5,0) {$8$};
      \node (l13) at (1,0) {$9$};
      \node (l21) at (0,-0.7) {$4$};
      \node (l22) at (0.5,-0.7) {$5$};
      \node (l23) at (1,-0.7) {$6$};


La façon la plus classique pour stocker une telle matrice est de le faire `ligne par ligne` comme représenté dans la :numref:`fig-matrice-ll`. Dans cette représentation, si la matrice a `l` lignes et `c` colonnes, alors l'élément `i,j` de la matrice se trouve à l'adresse :math:`A+ i \times c + j` en supposant que les indices des lignes et colonnes commencent à `0`.       

.. _fig-matrice-ll:

.. tikz:: Stockage ligne par ligne d'une matrice 

     	   
     
      \node (l11) at (0,0) {$7$};
      \node (l12) at (0.75,0) {$8$};
      \node (l13) at (1.5,0) {$9$};
      \node (l21) at (0,-0.7) {$4$};
      \node (l22) at (0.75,-0.7) {$5$};
      \node (l23) at (1.5,-0.7) {$6$};

      \node (mem) at (3,0) {Mémoire};
      \node (m0) at (3,-1) {\texttt{x}    $7$};
      \node (m1) at (3,-1.33) {\texttt{x+1}  $8$};
      \node (m2) at (3,-1.66) {\texttt{x+1}  $9$};
      \node (m3) at (3,-2) {\texttt{x+3}  $4$};
      \node (m4) at (3,-2.33) {\texttt{x+4}  $5$};
      \node (m5) at (3,-2.66) {\texttt{x+5}  $6$};


      \draw [->,color=blue] (l11.west) |-  (m0.west);
      \draw [->,color=blue] (l12.west) |-  (m1.west);
      \draw [->,color=blue] (l13.west) |-  (m2.west);      

      \draw [->,color=green] (l21.east) |-  (m3.west);
      \draw [->,color=green] (l22.east) |-  (m4.west);
      \draw [->,color=green] (l23.east) |-  (m5.west);

      
Il est aussi possible de stocker cette matrice colonne par colonne comme représenté dans la :numref:`fig-matrice-cc`. Dans cette représentation, si la matrice a `l` lignes et `c` colonnes, alors l'élément `i,j` de la matrice se trouve à l'adresse :math:`A+ j \times l + i` en supposant que les indices des lignes et colonnes commencent à `0`.

.. _fig-matrice-cc:

.. tikz:: Stockage colonne par colonne d'une matrice 


      \node (l11) at (0,0) {$7$};
      \node (l12) at (0.75,0) {$8$};
      \node (l13) at (1.5,0) {$9$};
      \node (l21) at (0,-0.7) {$4$};
      \node (l22) at (0.75,-0.7) {$5$};
      \node (l23) at (1.5,-0.7) {$6$};	  


      \node (mem) at (3,0) {Mémoire};
      \node (m0) at (3,-1) {\texttt{x}    $7$};
      \node (m1) at (3,-1.33) {\texttt{x+1}  $4$};
      \node (m2) at (3,-1.66) {\texttt{x+2}  $8$};
      \node (m3) at (3,-2) {\texttt{x+3}  $5$};
      \node (m4) at (3,-2.33) {\texttt{x+4}  $9$};
      \node (m5) at (3,-2.66) {\texttt{x+5}  $6$};
      

      \draw [->,color=blue] (l11.west) |-  (m0.west);
      \draw [->,color=blue] (l12.west) |-  (m2.west);
      \draw [->,color=blue] (l13.west) |-  (m4.west);      

      \draw [->,color=green] (l21.east) |-  (m1.west);
      \draw [->,color=green] (l22.east) |-  (m3.west);
      \draw [->,color=green] (l23.east) |-  (m5.west);
   
.. somme des éléments d'un tableau   
   
.. somme de deux vecteurs


On est parfois amené à manipuler des tableaux de différentes tailles. Dans ce cas, il est intéressant de réserver un mot en mémoire pour stocker la taille du tableau. Tout tableau utilisant cette représentation contient donc comme premier élément sa taille. Un tableau de `n` entiers occupe donc :math:`n+1` mots en mémoire.

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


.. code-block:: nasm



   JMP start
   jours: DB 0
   mois: 
   DB 12   ; nombre d'éléments dans le tableau
   DB 31
   DB 28
   DB 31
   DB 30
   DB 31
   DB 30
   DB 31
   DB 31
   DB 30
   DB 31
   DB 30
   DB 31
   start: MOV C, 1  ; index dans le tableau
   boucle: MOV A, C
   MUL 2
   ADD A, mois ; adresse en mémoire du Ceme mois 
   MOV B, [A]
   ADD B, [jours]
   MOV [jours], B
   INC C
   MOV D,[mois]
   CMP C,D
   JA fin
   JMP boucle
   fin: HLT

De plus, il est facile dans un programme ou un langage de programmation de vérifier que les accès aux éléments d'un tableau respectent bien les limites de ce tableau.

.. exemple get ou set avec erreur en cas de non respect des bornes

.. buffer overflow / segmentation fault ?
   
Utilisation des chaînes de caractères
-------------------------------------

Notre minuscule assembleur utilise un mot de 16 bits pour représenter chaque caractère. Une chaîne de caractères peut être vue comme un tableau de caractères. Elle sera donc composée de caractères consécutifs qui sont stockés en mémoire. En assembleur, nous pouvons stocker une chaînes de caractères en mémoire en utilisant directement le mot clé ``DB`` comme suit.


.. code-block:: nasm
		
   hello: DB "Hello World!" 




Un programme peut être amené à traiter des chaînes de caractères de tailles très différentes. Il existe deux techniques pour stocker ces chaînes de caractères
en mémoire. La première est de stocker la longueur de la chaîne suivie par les caractères qui la composent (:numref:`fig-hello`). Cette solution permet de facilement déterminer la longueur de la chaîne de caractères puisque celle-ci est explicitement stockée en mémoire. En utilisant un mot de 16 bits pour cette longueur, on peut supporter des chaînes contenant au maximum 65535 caractères. C'est largement assez pour le minuscule ordinateur vu l'espace de mémoire dont il dispose.

.. _fig-hello:

.. tikz:: Représentation en mémoire de la chaîne de caractères Hello! avec une indication explicite de longueur

     
      \node (l11) at (0,0) {H};
      \node (l12) at (0.25,0) {e};
      \node (l13) at (0.5,0) {l};
      \node (l21) at (0.75,0) {l};
      \node (l22) at (1,0) {o};
      \node (l23) at (1.25,0) {!};

      \node (mem) at (3,0) {Mémoire};
      \node[color =red] (m) at (4,-0.66) {\texttt{a}   $0000000000000111$};

      \node (m0) at (4,-1) {\texttt{a+2}   $00000000 01001000$};
      \node (m1) at (4,-1.33) {\texttt{a+4}   $00000000 01100101$};
      \node (m2) at (4,-1.66) {\texttt{a+6}   $00000000 01101100$};
      \node (m3) at (4,-2) {\texttt{a+8}   $00000000 01101100$};
      \node (m4) at (4,-2.33) {\texttt{a+10}   $00000000 01101111$};
      \node (m5) at (4,-2.66) {\texttt{a+12}   $00000000 00100001$};

      \draw [->] (l11.south) |-  (m0.west);
      \draw [->] (l12.south) |-  (m1.west);
      \draw [->] (l13.south) |-  (m2.west);
      \draw [->] (l21.south) |-  (m3.west);
      \draw [->] (l22.south) |-  (m4.west);
      \draw [->] (l23.south) |-  (m5.west);


      
.. caractère is in

A titre d'exemple, considérons un petit programme qui permet de déterminer si un caractère est présent dans une chaîne de caractères. En python, ce programme pourrait s'écrire comme suit:

.. literalinclude:: python/charin.py
   :language: python
   :end-before: #fin

		
La conversion de ce programme en minuscule assembleur est présentée ci-dessous. 

Ce programme a comme entrée la variable ``c`` et une chaîne de caractères qui est stockée en mémoire à partir de l'adresse ``29``.  Le résultat du programme se retrouve dans la variable ``r`` en mémoire.


.. code-block:: nasm

   JMP start
   ; Compte le nombre d'occurrences du caractère char dans la chaine string
   count: DB 0
   char:  DB "o"
   string:
   DB 12 ; longueur de la chaîne
   DB "Hello World!" ; Chaîne de caractères
   start:
   MOV C, [char]   ; caractère à rechercher 
   MOV D, 1        ; index de la position dans la chaîne
   boucle: 
   MOV A, D
   MUL 2
   ADD A, string
   CMP C, [A]
   JNE suite
   MOV A, [count]
   INC A
   MOV [count], A
   suite:  INC D            ; incrément indice boucle
   MOV B, [string]    ; longueur de la chaîne
   CMP D, B
   JBE boucle
   HLT		 

		

Il existe une seconde façon de stocker les chaînes de caractères. C'est celle qui est utilisée notamment par le :index:`langage C`. Ce langage utilise un caractère spécial (la valeur binaire `00000000 00000000` sur le minuscule ordinateur) pour marquer la fin de la chaîne de caractère.      
      

.. _fig-helloc:

.. tikz:: Représentation en mémoire de la chaîne de caractères Hello! avec marqueur de fin

	  
    
      \node (l11) at (0,0) {H};
      \node (l12) at (0.25,0) {e};
      \node (l13) at (0.5,0) {l};
      \node (l21) at (0.75,0) {l};
      \node (l22) at (1,0) {o};
      \node (l23) at (1.25,0) {!};

      \node (mem) at (3,0) {Mémoire};


      \node (m0) at (4,-1) {\texttt{a}   $00000000 01001000$};
      \node (m1) at (4,-1.33) {\texttt{a+2} $00000000 01100101$};
      \node (m2) at (4,-1.66) {\texttt{a+4} $00000000 01101100$};
      \node (m3) at (4,-2) {\texttt{a+6} $00000000 01101100$};
      \node (m4) at (4,-2.33) {\texttt{a+8} $00000000 01101111$};
      \node (m5) at (4,-2.66) {\texttt{a+10} $00000000 00100001$};
      \node[color =red] (m6) at (4,-3)  {\texttt{a+12} $00000000 00000000$};

      \draw [->] (l11.south) |-  (m0.west);
      \draw [->] (l12.south) |-  (m1.west);
      \draw [->] (l13.south) |-  (m2.west);
      \draw [->] (l21.south) |-  (m3.west);
      \draw [->] (l22.south) |-  (m4.west);
      \draw [->] (l23.south) |-  (m5.west);


En assembleur, une telle chaîne de caractères peut être déclarée comme suit.

.. code-block:: nasm
      
   hello: DB "Hello!"  
          DB 0	; Fin de chaîne


	  
Avec cette représentation des chaînes de caractères, le programme ne connaît pas a priori la longueur de la chaîne de caractères. Il doit la parcourir pour trouver le marqueur de fin symbolisé par la valeur ``0``. En python, le parcours de cette chaîne peut se faire en utilisant le programme ci-dessous.
      
.. literalinclude:: python/charin-c.py
   :language: python
   :end-before: #fin


En assembleur, ce programme peut s'écrire comme suit.

.. code-block:: nasm

   JMP start
   ; Compte le nombre d'occurrences du caractère char dans la chaine string
   count: DB 0
   char:  DB "o"
   string:
   DB "Hello World!" ; Chaîne de caractères
   DB 0              ; fin de chaîne
   start:
   MOV C, [char]   ; caractère à rechercher 
   MOV D, 0        ; index de la position dans la chaîne
   boucle: MOV A,D
   MUL 2
   ADD A, string
   CMP C, [A]
   JNE suite
   MOV B, [count]
   INC B
   MOV [count], B
   suite:  INC D            ; incrément indice boucle
   MOV B, 0
   CMP B, [A]         ; fin de chaîne ?
   JNE boucle
   HLT		




Les listes
----------


En python, les listes jouent un rôle très important. Elles permettent de stocker des
informations dont le nombre n'est pas fixé a priori et leur taille s'adapte dynamiquement
à l'exécution du programme. Il y a différentes solutions qui permettent d'organiser de telles listes.

.. spelling:word-list::

   ArrayList
   l'ArrayList


Une première approche est d'utiliser un tableau, généralement dénommé :index:`ArrayList`
dont la taillé évolue au fur et à mesure de son remplissage. En assembleur, on peut facilement
construire un tableau d'une taille quelconque. Il suffit de réserver la zone mémoire
correspondante et d'adapter ensuite la taille du tableau. Considérons un tableau d'entiers.
On pourrait par exemple commencer par un tableau vide qui pourrait être déclaré comme
suit.

.. code-block:: nasm

   alist: DB 4 ; taille initiale (en éléments)
   DB 0        ; nombre actuel d'éléments
   DB 0        ; élément à l'indice 0
   DB 0        ; élément à l'indice 1
   DB 0        ; élément à l'indice 2
   DB 0        ; élément à l'indice 3


Si l'on veut ajouter l'entier ``17`` dans ce tableau, il suffit d'incrémenter la zone
mémoire qui stocke le nombre d'éléments présents dans le tableau. Celui-ci
correspond maintenant à la déclaration suivante.


.. code-block:: nasm

   alist: DB 4 ; taille initiale (en éléments)
   DB 1        ; nombre actuel d'éléments
   DB 17        ; élément à l'indice 0
   DB 0        ; élément à l'indice 1
   DB 0        ; élément à l'indice 2
   DB 0        ; élément à l'indice 3
   

On peut continuer en ajoutant les entiers ``9``, ``12`` et ``23``. A ce stade, l'``ArrayList``
est pleine.

.. code-block:: nasm

   alist: DB 4 ; taille maximale (en éléments)
   DB 4        ; nombre actuel d'éléments
   DB 17        ; élément à l'indice 0
   DB 9        ; élément à l'indice 1
   DB 12        ; élément à l'indice 2
   DB 23        ; élément à l'indice 3
   
On peut facilement retirer un entier de la liste. Pour retirer l'entier ``23``, il
suffit de décrémenter le nombre d'éléments de la liste. Pour retirer l'entier ``9``, c'est
plus compliqué car il faut non seulement décrémenter le nombre d'éléments, mais aussi
ramener les éléments suivants vers le début de la liste pour aboutir à la mémoire
représentée ci-dessous.

.. code-block:: nasm

   alist: DB 4 ; taille maximale (en éléments)
   DB 3        ; nombre actuel d'éléments
   DB 17        ; élément à l'indice 0
   DB 12        ; élément à l'indice 1
   DB 23        ; élément à l'indice 2
   DB 23        ; élément à l'indice 3

Lorsque l'on veut ajouter un élément à une :index:`ArrayList` qui est pleine, il
faut trouver une nouvelle zone de mémoire qui est libre et a une taille supérieure à celle
de notre :index:`ArrayList`. Il faut y copier le contenu de l'ArrayList de façon à
avoir suffisamment d'espace pour faire grandir la liste par après. Cela demande une gestion
de la mémoire qui sort du cadre de ce cours introductif.

Une autre approche pour gérer une liste est d'utiliser une structure chaînée. Tout
comme dans l'exemple précédent, considérons une liste contenant des entiers. Chaque
élément de la liste sera composé de deux blocs de 16 bits consécutifs en mémoire.
Le premier contient l'adresse de l'élément suivant de la liste (et ``0`` si l'élément
n'a pas de successeur). Le second bloc contient la valeur entière
stockée en mémoire.


   

