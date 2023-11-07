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
qui peuvent prendre les valeurs ``0`` et ``1``, il peut stocker :math:`2^16` nombres
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


		

   
.. todo pas convaincu de continue et break
