.. LSINC1102 documentation master file, created by
   sphinx-quickstart on Tue Jan 28 18:06:33 2020.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Langage d'assemblage
====================


Avec la mémoire et l'ALU nous avons les briques de base qui vont nous permettre de construire un micro-processeur qui sera capable d'exécuter de petits programmes. Ce micro-processeur répond à ce que l'on appelle l':index:`architecture de Von Neuman`.

Cette architecture est composée d'un :index:`processeur` (:index:`CPU
` en anglais) ou unité de calcul et d'une mémoire. Le processeur est un circuit électronique qui est capable d'effectuer de nombreuses tâches :

 - lire de l'information en mémoire
 - écrire de l'information en mémoire
 - réaliser des calculs

L'architecture des ordinateurs est basée sur l'architecture dite de Von Neumann. Suivant cette architecture, un ordinateur est composé d'un processeur qui exécute un programme se trouvant en mémoire. Ce programme manipule des données qui sont aussi stockées en mémoire. 

.. expliquer von neuman

Dans notre minuscule ordinateur, toutes les informations sont stockées sous la forme de nombres binaires. Le livre a fait le choix d'utiliser des mots de 16 bits comme unité de base pour les calculs et la mémoire. On pourrait dire que notre minuscule ordinateur est un ordinateur "16 bits". Ce choix a plusieurs conséquences sur les données qui sont traitées par ce minuscule processeur:

 - les entiers sont représentés en utilisant la notation binaire en complément à deux sur 16 bits
 - chaque caractère ASCII est également stocké sous la forme d'un nombre sur 16 bits

Notre minuscule processeur ne supporte pas les nombres réels. L'utilisation de 16 bits pour représenter chaque caractère constitue un gaspillage de la mémoire puisqu'il suffit d'utiliser 8 bits pour représenter les caractères ASCII. Cependant, ce gaspillage de mémoire permet de simplifier fortement l'implémentation de notre minuscule processeur comme vous le verrez dans le prochain projet. On ne peut pas gagner de tous les points de vue.

Les ordinateurs actuels sont basés sur d'autres choix. Les entiers sont encodés sur 32 ou 64 bits tandis que les caractères sont soit encodés sur 8 bits lorsque l'on utilise la représentation ASCII historique soit sur 16 bits pour la représentation Unicode.


Le minuscule ordinateur construit dans le livre de référence a d'autres caractéristiques particulières qui simplifient sa réalisation mais ne correspondent pas nécessairement aux ordinateurs actuels. Ce minuscule ordinateur utilise deux mémoires séparées :

 - une mémoire dite mémoire d'instructions contenant le code des programmes à exécuter
 - une mémoire dite mémoire de données contenant les données à traiter

Ces deux mémoires ont chacune une capacité de 16384 mots de 16 bits. La plupart des ordinateurs actuels utilisent une mémoire qui contient indifféremment les données et le code machine des programmes. La mémoire d'instructions de notre minuscule ordinateur est une mémoire de type ROM. Elle est initialisée au lancement de l'ordinateur avec le programme à exécuter mais ne peut pas être modifiée par un programme. La mémoire de données elle est une mémoire de type RAM dans laquelle les programmes peuvent lire et écrire des données.

Une autre différence entre le minuscule ordinateur et un ordinateur actuel est la façon dont on accède aux données en mémoire. Le minuscule ordinateur peut uniquement lire ou écrire un mot de 16 bits à la fois à une adresse donnée en mémoire de données. Un ordinateur actuel peut lire et écrire un octet en mémoire, un mot de 16, 32 ou 64 bits voire beaucoup plus dans certains cas.

Outre ces deux mémoires, notre minuscule processeur dispose de deux registres :

 - le premier, baptisé ``D`` est utilisé pour stocker un mot de 16 bits qui est lu depuis la mémoire ou résulte d'un calcul réalisé par l'ALU
 - le second, baptisé ``A``. Il a un double rôle. Tout d'abord, va il servir à stocker une donnée sur 16 bits comme le registre ``D``. Son deuxième rôle est de contenir une adresse dans la mémoire de données pour permettre le chargement d'une donnée depuis cette mémoire.


Ces deux registres ``A`` et ``D`` sont schématiquement connectés à l'ALU qui est le coeur de notre minuscule processeur. Cela permet d'utiliser l'ALU pour réaliser différents calculs sur ces deux registres (:numref:`fig-alu-ad`).

.. _fig-alu-ad:
.. tikz:: Les registres A, D et l'ALU

   [
     reg/.style={rectangle, draw, minimum width=2.7 cm}
   ]
   \node[reg] (output) at (2,0) {\small sortie [16 bits]};
   \node[reg] (D) at (-3,0.5) {\small D [16 bits]};
   \node[reg] (A) at (-3,-0.5) {M/A [\small 16 bits]};

   \draw (-0.75,-1) -- (-0.75, 1) -- (0,0.35) -- (0,-0.35) -- cycle;

   \draw[->] (A.east) -- (-0.5,-0.5);
   \draw[->] (D.east) -- (-0.5,0.5);
   \draw[->] (0,0) -- (output.west);
   
A côté de ces deux registres qui sont associés aux données, notre minuscule processeur contient également un registre baptisé ``PC`` (pour `Program Counter` ou compteur de programmes). Ce registre contient l'adresse de l'instruction qui est exécutée par le minuscule processeur. Nous verrons plus tard comment celui-ci est utilisé.  


Les instructions du minuscule processeur
----------------------------------------


Avant de construire le minuscule processeur dans le projet suivant, nous devons d'abord comprendre quelles sont les instructions que celui-ci peut exécuter. Il supporte deux types d'instructions qui sont toutes les deux encodées sous la forme d'un mot de 16 bits.

L'instruction de type A
_______________________

L'instruction la plus simple du minuscule microprocesseur est l'instruction de type `A`. Cette instruction permet simplement de charger un nombre binaire sur 15 bits dans le registre ``A``. Dans les logiciels fournis avec le livre de référence, cette instruction s'écrit ``@`` suivi de la valeur à placer dans le registre ``A``. La valeur passée comme argument de cette instruction de type `A` est obligatoirement un entier positif. Nous verrons plus tard comment indiquer une constante négative.

.. code-block:: console

   @1           // charge la valeur 1 dans A    
   @123		// charge la valeur 123, i.e. 1111011 en binaire dans A


Vous pouvez télécharger cet exemple depuis :download:`asm/ex0.asm`.

..	 <video controls src="_static/asm-123.mp4"></video>

   
Cette instruction a trois utilisations en pratique. Tout d'abord, elle permet de charger une valeur constante dans le registre ``A``. Mais surtout elle est utilisée avec les instructions de type C pour soit indiquer une adresse mémoire à laquelle une donnée doit être chargée soit une adresse mémoire où un saut doit être réalisé si une condition sont vérifiées. Nous y reviendrons.


Comme toutes les instructions, l'instruction de type A est encodée sous la forme d'un mot de 16 bits. L'encodage est extrêmement simple :

 - le bit de poids fort est mis à ``0``
 - les quinze bits de poids fort sont la valeur de l'argument de l'instruction en binaire


C'est à cause de l'encodage de l'instruction dans un mot de 16 bits que la constante qui est passée en argument doit être encodée sur 15 bits.


L'instruction de type C
_______________________

Cette instruction est l'instruction "à tout faire" du minuscule processeur. C'est elle qui permet d'utiliser toutes les fonctionnalités de l'ALU mais aussi d'implémenter des instructions conditionnelles et des boucles comme nous le verrons par après.

Plutôt que de présenter directement toutes les possibilités de cette instruction, nous allons la construire petit à petit sur base d'exemples illustratifs. Une première utilisation de l'instruction de type `C` est de charger des données depuis la mémoire vers un registre ou d'un registre vers la mémoire. Cette variante de l'instruction `C` s'écrit généralement sous la forme :math:`dest = calcul`. Nous verrons plus tard comment réaliser un calcul en utilisant l'ALU. Commençons par observer le fonctionnement de cette instruction. La partie gauche de l'instruction de type `C` indique l'endroit où le résultat de notre calcul doit être stocké. La première destination possible est le registre `D`. Une deuxième destination possible est le registre `A`. Enfin, la troisième destination possible pour le résultat d'un calcul de l'ALU est la mémoire. Dans le minuscule assembleur, ceci est représenté en utilisant le symbole `M`. Ce symbole est un raccourci pour représenter le mot de 16 bits en mémoire se trouvant à l'adresse contenue dans le registre `A`. Ces trois destinations peuvent être combinées entre elles. La partie gauche de l'instruction de type `C` peut contenir les symboles suivants :

 - ``D`` le résultat du calcul doit être stocké dans le registre ``D``
 - ``A`` le résultat du calcul doit être stocké dans le registre ``A``
 - ``M`` le résultat du calcul doit être stocké dans la mémoire à l'adresse qui se trouve actuellement dans le registre ``A``
 - ``MD`` le résultat du calcul doit être stocké dans le registre ``D`` et dans la mémoire à l'adresse qui se trouve actuellement dans le registre ``A``
 - ``AM`` le résultat du calcul doit être stocké dans le registre ``A`` et dans la mémoire à l'adresse qui se trouve actuellement dans le registre ``A``
 - ``AD`` le résultat du calcul doit être stocké dans le registre ``A`` et dans le registre ``D``
 - ``AMD`` le résultat du calcul doit être stocké dans le registre ``A``, le registre ``D`` et dans la mémoire à l'adresse qui se trouve actuellement dans le registre ``A``
   
Il est aussi possible d'avoir une instruction de type `C` qui ne modifie ni les registres ``A``/``D`` ni la mémoire. Nous en parlerons plus tard.


La partie droite de l'instruction de type `C` permet de spécifier le calcul à réaliser. Une première possibilité est de prendre la valeur d'un registre ou d'une zone mémoire sans demander à l'ALU de réaliser un calcul particulier. Les trois calculs les plus simples à réaliser correspondent aux symboles ``A``, ``D`` et ``M`` :

 - ``D`` le résultat du calcul est la valeur stockée dans le registre ``D``
 - ``A`` le résultat du calcul est la valeur stockée dans le registre ``A``
 - ``M`` le résultat du calcul est la donnée qui se trouve en mémoire à l'adresse qui se trouve actuellement dans le registre ``A``
 

Nous pouvons maintenant explorer ces différentes instructions. Supposons que la mémoire contient les valeurs reprises dans :numref:`table-mem0123`.


.. _table-mem0123:

.. table:: Contenu de la mémoire

   ======= ======
   adresse valeur
   ------- ------   
   0       9   
   1       2
   2       4
   3       1
   ======= ======

Commençons par le code qui permet de charger une donnée en mémoire. 

.. code-block:: console

   @1     // place l'adresse 1 dans le registre A
   D=M    // lit la donnée à l'adresse 1 en mémoire et la place dans D

   
Après exécution de ces deux instructions, le registre ``D`` contient la valeur qui se trouvait en mémoire à l'adresse `1`, c'est-à-dire `2`.

Vous pouvez télécharger cet exemple depuis :download:`asm/ex1.asm`.

	 
Notre deuxième exemple montre qu'il est aussi possible de charger le registre ``A`` avec une valeur stockée en mémoire.

.. code-block:: console

   @1     // place l'adresse 1 dans le registre A
   A=M    // lit la donnée à l'adresse 1 en mémoire (2) et la place dans A
   D=M    // lit la donnée à l'adresse 2 en mémoire (4) et la place dans D


Vous pouvez télécharger cet exemple depuis :download:`asm/ex2.asm`.
   
   
Notre troisième exemple montre comment déplacer une information en mémoire.

.. code-block:: console

   @3     // place l'adresse 1 dans le registre A
   AD=M   // lit la donnée à l'adresse 3 en mémoire (1) et la place dans A et D
   @0     // place l'adresse 0 dans le registre A
   M=D    // sauve la donnée se trouvant dans D en mémoire à l'adresse se trouvant dans A (0)

Vous pouvez télécharger cet exemple depuis :download:`asm/ex3.asm`.

   
Nous pouvons maintenant utiliser ces instructions pour réaliser des initialisations de variables comme dans un langage de haut niveau comme python. En python cette initialisation s'écrit comme en :numref:`code-init-var-py`

.. _code-init-var-py:
.. code-block:: python
   :caption: Initialisation de variables en python
	 
   a=1
   b=42

Avant de pouvoir initialiser des variables en assembleur, nous devons d'abord définir l'adresse en mémoire à laquelle chaque variable est stockée. Par convention, le minuscule processeur réserve les adresses de `0` à `15` en mémoire de données pour certaines utilisations particulières. Nous pouvons donc stocker nos variables à partir de l'adresse `16`. Nous pouvons par exemple placer la variable ``a`` à l'adresse `16` et la variable `b` à l'adresse `17`. Dans un programme en assembleur, on définit généralement une table des symboles associe une adresse ç chaque variable du programme. Dans notre exemple, cette table des symboles pourrait être celle du :numref:`table-symb-ab`.


.. _table-symb-ab:

.. table:: Table des symboles

   ======= ========
   adresse variable
   ------- --------   
   16       a   
   17       b
   18       -
   ...
   ======= ========
   


Pour initialiser ces variables, la séquence d'instruction à utiliser est la suivante. Premièrement, il faut charger la valeur `1` dans le registre ``D``. Ensuite il faut charger dans le registre ``A`` l'adresse de la variable `a` (16 dans notre exemple) pour pouvoir sauver le contenu du registre ``D`` à cette adresse en mémoire. On fait de même pour l'initialisation de la variable ``b``.

.. _code-init-var-asm:
.. code-block:: console
   :caption: Initialisation de variables en assembleur		

   @1    // valeur 1 pour l'initialisation
   D=A    
   @16   // adresse de la variable a
   M=D
   @42   // valeur 42 pour l'initialisation
   D=A
   @17   // adresse de la variable b
   M=D


Vous pouvez télécharger cet exemple depuis :download:`asm/ex4.asm`.

     
Dans un programme python, il est parfois nécessaire d'échanger le contenu de la variable ``a`` avec celui de la variable ``b``. En python, cela peut se faire de deux façons. La première solution est d'utiliser une variable intermédiaire (:numref:`code-swap2-var-py`)

.. _code-swap-var-py:
.. code-block:: python
   :caption: Echange de contenu de variables en python
	 
   x=a
   a=b
   b=x

Pour simplifier la vie du programmeur, python permet de cacher la création d'une variable temporaire et supporte la forme compacte reprise en :numref:`code-swap2-var-py`.
   
.. _code-swap2-var-py:
.. code-block:: python
   :caption: Echange de contenu de variables en python (forme compacte)
	 
   a,b = b, a

   
Pour faire la même opération en langage assembleur, nous devons aussi passer par une zone mémoire intermédiaire. Dans notre exemple, l'adresse ``18`` est inutilisée. Nous pouvons donc y placer le contenu de la variable ``b`` avant d'y copier le contenu de la variable ``a`` comme dans le programme en python. La code assembleur est présenté en :numref:`code-swap-var-asm`.


.. _code-swap-var-asm:
.. code-block:: console
   :caption: Echange du contenu de variables en assembleur		

   @17   // variable b
   D=M
   @18   // variable x
   M=D
   @16   // variable a
   D=M
   @17   // variable b
   M=D
   @18   // variable x
   D=M
   @16   // variable b
   M=D


Vous pouvez télécharger cet exemple depuis :download:`asm/ex5.asm`.

   
Continuons notre exploration des instructions de type `C`. L'ALU de notre minuscule processeur est aussi capable de produire les constantes suivantes :

 - ``0``
 - ``1``
 - ``-1``

Ces constantes peuvent apparaître dans la partie de droite d'une instruction de type `C`. A titre d'exemple le :numref:`code-init2-var-asm` initialise le contenu de la variable ``x`` à la valeur `1` et celui de la variable ``y`` à `-1`.

.. _code-init2-var-asm:
.. code-block:: console
   :caption: Initialisation de variables

   @20   // variable x
   M=1
   @21   // variable y
   M=-1

Vous pouvez télécharger cet exemple depuis :download:`asm/ex6.asm`.
   
Notre minuscule ALU peut aussi réaliser des calculs sur un registre ou une valeur lue en mémoire. La partie de droite d'une instruction de type `C` peut en effet contenir les symboles suivants:

 - ``!D`` : le résultat de l'ALU sera le résultat de l'application de l'opération `NOT` à tous les bits du contenu du registre ``D``
 - ``!A`` : le résultat de l'ALU sera le résultat de l'application de l'opération `NOT` à tous les bits du contenu du registre ``A``
 - ``!M`` : le résultat de l'ALU sera le résultat de l'application de l'opération `NOT` à tous les bits du mot lu en mémoire à l'adresse contenue dans le registre ``A``  

 - ``-D`` : le résultat de l'ALU sera l'opposé du contenu du registre ``D``
 - ``-A`` : le résultat de l'ALU sera l'opposé du contenu du registre ``A``
 - ``-M`` : le résultat de l'ALU sera l'opposé du mot lu en mémoire à l'adresse contenue dans le registre ``A``

 - ``D+1`` : le résultat de l'ALU sera le contenu du registre ``D`` incrémenté de `1`
 - ``A+1`` : le résultat de l'ALU sera le contenu du registre ``A`` incrémenté de `1`
 - ``M+1`` : le résultat de l'ALU sera le mot lu en mémoire à l'adresse contenue dans le registre ``A`` incrémenté de `1`

 - ``D-1`` : le résultat de l'ALU sera le contenu du registre ``D`` décrémenté de `1`
 - ``A-1`` : le résultat de l'ALU sera le contenu du registre ``A`` décrémenté de `1`
 - ``M-1`` : le résultat de l'ALU sera le mot lu en mémoire à l'adresse contenue dans le registre ``A`` décrémenté de `1`

Enfin, il est possible d'utiliser l'ALU pour effectuer des opérations arithmétiques (addition et soustraction) et logiques (`AND` et `OR`) avec les registres ``A`` et ``D`` ainsi que le mot lu en mémoire à l'adresse se trouvant dans le registre ``A``. Le minuscule processeur supporte six opérations arithmétiques.

 - ``A+D`` : le résultat de l'ALU sera le résultat de l'addition du contenu du registre ``D`` et du contenu du registre ``A``
 - ``D+M`` : le résultat de l'ALU sera le résultat de l'addition du contenu du registre ``D`` et du mot lu en mémoire à l'adresse contenue dans le registre ``A``

 - ``A-D`` : le résultat de l'ALU sera le résultat de la soustraction du contenu du registre ``A`` moins le contenu du registre ``D``
 - ``D-A`` : le résultat de l'ALU sera le résultat de la soustraction du contenu du registre ``D`` moins le contenu du registre ``A``
 - ``D-M`` : le résultat de l'ALU sera le résultat de la soustraction du contenu du registre ``D`` moins le mot lu en mémoire à l'adresse contenue dans le registre ``A``
 - ``M-D`` : le résultat de l'ALU sera le résultat de la soustraction du mot lu en mémoire à l'adresse contenue dans le registre ``A`` moins le contenu du registre ``D``

Les dernières opérations supportées par l'ALU sont les opération logiques.
   
 - ``D&A`` : le résultat de l'ALU sera le résultat de l'opération logique `AND` appliquée au contenu du registre ``D`` et au contenu du registre ``A``
 - ``D|A`` : le résultat de l'ALU sera le résultat de l'opération logique `OR` appliquée au contenu du registre ``D`` et au contenu du registre ``A``
 - ``D&M`` : le résultat de l'ALU sera le résultat de l'opération logique `AND` appliquée au contenu du registre ``D`` et au mot lu en mémoire à l'adresse contenue dans le registre ``A``
 - ``D|M`` : le résultat de l'ALU sera le résultat de l'opération logique `OR` appliquée au contenu du registre ``D`` et au mot lu en mémoire à l'adresse contenue dans le registre ``A``
   

Avec ces 28 opérations, nous pouvons maintenant réaliser de très nombreuses opérations arithmétiques et logiques. Dans un programme informatique, il est très courant de devoir incrémenter ou décrémenter une variable. Dans notre minuscule langage d'assemblage, cette opération peut se réaliser de différentes façons. Une première solution pour incrémenter une variable est d'y ajouter la constante ``1``. Supposons que notre variable soit stockée à l'adresse 20.

.. _code-inc-var-asm:
.. code-block:: console
   :caption: Incrémentation de la valeur d'une variable en assembleur		

   @20   // adresse de la variable
   D=M   // chargement de la valeur de la variable
   @1    // constante 1
   D=D+1 // addition
   @20   // adresse de la variable
   M=D   // sauvegarde du résultat en mémoire

Vous pouvez télécharger cet exemple depuis :download:`asm/ex7.asm`.
   
Il existe une solution nettement plus compacte et plus efficace (:numref:`code-inc2-var-asm`).

.. _code-inc2-var-asm:
.. code-block:: console
   :caption: Incrémentation de la valeur d'une variable en assembleur		

   @20   // adresse de la variable
   M=M+1


Vous pouvez télécharger cet exemple depuis :download:`asm/ex7b.asm`.
   
Il en va de même pour décrémenter la valeur d'une variable (:numref:`code-dec-var-asm`).

.. _code-dec-var-asm:
.. code-block:: console
   :caption: Décrémentation d'une variable en assembleur		

   @20   // adresse de la variable
   M=M-1


Vous pouvez télécharger cet exemple depuis :download:`asm/ex7c.asm`.

Le minuscule langage d'assemblage permet de réaliser des opérations mathématiques plus complexes. il est en effet possible de combiner des additions et des soustractions. Supposons que `A`, `B` et `C` sont des variables entières et qu'il faut calculer :math:`A+B-C` et stocker le résultat dans la variable :math`X`. Pour cela, il faut d'abord fixer les adresses mémoires dans lesquelles ces variables sont stockées (:numref:`table-symb-abcx`).
   
.. _table-symb-abcx:

.. table:: Table des symboles

   ======= ========
   adresse variable
   ------- --------   
   21       A   
   22       B
   23       C
   25       X
   ======= ========   

.. _code-calc-abcx-asm:   
.. code-block:: console
   :caption: X=A+B-C en assembleur minuscule

   @21   // adresse de la variable A
   D=M   // chargement de la valeur de la variable
   @22   // adresse de la variable B
   D=D+M // addition, D contient A+B
   @23   // adresse de la variable C
   D=D-M // soustraction, D contient A+B-C
   @25   // adresse de la variable X
   M=D   // sauvegarde du résultat en mémoire 

Vous pouvez télécharger cet exemple depuis :download:`asm/ex8.asm`.
   
On peut également utiliser les instructions de notre langage d'assemblage pour calculer l'opposé d'un nombre. Si la variable est stockée à l'adresse ``20`` et que son opposé doit être stocké à l'adresse ``24``, une première solution est de procéder comme dans le :numref:`code-oppose-asm`.

.. _code-oppose-asm:   
.. code-block:: console
   :caption: Calcul de l'opposé

   @20   // adresse de la variable 
   D=-M  // calcul de l'opposé
   @24   // adresse de la variable B
   M=D   // sauvegarde du résultat en mémoire 


Vous pouvez télécharger cet exemple depuis :download:`asm/ex9.asm`.   
   
   
Exercices
_________

.. trouver des exercices simples à faire avec ces constructions ?

1. Proposez deux façons pour initialiser la variable ``X`` qui est stockée à l'adresse ``23`` à la valeur ``17``.

2. Avec le minuscule langage d'assemblage, comment faire pour initialiser une variable à la valeur ``-2`` ?   

3. Que font les instructions en assembleur minuscule ci-dessous ?

   .. calcul de l'opposé (rappel: en complément à deux, -A=NOT(A)+1, cfr ALU
   
   .. code-block:: console
   

      @20 
      D=!M
      D=D+1
      @25 
      M=D  

.. Proposer avec Mathieu quelques exercices de lecture de code

4. Avec le minuscule assembleur, l'initialisation d'une variable se fait normalement avec une instruction de type `A` :

  .. code-block:: console
   

      @1234   // valeur
      D=A
      @16     // adresse variable
      M=D

  Cependant, comme l'instruction de type `A` est encodée sur 16 bits, il n'y a que 15 bits de disponibles pour encoder cette valeur. Comment feriez-vous pour traduire l'assignation ``x=50000`` en minuscule assembleur ?    

  .. faire un calcul pour obtenir ce résultat, par exemple 25000+25000

5. Le minuscule assembleur supporte les opérations logiques `AND` et `OR` de l'ALU. Certains langages de programmation supportent également l'opration `XOR`. Comment feriez-vous pour implémenter l'opération `XOR` en minuscule assembleur ?
     
  
Toutes les instructions de type `C` sont encodées sous la forme d'un mot de 16 bits qui a la structure suivante :

 :math:`1 1 1 a c_1 c_2 c_3 c_4 c_5 c_6 d_1 d_2 d_3 j_1 j_2 j_3`


Dans cette structure, le bit de poids fort mis à `1` permet au minuscule processeur de distinguer une instructions de type `A` (dont le bit de poids fort est mis à `0`) d'une instruction de type `C`. Les deux bits suivants ne sont pas utilisés par le minuscule processeur. Ensuite, les bits `a` et :math:`c_i` servent à spécifier les différentes instructions que nous avons présenté ci-dessus. Le livre de référence contient la spécification complète de ces instructions. En voici quelques unes à titre d'exemples. Pour les instructions arithmétiques et logiques, les bits de poids faible (:math:`j_1 j_2 j_3` sont mis à `0`).

 - l'instruction ``M=D+1`` a comme encodage ``1 1 1 0 0 1 1 1 1 1 0 0 1 0 0 0``. Dans cet encodage, ``0 0 1 1 1 1 1`` représente le membre de droite (``D+1``) et ``0 0 1`` le membre de gauche de l'instruction
 - l'instruction ``D=D+1`` a comme encodage ``1 1 1 0 0 1 1 1 1 1 0 1 0 0 0 0``. Dans cet encodage, ``0 0 1 1 1 1 1`` représente le membre de droite (``D+1``) et ``0 1 0`` le membre de gauche de l'instruction
 - l'instruction ``AMD=A-D`` a comme encodage ``1 1 1 0 0 0 0 1 1 1 1 1 1 0 0 0``. Dans cet encodage, ``0 0 0 0 1 1 1`` représente le membre de droite (``A-D``) et ``1 1 1`` le membre de gauche de l'instruction    

   

Les instructions de saut
------------------------

Pour exécuter un programme, notre minuscule processeur doit charger une nouvelle instruction à chaque cycle d'horloge. Il le fait en utilisant le registre ``PC``. Celui-ci est initialisé à la valeur ``0`` lorsque le minuscule processeur démarre. A chaque cycle d'horloge, le minuscule processeur réalise les opérations suivantes :

 - lecture de l'instruction se trouvant à l'adresse qui est stockée dans le registre ``PC``
 - décodage de l'instruction lue en mémoire
 - exécution de l'instruction lue en mémoire
 - mise à jour du registre ``PC``

L'exécution de toutes les instructions que nous avons vu jusque maintenant se termine par l'incrémentation du contenu du registre ``PC``. Cela permettra à notre minuscule processeur de charger automatiquement l'instruction suivante lors du prochain cycle d'horloge.


.. spelling::

   Program
   Counter
   
L'encodage de l'instruction de type `C` que les trois bits de poids faible (:math:`j_1 j_2 j_3`) restent disponibles. Ceux-ci vont nous permettre de supporter les instructions conditionnelles (``if ... else``) et les boucles. Pour comprendre comment ces instructions sont supportées en langage d'assemblage, nous devons d'abord comprendre comment fonctionne le :index:`compteur de programme` (ou :index:`Program Counter` - PC en anglais). Ce compteur de programme est un registre qui fait partie de notre minuscule processeur et qui contient à tout instant l'adresse de l'instruction que le minuscule processeur exécute. Reprenons le code du calcul de l'opposé (:numref:`code-oppose-asm`). Ce code contient quatre instructions. Il est stocké dans la mémoire d'instructions (:numref:`table-oppose-imem`). 


.. _table-oppose-imem:

.. table:: Instructions du calcul de l'opposé en mémoire d'instructions

   ======= ===========
   adresse instruction
   ------- -----------   
   51      @20    
   52      D=-M
   53      @24
   54      M=D
   ======= ===========


Pour exécuter ces instructions en mémoire d'instructions, le `PC` prend d'abord la valeur `51`. Le minuscule processeur exécute à ce moment l'instruction ``@20``. A la fin de l'exécution de cette instruction, le `PC` est incrémenté d'une unité et passe à `52`. Il exécute ensuite l'instruction ``D=-M``. A la fin de l'exécution de cette instruction, le `PC` passe à la valeur `53` et ainsi de suite.

Les trois bits de poids fort de l'instruction de type `C` permettent d'influencer la façon dont le contenu du `PC` est modifié à la fin de l'exécution de l'instruction en cours. Lorsque ces trois bits valent `0 0 0`, le `PC` est incrémenté d'une unité. Si par contre ces trois bits valent `1 1 1`, le `PC` prend la valeur qui se trouve dans le registre `A` pour réaliser un saut (`jump` en anglais). Pour comprendre l'utilisation de ces sauts, revenons aux instructions qui nous permettent d'incrémenter un variable en mémoire (:numref:`code-inc2-var-asm`). Supposons que notre variable est stockée à l'adresse ``22`` en mémoire de données et que notre séquence d'instructions commence à l'adresse ``71`` en mémoire d'instructions.



.. _table-inc-imem:

.. table:: Un programme qui ne s'arrête jamais

   ======= ===========
   adresse instruction
   ------- -----------   
   71      @22    
   72      M=M+1
   73      @71
   74      0;JMP
   ======= ===========

Vous pouvez télécharger cet exemple depuis :download:`asm/ex10.asm`.   
   
Exécutons le programme représenté en :numref:`table-inc-imem` instruction par instruction en supposant que la mémoire de données contient initialement la valeur `0` à l'adresse ``22``. Les instructions suivantes sont exécutées :

 - exécution de l'instruction à l'adresse ``71``, chargement de la valeur `22` dans le registre `A`, `PC` passe à ``72``
 - exécution de l'instruction à l'adresse ``72``, incrémentation de la valeur stockée en mémoire à l'adresse se trouvant dans le registre `A`. L'adresse `22` en mémoire de données contient maintenant `1`. `PC` passe à ``73``
 - exécution de l'instruction à l'adresse ``73``, chargement de la valeur `71` dans le registre `A`, `PC` passe à ``74``
 - exécution de l'instruction à l'adresse ``74``, le `PC` prend la valeur stockée dans le registre `A` (``71``)
 - exécution de l'instruction à l'adresse ``71``, chargement de la valeur `22` dans le registre `A` (1), `PC` passe à ``72``
 - exécution de l'instruction à l'adresse ``72``, incrémentation de la valeur stockée en mémoire à l'adresse se trouvant dans le registre `A`. L'adresse `22` en mémoire de données contient maintenant `2`. `PC` passe à ``73``
 - exécution de l'instruction à l'adresse ``73``, chargement de la valeur `71` dans le registre `A`, `PC` passe à ``74``
 - exécution de l'instruction à l'adresse ``74``, le `PC` prend la valeur stockée dans le registre `A` (``71``)
 - ...

   
Ce programme ne s'arrêtera jamais. Il est équivalent au code python suivant.

.. code-block:: python

   while True:
     x=x+1


Les instructions de saut conditionnel
-------------------------------------
     
L'instruction de saut (``0;JMP``) est très fréquente en assembleur. Elle permet d'effectuer un saut qui est dit non-conditionnel car la valeur du `PC` est toujours modifiée. A côté de cette instruction, notre minuscule langage d'assemblage supporte plusieurs instructions de :index:`saut conditionnel`. Ces instructions modifient la valeur du `PC` uniquement si une condition particulière est vérifiée. Le langage d'assemblage du minuscule processeur supporte six instructions de saut conditionnel :

.. spelling::

   Jump
   EQual
   Greater
   Than
   Lower
   than
   to
   
 - ``JEQ`` (Jump if EQual to 0). Avec cette instruction, le saut est réalisé uniquement si le résultat du calcul fait par l'ALU est nul.
 - ``JNE`` (Jump if Not Equal to 0). Avec cette instruction, le saut est réalisé uniquement si le résultat du calcul fait par l'ALU est différent de zéro.
 - ``JGT`` (Jump if Greater Than 0). Avec cette instruction, le saut est réalisé uniquement si le résultat du calcul fait par l'ALU est strictement positif.
 - ``JLT`` (Jump if Lower Than 0). Avec cette instruction, le saut est réalisé uniquement si le résultat du calcul fait par l'ALU est strictement inférieur à 0.
 - ``JGE`` (Jump if Greater than or Equal to 0). Avec cette instruction, le saut est réalisé uniquement si le résultat du calcul fait par l'ALU est supérieur ou égal à 0.
 - ``JLE`` (Jump if Lower than or Equal to 0). Avec cette instruction, le saut est réalisé uniquement si le résultat du calcul fait par l'ALU est inférieur ou égal à 0.   


Avec ces six instructions, il est possible de supporter les instructions conditionnelles et les boucles avec le minuscule langage d'assemblage. Commençons par les instructions conditionnelles. Supposons que l'on veuille mettre dans la variable ``y`` la valeur absolue de la variable ``x``. En python, une première approche pourrait être celle du programme ci-dessous.


.. code-block:: python

   y=x		
   if (x<0):
     y=-x
   # y contient abs(x)
   z=0
   
Une première solution pour traduire ces trois lignes de python est de les traduire le plus litéralement possible.

.. _table-abs1-imem:

.. table:: Calcul de la valeur absolue en minuscule assembleur

   ======= ===========
   adresse instruction
   ------- -----------   
   41      @22  // x      
   42      D=M
   43      @23  // y
   44      DM=D
   45      @49
   46      D;JLT
   47      @51
   48      0;JMP
   49      @23
   50      M=-D
   51      @24  // z
   51      M=0
   ======= ===========

Vous pouvez télécharger cet exemple depuis :download:`asm/ex11a.asm`.   

Il est intéressant d'analyser l'exécution du programme du :numref:`table-inc-imem` pas à pas. Les instructions aux adresses ``41`` et ``42`` placent la valeur de la variable ``x`` dans le registre `D`. Les deux instructions suivantes sauvent le contenu de ce registre dans la variable ``y``. L'instruction à l'adresse ``45`` charge l'adresse ``49`` dans le registre `A`. Cette adresse est celle de la première instruction correspondant au corps du ``if``. L'instruction suivante va elle comparer le contenu du registre `D` avec `0`. Si le registre `D` est strictement négatif, alors l'adresse se trouvant dans le registre `A`, c'est-à-dire ``49`` est placée dans le compteur de programme. Dans ce cas, le programme exécutera le corps de l'instruction conditionelle. Si par contre le contenu du registre `D` est positif ou nul, nous ne devons pas exécuter le corps de la boucle, mais directement passer à l'instruction qui initialise la variable `z` à partir de l'adresse ``51``.  Ces le rôle de l'instruction de saut inconditionnel aux adresses ``47`` et ``48``. L'instruction à l'adresse ``49`` est celle du corps de l'instruction conditionnelle. A la fin de son exécution on peut exécuter l'instruction qui suit l'instruction conditionnelle.

En y réfléchissant un peu, on peut réduire le nombre d'instructions conditionnelles dans ce programme en utilisant une instruction ``JGE`` (:numref:`table-abs-imem`). 
   
.. _table-abs-imem:

.. table:: Calcul de la valeur absolue en minuscule assembleur

   ======= ===========
   adresse instruction
   ------- -----------   
   41      @22  // x      
   42      D=M
   43      @23  // y
   44      M=D
   45      @49
   46      D;JGE
   47      @23
   48      M=-D
   49      ...
   ======= ===========

Vous pouvez télécharger cet exemple depuis :download:`asm/ex11.asm`.   
   
Il est intéressant d'analyser l'exécution du programme du :numref:`table-inc-imem` pas à pas. Les instructions aux adresses ``41`` et ``42`` placent la valeur de la variable ``x`` dans le registre `D`. Les deux instructions suivantes sauvent le contenu de ce registre dans la variable ``y``. L'instruction à l'adresse ``45`` charge l'adresse ``49`` dans le registre `A`. L'instruction suivante va elle comparer le contenu du registre `D` avec `0`. Si le registre `D` est positif ou nul, alors l'adresse se trouvant dans le registre `A`, c'est-à-dire ``49`` est placée dans le compteur de programme. Sinon, les instructions aux adresses ``47`` et ``48`` sont exécutées. Par rapport au code python, on remarque que l'on prend comme condition pour l'instruction assembleur l'inverse de la condition du code python. En effet, la condition de l'instruction conditionnelle en python doit être vérifiée pour que l'instruction ``y=-x`` soit exécutée. En assembleur, on place la cible du saut après l'exécution des instruction qui se trouvent dans le corps du ``if`` en python. Analysons une seconde variante du calcul de la valeur absolue. 


.. code-block:: python
	
   if (x>0):
     y=x
   else:
     y=-x
   # y contient abs(x)


Une première approche pour traduire ce code python en minuscule assembleur serait de procéder comme dans la :numref:`table-abs2-imem`.
   
.. _table-abs2-imem:

.. table:: Essai de calcul de la valeur absolue en minuscule assembleur

   ======= ===========
   adresse instruction
   ------- -----------   
   41      @22  // x      
   42      D=M
   43      @47
   44      D;JLE
   45      @23  // y
   46      M=D
   47      @23  // y
   48      M=-D
   49      ...
   ======= ===========

Vous pouvez télécharger cet exemple depuis :download:`asm/ex12.asm`.   
   
Malheureusement, cette solution est incorrecte car elle place toujours la valeur de la variable ``-x`` dans la variable ``y`` quel que soit son signe. Lorsque ``x`` est négatif, l'exécution passe directement à l'instruction se trouvant à l'adresse ``47`` et sauve la valeur de ``-x`` dans la variable ``y``. Cependant, si ``x`` est positif, après avoir copié ``x`` dans la variable ``y`` (instructions aux adresses ``45`` et ``46``), le minuscule processeur exécute les instructions aux adresses ``47`` et ``48`` et sauve donc la valeur de ``-x`` dans la variable ``y``. On peut éviter ce problème en utilisant un saut inconditionnel après le corps du ``if ...`` (:numref:`table-abs3-imem`).


.. _table-abs3-imem:

.. table:: Calcul de la valeur absolue en minuscule assembleur

   ======= ===========
   adresse instruction
   ------- -----------   
   41      @22  // x      
   42      D=M
   43      @47
   44      D;JLE
   45      @23  // y
   46      M=D
   47      @51
   48      0;JMP
   49      @23  // y
   50      M=-D
   51      ...
   ======= ===========

Vous pouvez télécharger cet exemple depuis :download:`asm/ex12b.asm`.   
   
Dans l'exemple de la :numref:`table-abs3-imem`, le saut inconditionnel des instructions aux adresses ``47`` et ``48`` garantit que les instructions des adresses ``49`` et ``50`` ne seront pas exécutées lorsque ``x`` est positif.   
   
Un approche similaire peut être utilisée pour implémenter d'autres instructions conditionnelles. Le tout est de ramener toute condition à une comparaison avec la valeur `0` ou à une comparaison de signe. Ainsi, pour comparer si deux variables contiennent la même valeur, il suffira de calculer une soustraction et ensuite de vérifier si le résultat est nul. Il en va de même pour vérifier si deux variables contiennent des valeurs différentes.

Pour les conditions plus complexes, il faut parfois réécrire l'instruction conditionnelle. Prenons deux exemples en python pour illustrer cette réécriture.


.. code-block:: python

   if (a>0) AND (b<1):
      x=2


Dans ce cas, on peut réécrire l'instruction conditionnelle sous la forme :

 .. code-block:: python

   if (a>0) :
     if (b<1) :
       x=2

Ces deux instructions conditionnelles imbriquées peuvent facilement s'implémenter avec les instructions de saut conditionnel que nous avons présenté. Il en va de même pour une disjonction logique. L'instruction ci-dessous :

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

A nouveau, les deux instructions conditionnelles ci-dessous peuvent facilement s'implémenter avec les instructions conditionnelles de notre minuscule langage d'assemblage.
	 
	 
Lorsque l'on utilise le langage d'assemblage, il peut être fastidieux de devoir indiquer les valeurs numériques des adresses des variables ainsi que des adresses des sauts. Heureusement, l'assembleur du minuscule processeur vous permet d'utiliser des symboles qui correspondent à ces adresses. Avec ces symboles, notre exemple du calcul de la valeur absolue (:numref:`table-abs3-imem`) peut s'écrire comme suit :


.. code-block:: console


   // valeur absolue
      @x    // variable, adresse choisie par l'assembleur    
      D=M
      @SUITE // adresse calculée par l'assembleur
      D;JLE
      @y    // variable, adresse choisie par l'assembleur    
      M=D
      @SUITE
      0;JMP
      @y
      M=-D
   (SUITE)
   //  ...		


Vous pouvez télécharger cet exemple depuis :download:`asm/ex13.asm`.   
   
Dans ce code, l'assembleur construit automatiquement la table des symboles permettant de sauver les variables ``x`` et ``y``. Il détermine aussi l'adresse en mémoire de l'instruction qui correspond à l'étiquette ``(SUITE)`` et remplace cette étiquette par l'adresse correspondante dans le code. Cela simplifie l'écriture de programmes en minuscule assembleur. 

   

Exercices
_________

1. Convertissez en minuscule assembleur l'instruction conditionnelle suivante :

   .. code-block:: python

      if(x!=y):
        a=x+y
      else:
        a=x-y

2. Convertissez en minuscule assembleur le code python ci-dessous :

   .. code-block:: python

      if(x>a) and (x<b) :
        i=1
      else:
        i=0

	
3. Convertissez en minuscule assembleur le code python ci-dessous :

   .. code-block:: python

      if(x==a) or (x>b) :
        y=a
      else:
        y=-1

	

Les boucles
-----------

Après les opérations arithmétiques et logiques et les instructions conditionnelles, il nous reste à voir comment supporter les boucles. Python supporte deux types principaux de boucles :

 - les boucles ``while``
 - les boucles ``for``


Les boucles ``while`` sont les boucles les plus générales. Un boucle ``for`` est généralement une boucle d'un type particulier qui est écrite de façon compacte. Nous nous focaliserons sur les boucles ``while`` dans cette section. Une boucle ``while`` comprend toujours une condition qui est une expression booléenne et un corps comprenant une ou plusieurs instructions à exécuter. Nous avons déjà vu que la boucle infinie

.. code-block:: python

   while True:
     x=x+1

pouvait être traduite dans notre minuscule assembleur par les instructions reprises en :numref:`table-inc-imembis`.

.. _table-inc-imembis:

.. table:: Une boucle infinie

   ======= ===========
   adresse instruction
   ------- -----------   
   71      @22    
   72      M=M+1
   73      @71
   74      0;JMP
   ======= ===========

Vous pouvez télécharger cet exemple depuis :download:`asm/ex14.asm`.   
      
Nous pouvons nous inspirer de cette approche pour traduire une boucle ``while`` en une séquence d'instructions en minuscule assembleur. Pour cela, notre programme doit :

 1. Évaluer la valeur de la condition
 2. Si la condition s'évalue à True, exécuter le corps de la boucle puis revenir au point 1
 3. Sinon, passer à l'exécution des instructions placées juste après le corps de la boucle

    
Pour illustrer cette traduction, considérons la boucle ci-dessous. Après l'exécution de cette boucle, la variable ``x`` contient la valeur `512`.


.. code-block:: python

   x=1
   n=1
   while (n<10) :
     x=x+x
     n=n+1


Le code assembleur correspondant est présenté ci-dessous. L'étiquette ``(DEBUT)`` correspond à la première instruction. Nous initialisons ensuite les variables ``x`` et ``n`` à la valeur `1` dans les deux mots de mémoire que l'assembleur leur a réservé. L'étiquette ``(DBOUCLE)`` correspond à l'adresse de la première instruction de notre boucle. Les quatre instructions qui suivent placent dans le registre ``D`` le résultat de :math:`n-10`. Cela nous permet ensuite de comparer cette valeur avec `0`. Si :math:`n-10 \ge 0`, alors la condition de notre boucle n'est pas vérifiée et nous devons en sortir. C'est le rôle de l'instruction ``JGE`` qui placera l'adresse de l'étiquette ``(FBOUCLE)`` dans le compteur de programme. Sinon, les six instructions suivantes permettent de placer ``x+x`` dans la variable ``x`` et ensuite d'incrémenter la variable ``n``. Les deux dernières instructions permettent de revenir à l'adresse de l'étiquette ``(DBOUCLE)`` pour faire l'itération suivante dans la boucle.


.. code-block:: console

   (DEBUT)		
          @x
          M=1
          @n
          M=1
   (DBOUCLE)
	  @10
	  D=A
	  @n
	  D=M-D
	  @FBOUCLE
	  D;JGE 
	  @x
	  D=M
	  @x
	  D=D+M
	  @n
	  M=M+1
	  @DBOUCLE
	  0;JMP
   (FBOUCLE)
     
Le programme en minuscule assembleur est téléchargeable via :download:`asm/boucle.asm`.

Exercices
_________

1. Écrivez un programme en assembleur pour calculer la somme des `n` premiers naturels.

   .. todo exercice inginious

      
2. Le reste de la division euclidienne entre deux naturels ``a % b`` peut s'obtenir en faisant une série de soustractions. En python, cela peut s'écrire comme suit

   .. code-block:: python

      # place dans r le reste de la division euclidienne a/b
      r=a
      while(r>=b):
         r=r-b
    
  Convertissez ce programme python en une suite d'instructions en minuscule assembleur.


Python, comme d'autres langages de programmation, support les mode clés ``break`` et ``continue`` qui peuvent être utilisé à l'intérieur de boucles. Prenons comme exemple la boucle ci-dessous.



   .. code-block:: python


      x=9
      while(x<a):
         x=x+b
	 if(x>c):
	   x=c
	   break


Ce fragment de code en python peut être traduit en minuscule assembleur par les instructions ci-dessous (téléchargeable via :download:`asm/boucle-break.asm`). La traduction en assembleur de ce fragment de code  montre que l'instruction ``break`` est traduite comme un saut inconditionnel qui permet de sortir de la boucle.


.. literalinclude:: asm/boucle-break.asm
   :language: console
   :start-after: (START)

		 

Python supporte aussi l'instruction ``continue`` qui permet de continuer l'exécution de la boucle sans exécuter les instructions se trouvant après cette instruction. La code ci-dessous est un exemple de l'utilisation de ``continue`` en python. 


   .. code-block:: python


      x=7
      while(x<a):
	 if(x<c):
           x=x+1		   
	   continue
         x=x+b

A nouveau, la traduction de ce code en minuscule assembleur fait appel à un saut inconditionnel pour supporter l'instruction ``continue``, mais cette fois-ci vers l'étiquette ``(DBOUCLE)`` qui correspond au début de la boucle.

	 
.. literalinclude:: asm/boucle-continue.asm
   :language: console
   :start-after: (START)      

Ce programme en minuscule assembleur est téléchargeable via :download:`asm/boucle-continue.asm`.
		 
