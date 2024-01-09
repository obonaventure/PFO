.. include:: defs.rst




Représentation de l'information
===============================	     


Le fonctionnement des ordinateurs s'appuie sur quelques principes très simples, mais qui sont utilisés à une très grande échelle. Le premier principe est que toute l'information peut s'encoder sous une forme binaire, c'est-à-dire une suite de bits. Un :index:`bit` est l'unité de représentation de l'information. Un bit peut prendre deux valeurs:

 - ``0``
 - ``1``

On peut associer une signification à ces bits. Il est par exemple courant de considérer que le bit ``0`` représente la valeur `Faux` tandis que le bit ``1`` représente la valeur `Vrai`. C'est une convention qui est utile dans certains cas, mais n'est pas toujours nécessaire et peut parfois porter à confusion. 

Dans un ordinateur, toutes les informations peuvent être stockées sous la forme d'une séquence de bits. La longueur de la séquence est fonction de la quantité d'information à stocker. Notre premier exemple concerne les caractères. Il est important de pouvoir représenter les différents caractères des langues écrites de façon compacte et non-ambiguë pour pouvoir stocker et manipuler du texte sur un ordinateur. Le principe est très simple. Il suffit de construire une table qui met en correspondance une séquence de bits et le caractère qu'elle représente. 


Représentation des caractères
-----------------------------

Pour représenter chaque caractère sous la forme d'une séquence de bits, il suffit de choisir une séquence unique qui représente un caractère. Commençons par essayer de représenter les dix chiffres de notre numérotation décimale, de ``0`` à ``9``. Nous pouvons facilement associer une séquence binaire unique à chacun de ces chiffres. Avec deux bits, nous pouvons construire quatre séquences différentes: ``00``, ``01``, ``10`` et ``11``. Avec ces deux bits, nous ne pouvons pas obtenir une séquence unique pour chaque chiffre décimale. Avec trois bits, nous pouvons construire 8 séquences différentes: ``000``, ``001``, ``010``, ``011``, ``100``, ``101``, ``110`` et ``111``. Pour représenter tous les chiffres décimaux, nous avons besoin d'utiliser des séquences d'au moins 4 bits. La table ci-dessous présente une première représentation possible des chiffres décimaux.

------- ----------------
Chiffre Séquence binaire
0       ``0000``
1       ``0001``
2		``0010``
3 		``0011``
4		``0100``
5		``0101``
6		``0110``
7		``0111``
8		``1000``
9		``1001``
------- ----------------

En utilisant cette représentation, on peut représenter n'importe quel nombre naturel comme une séquence de bits. Il suffit pour cela de représenter chaque chiffre par un bloc de quatre bits. Ainsi, le nombre `478` en notation décimale pourra être représenté par la séquence de bits ``0100 0111 1000``.

Pour représenter les lettres de l'aphabet en plus des chiffres, il nous faut utiliser plus de bits. On peut facilement voir qu'avec :math:`n` bits on peut construire :math:`2^n` séquences distinctes. Avec 4 bits, on peut donc obtenir 16 séquences distinctes. Il faut 5 bits pour avoir 32 séquences distinctes, 6 bits pour en construire 64, ... Notre alphabet latin comprend 26 lettres. Si on veut pouvoir représenter les lettres majuscules et les chiffres sous forme binaire, nous utiliser au minimum 6 bits. Avec ces six bits, on peut représenter les 26 lettres majuscules, les 26 lettres minucules et les 10 chiffres. Il ne nous reste ensuite plus que 2 séquences de bits pour représenter tous les autres caractères comme la ponctuation, les symbôles mathématiques, ...

Parmi les tables d'encodage des caractères les plus simples, la plus connue est certainement la table US-ASCII dont la définition est notamment reprise dans :rfc:`20`. Cette table associe une séquence de 7 bits (`b7` à `b1`) à un caractère particulier. Pour des raisons historiques, certains de ces caractères sont des caractères dits "de contrôle" qui ne sont pas imprimables. Ils permettaient de contrôler le fonctionnement de terminaux ou d'imprimantes. Par exemple, les caractères `CR` et/ou `LF` correspondent au retour de charriot et au passage à la ligne sur un écran ou une imprimante.  



   .. code-block:: console 
      :name: table-ascii 
      :caption: Table des caractères ASCII 
                
      |----------------------------------------------------------------------|
        B  \ b7 ------------>| 0   | 0   | 0   | 0   | 1   | 1   | 1   | 1   |
         I  \  b6 ---------->| 0   | 0   | 1   | 1   | 0   | 0   | 1   | 1   |
          T  \   b5 -------->| 0   | 1   | 0   | 1   | 0   | 1   | 0   | 1   |
           S                 |-----------------------------------------------|
                     COLUMN->| 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   |
      |b4 |b3 |b2 |b1 | ROW  |     |     |     |     |     |     |     |     |
      +----------------------+-----------------------------------------------+
      | 0 | 0 | 0 | 0 | 0    | NUL | DLE | SP  | 0   | @   | P   |   ` |   p |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 0 | 0 | 0 | 1 | 1    | SOH | DC1 | !   | 1   | A   | Q   |   a |   q |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 0 | 0 | 1 | 0 | 2    | STX | DC2 | "   | 2   | B   | R   |   b |   r |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 0 | 0 | 1 | 1 | 3    | ETX | DC3 | #   | 3   | C   | S   |   c |   s |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 0 | 1 | 0 | 0 | 4    | EOT | DC4 | $   | 4   | D   | T   |  d  |   t |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 0 | 1 | 0 | 1 | 5    | ENQ | NAK | %   | 5   | E   | U   |  e  |   u |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 0 | 1 | 1 | 0 | 6    | ACK | SYN | &   | 6   | F   | V   |  f  |   v |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 0 | 1 | 1 | 1 | 7    | BEL | ETB | '   | 7   | G   | W   |  g  |   w |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 1 | 0 | 0 | 0 | 8    | BS  | CAN | (   | 8   | H   | X   |  h  |   x |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 1 | 0 | 0 | 1 | 9    | HT  | EM  | )   | 9   | I   | Y   |  i  |   y |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 1 | 0 | 1 | 0 | 10   | LF  | SUB | *   | :   | J   | Z   |  j  |   z |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 1 | 0 | 1 | 1 | 11   | VT  | ESC | +   |  ;  | K   | [   |  k  |   { |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 1 | 1 | 0 | 0 | 12   | FF  | FS  | ,   | <   | L   | \   |  l  |   | |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 1 | 1 | 0 | 1 | 13   | CR  | GS  | -   | =   | M   | ]   |  m  |   } |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 1 | 1 | 1 | 0 | 14   | SO  | RS  | .   | >   | N   | ^   |  n  |   ~ |
      |---|---|---|---|------|-----|-----|-----|-----|-----|-----|-----|-----|
      | 1 | 1 | 1 | 1 | 15   | SI  | US  | /   | ?   | O   | _   |  o  | DEL |
      +----------------------+-----------------------------------------------+

   
   
La table US-ASCII (:numref:`table-ascii`) définit les représentations binaires suivantes: 

 - `01100000` correspond au caractère représentant le chiffre `0`
 - `01101001` correspond au caractère représentant le chiffre `9`
 - `10000011` correspond au caractère représentant la lettre `A` (majuscule)  
 - `01000000` correspond au caractère représentant un espace 

.. spelling:word-list::

   Klingon
   
Cette table avait l'inconvénient majeur de ne contenir que les représentations des caractères non-accentués de l'alphabet latin. Elle permet d'écrire du texte en anglais et dans d'autres langues européennes qui utilisent peu d'accents, mais ne permet évidemment pas de représenter tous les caractères des langues écrites sur notre planète. Au fil des années, ce problème a été résolu avec d'autres tables de correspondance dont celles qui sont adaptées aux accents utilisés par les langues européennes. Aujourd'hui, l'encodage standard des caractères se fait en utilisant le format `Unicode <https://home.unicode.org>`_. Une description détaillée d'Unicode sort du cadre de ce cours d'introduction, mais sachez qu'en mars 2020, la version 13.0 d'Unicode permettait de représenter 143859 caractères différents correspondant à 154 formes d'écritures. Unicode permet de représenter quasiment toutes les langues écrites connues sur notre planète. Des chercheurs ont même proposé un format Unicode permettant de supporter le Klingon, c'est-à-dire la langue écrite inventée pour la série de films Star Trek. 

.. ajouter un graphique avec des statistiques issues de https://en.wikipedia.org/wiki/Unicode pour montrer l'évolution dans le temps 

Avoir une représentation binaire pour les caractères permet de les stocker en mémoire, sur disque ou de les transmettre à travers un réseau. C'est important, mais il faut aussi pouvoir permettre à un humain de lire des textes produits par un ordinateur, que ce soit sur papier ou écran. Il existe de très nombreuses solutions qui permettent d'afficher ou d'imprimer des caractères. Dans ce cours d'introduction, nous nous contentons d'une solution très simple qui fonctionne en noir et blanc. Nous pourrons ajouter les couleurs lorsque nous aurons vu comment représenter des nombres dans le chapitre suivant. 

Un écran et une imprimante permettent d'afficher des points à n'importe quelle position. On peut aisément se représenter un écran comme un rectangle composé de pixels. Chacun des points de cet écran est identifié par une abscisse et une ordonnée qui sont toutes les deux entières. Ainsi, un écran 1024x768 peut afficher 1024 points selon l'axe des x et 768 points selon l'axe des y. 

Sur un tel écran, on peut facilement afficher des caractères. Il suffit d'avoir pour chaque caractère une table qui contient la représentation graphique de chacun des caractère à afficher sous la forme de pixels. A titre d'exemple, supposons que l'on veut afficher chaque caractère dans un carré de 8x8 pixels. Dans ce cas, on peut stocker la représentation graphique d'un caractère en noir en blanc sous la forme d'une suite de 8 bytes. Par exemple, les huit octets ci-dessous contiennent une représentation graphique du caractère `1`. 

.. code-block:: console 

   00001000 
   00011000 
   00101000 
   00001000 
   00001000 
   00001000 
   00001000 
   00111110 



.. source: https://tex.stackexchange.com/questions/157080/can-tikz-create-pixel-art-images/279697 

Une représentation graphique, fortement agrandie, de ce caractère est présentée dans la :numref:`fig-pixel-1`. 


.. _fig-pixel-1: 
.. tikz:: Un caractère sous la forme de pixels 
	  
   \def\pixels{
   {0,0,0,0,1,0,0,0}, 
   {0,0,0,1,1,0,0,0}, 
   {0,0,1,0,1,0,0,0}, 
   {0,0,0,0,1,0,0,0}, 
   {0,0,0,0,1,0,0,0}, 
   {0,0,0,0,1,0,0,0}, 
   {0,0,0,0,1,0,0,0}, 
   {0,0,1,1,1,1,1,0},%
   }
   \definecolor{pixel 1}{HTML}{000000}
   \definecolor{pixel 0}{HTML}{FFFFFF}
   \foreach \line [count=\y] in \pixels {
   \foreach \pix [count=\x] in \line {
   \draw[fill=pixel \pix] (\x,-\y) rectangle +(1,1); 
   }
   }

	  
	  
.. présenter l'écran ou l'imprimante bitmap et pixel, uniquement en noir et blanc 

.. parler de couleurs primaire et rgb, cela nécessite des nombres également 

.. Pour le son, ce serait plus facile avec des nombres 

Représentation des nombres naturels
-----------------------------------

Les ordinateurs ont d'abord étés conçus pour réaliser des opérations mathématiques. Il est important de pouvoir représenter des nombres dans tout ordinateur.  Commençons par analyser comment représenter les nombres pour effectuer des opérations arithmétiques. Pour simplifier la présentation, nous travaillerons surtout avec des quartets dans ce chapitre. Il y a seize quartets différents : 

 - `0000`
 - `0001`
 - `0010`
 - `0011`
 - `0100`
 - `0101`
 - `0110`
 - `0111`
 - `1000`
 - `1001`
 - `1010`
 - `1011`
 - `1100`
 - `1101`
 - `1110`
 - `1111`    

Un tel :index:`quartet`, peut se représenter de façon symbolique: :math:`B_{3}B_{2}B_{1}B_{0}` où les symboles :math:`B_{i}` peuvent prendre les valeurs `0` ou `1`. Dans un tel quartet, le symbole :math:`B_{3}` est appelé le :index:`bit de poids fort` tandis que le symbole :math:`B_{0}` est appelé le :index:`bit de poids faible`.

Cette représentation des quartets est similaire à la représentation que l'on utilise pour les nombres décimaux. Un nombre en représentation décimale peut aussi s'écrire :math:`C_{n-1}C_{n-2}...C_{2}C_{1}C_{0}`. Dans cette représentation, les :math:`C_{i}` sont les chiffres de `0` à `9`. :math:`C_{0}` est le chiffre des unités, :math:`C_{1}` le chiffre correspondant aux dizaines, :math:`C_{2}` celui qui correspond aux centaines, ... Numériquement, on peut écrire que la représentation décimale :math:`C_{3}C_{2}C_{1}C_{0}` correspond au nombre :math:`C_{3}*1000 + C_{2}*100 + C_{1}*10 + C_{0}` ou encore :math:`C_{3}*10^{3} + C_{2}*10^{2} + C_{1}*10^{1} + C_{0}*10^{0}` en se rappelant que :math:`10^{0}` vaut 1.

En toute généralité, la suite de chiffres décimaux :math:`C_{n-1}C_{n-2}...C_{2}C_{1}C_{0}` correspond au naturel :math:`\sum_{i=0}^{i=n-1} C_{i} \times 10^{i}`.

A titre d'exemple, le nombre sept cent trente six s'écrit en notation décimale `736`, ce qui équivaut bien à :math:`7*10^{2}+3*10^{1}+6*10^{0}`. 

Pour représenter les nombres naturels en notation binaire, nous allons utiliser le même principe. Un nombre en notation binaire :math:`B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}` représente le nombre naturel :math:`B_{n-1}*2^{n-1} + B_{n-2}*2^{n-2} + ... + B_{2}*2^{2} + B_{1}*2^{1} + B_{0}*2^{0}`. En appliquant cette règle aux quartets, on obtient aisément :

 - `0000` correspond au nombre :math:`0*2^{3}+0*2^{2}+0*2^{1}+0*2^{0}`, soit `0` en notation décimale 
 - `0001` correspond au nombre :math:`0*2^{3}+0*2^{2}+0*2^{1}+1*2^{0}`, soit `1` en notation décimale 
 - `0010` correspond au nombre :math:`0*2^{3}+0*2^{2}+1*2^{1}+0*2^{0}`, soit `2` en notation décimale 
 - `0011` correspond au nombre :math:`0*2^{3}+0*2^{2}+1*2^{1}+1*2^{0}`, soit `3` en notation décimale 
 - `0100` correspond au nombre :math:`0*2^{3}+1*2^{2}+0*2^{1}+0*2^{0}`, soit `4` en notation décimale 
 - `0101` correspond au nombre :math:`0*2^{3}+1*2^{2}+0*2^{1}+1*2^{0}`, soit `5` en notation décimale 
 - `0110` correspond au nombre :math:`0*2^{3}+1*2^{2}+1*2^{1}+0*2^{0}`, soit `6` en notation décimale 
 - `0111` correspond au nombre :math:`0*2^{3}+1*2^{2}+1*2^{1}+1*2^{0}`, soit `7` en notation décimale 
 - `1000` correspond au nombre :math:`1*2^{3}+0*2^{2}+0*2^{1}+0*2^{0}`, soit `8` en notation décimale 
 - `1001` correspond au nombre :math:`1*2^{3}+0*2^{2}+0*2^{1}+1*2^{0}`, soit `9` en notation décimale 
 - `1010` correspond au nombre :math:`1*2^{3}+0*2^{2}+1*2^{1}+0*2^{0}`, soit `10` en notation décimale 
 - `1011` correspond au nombre :math:`1*2^{3}+0*2^{2}+1*2^{1}+1*2^{0}`, soit `11` en notation décimale 
 - `1100` correspond au nombre :math:`1*2^{3}+1*2^{2}+0*2^{1}+0*2^{0}`, soit `12` en notation décimale 
 - `1101` correspond au nombre :math:`1*2^{3}+1*2^{2}+0*2^{1}+1*2^{0}`, soit `13` en notation décimale 
 - `1110` correspond au nombre :math:`1*2^{3}+1*2^{2}+1*2^{1}+0*2^{0}`, soit `14` en notation décimale 
 - `1111` correspond au nombre :math:`1*2^{3}+1*2^{2}+1*2^{1}+1*2^{0}`, soit `15` en notation décimale 

En toute généralité, la suite de bits :math:`B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}` correspond au naturel :math:`\sum_{i=0}^{i=n-1} B_{i} \times 2^{i}`.
   
Cette technique peut s'appliquer à des nombres binaires contenant un nombre quelconque de bits. Pour convertir efficacement un nombre binaire en son équivalent décimal, il est intéressant de connaître les principales puissances de 2:

 - :math:`2^{0}=1`
 - :math:`2^{1}=2`
 - :math:`2^{2}=4`
 - :math:`2^{3}=8`
 - :math:`2^{4}=16`
 - :math:`2^{5}=32`
 - :math:`2^{6}=64`
 - :math:`2^{7}=128`
 - :math:`2^{8}=256`
 - :math:`2^{9}=512`
 - :math:`2^{10}=1024`
 - :math:`2^{16}=65536`
 - :math:`2^{20}=1048576` ou un peu plus d'un million
 - :math:`2^{30}=1073741824` ou un peu plus d'un milliard
 - :math:`2^{32}=4294967296` ou un peu plus de 4 milliards

Cette représentation des nombres peut se généraliser. La notation binaire utilise des puissances de `2` tandis que la notation décimale des puissances de `10`.  On peut faire de même avec d'autres puissances. Ainsi, la suite de symboles :math:`S_{n-1}S_{n-2}...S_{2}S_{1}S_{0}` en base `k` où les symboles :math:`S_{i}` ont une valeur comprises entre `0` et :math:`k-1`, correspond au naturel :math:`\sum_{i=0}^{i=n-1}S_{i} \times k^{i}`.

En pratique, outre les notations binaires, deux notations sont couramment utilisées :

 - l'octal (ou base `8`)
 - l'hexadécimal (ou base `16`)

En octal, les symboles sont des chiffres de `0` à `7`. En hexadécimal, les symboles sont des chiffres de `0` à `9` et les lettres de `A` à `F` sont utilisées pour représenter les valeurs de `0` à 15.


On peut facilement convertir une séquence de bits en sa représentation octale ou hexadécimale. Il suffit pour cela de découper la séquence en blocs de 3 bits pour la représentation octale et en blocs de quatre bits pour la représentation hexadécimale. A titre d'exemple, la séquence  de douze bits ``001010011101`` peut être convertie comme suit:

 - en notation octale, il suffit de la découper en 4 blocs de trois bits chacun, ``001 010 011 101``. Chacun de ces blocs peut ensuite être converti en notation octale, ``001`` correspond à ``1``, ``010`` à ``2``, ``011`` à ``3`` et ``101`` à ``5``. La séquence complète correspond donc à ``1235``.
 
 - en notation hexadécimale, il suffit de la découper en trois blocs de quatre bits chacun, ``0010 1001 1101``. Le premier quartet correspond à ``2``, le deuxième à ``9`` et le troisième à ``D``. Le séquence complète correspond donc à ``29D``.


.. note::

   Il est parfois intéressant d'entrer un nombre en binaire, octal ou hexadécimal dans un langage de programmation. En python3, cela se fait en préfixant le nombre avec `0b` pour du binaire, `0o` pour de l'octal et `0x` pour de l'hexadécimal. Ainsi, les lignes ci-dessous stockent toutes la valeur `23` dans la variable ``n``.

   .. code-block:: python

      n = 23  # décimal
      n = 0b10111  # binaire
      n = 0o27 # octal
      n = 0x17

   La notation adoptée dans python3 est bien plus claire que celle utilisée dans d'anciennes versions de python et des langages de programmation comme le `C`. Dans ces langages, il suffit de commencer un nombre par le chiffre zéro pour indiquer qu'il est en octal. C'était une source de très nombreuses confusions.

   .. code-block:: python

      # En python2, ces deux lignes ne sont pas équivalentes
      n = 23  # décimal
      n = 023 # octal -> valeur décimale 19

   
   
Langage d'assemblage 
====================

.. spelling:word-list::

   Von
   Neumann
   John




Nous pouvons commencer à programmer un micro-processeur qui est capable d'exécuter de petits programmes. Ce micro-processeur répond à ce que l'on appelle l':index:`architecture de Von Neumann`. 

Cette architecture est composée d'un :index:`processeur` (:index:`CPU` en anglais) ou unité de calcul et d'une mémoire. Le processeur est un circuit électronique qui est capable d'effectuer de nombreuses tâches : 

 - lire de l'information en mémoire 
 - écrire de l'information en mémoire 
 - réaliser des calculs 

L'architecture des ordinateurs est basée sur l'architecture dite de Von Neumann. Suivant cette architecture, un ordinateur est composé d'un processeur qui exécute un programme se trouvant en mémoire. Ce programme manipule des données qui sont aussi stockées en mémoire. 

.. expliquer von neuman 


Dans un ordinateur, toutes les données et les programmes sont représentés sous la forme de séquences de bits. Pour exécuter un programme, le microprocesseur doit charger les séquences de bits qui correspondent aux instructions depuis la mémoire ainsi que les données qui y sont associées. Le programme est découpé en de très nombreuses instructions très simples, beaucoup plus simples que celles que l'on trouve dans un langage de programmation comme python. Chaque microprocesseur est caractérisé par l'ensemble des instructions qu'il peut exécuter. Les premiers microprocesseurs supportaient quelques dizaines d'instructions différentes. Les processeurs récents en supportent beaucoup plus. 

Même si dans l'ordinateur chaque instruction à exécuter est représentée sous la forme d'une séquence de bits, ces séquences sont peu pratiques pour les informaticiens et informaticiennes qui doivent les utiliser pour écrire des programmes. Pour écrire de tels programmes, il est préférable de passer par le :index:`langage d'assemblage`. Un langage d'assemblage est la liste de toutes les instructions simples qui sont supportées par un microprocesseur donné. Chaque microprocesseur dispose de son langage d'assemblage. 

Dans ce syllabus, nous nous concentrons sur un langage d'assemblage simple qui ne correspond pas à un ordinateur réel, mais contient les instructions que l'on retrouve dans la plupart des langages d'assemblage. Son avantage principal est qu'il est très facile d'exécuter des programmes écrits dans ce langage en utilisant le simulateur disponible en ligne. Ce simulateur est utilisable depuis n'importe quel navigateur web.


.. todo:: brève description du simulateur et de son fonctionnement


Un assembleur simple
--------------------

Tout langage d'assemblage dépend des caractéristiques matérielles du microprocesseur qui supporte ses instructions. Notre processeur contient quatre registres que vous pouvez utiliser
pour stocker des données. Ils sont identifiés par les lettres ``A``,
``B``, ``C`` et ``D``. Chacun de ces registres peut stocker un bloc de
16 bits de données. Comme dans tout stockage binaire de l'information,
c'est au programmeur de décider ce que représente un bloc de bits. Il
peut s'agir d'un caractère, d'un nombre ou de tout autre type
d'information.

.. todo:: figure du processeur




Notre ordinateur comprend aussi une mémoire :index:`RAM` (ou index:`Random Access Memory`) qui permet de stocker des données et des instructions. Toutes les informations stockées dans la RAM sont sous forme binaire. Tout comme pour les registres, c'est au programmeur de décider si une information se trouvant en mémoire représente un caractère, un nombre ou une instruction.

.. todo:: expliquer mémoire RAM avec un exemple, voir dans l'ancien syllabus le texte qui existait


Notre processeur simple supporte quelques dizaines d'instructions que
nous allons découvrir petit à petit. La première instruction est
baptisée :index:`MOV`. L'instruction ``MOV`` prend deux arguments:

 - une destination 
 - une source

La syntaxe de base de cette instruction est :
``MOV dest, src``. La destination est un identifiant de registre (``A``,
``B``, ``C`` ou ``D``) et la source peut être un identifiant de
registre ou une constante. Cette constante peut être spécifiée en
notation binaire, décimale, octale ou hexadécimale. Lorsque l'on
spécifie une constante, c'est généralement la notation décimale qui
est utilisée, mais parfois il est intéressant d'utiliser une des
autres notations, notamment lorsque l'on veut spécifier une séquence de bits spécifique.

L'instruction ``MOV`` permet de placer un bloc de 16 bits dans
un registre ou de déplacer un bloc de 16 bits d'un registre à l'autre.

Dans l'assembleur que nous utilisons, chaque instruction est
représenté par un mot clé en majuscules suivi de ses arguments sur une
ligne. Le caractère ``;`` est utilisé pour marquer le début d'un
commentaire. Une ligne qui débute par le point virgule n'est donc
pas considérée comme une instruction. 
Il en va de même pour tous les caractères qui
suivent le point virgule sur une ligne quelconque.

Nous pouvons maintenant exécuter notre première séquence d'instructions.
Notre microprocesseur va d'abord exécuter la première instruction. Il exécutera
ensuite la deuxième et enfin la troisième.

.. code-block:: nasm
   :linenos:
      
   MOV A,1       
   MOV B,2
   MOV A,B
   
Dans l'exemple ci-dessus, la première ligne place la représentation
binaire du nombre naturel ``1``, c'est-à-dire ``000000000000001``
dans le registre ``A``. La deuxième ligne contient l'instruction qui
permet de placer la représentation binaire du nombre naturel 2 dans le
registre ``B``. La troisième instruction permet elle de copier les 16
bits qui se trouvent dans le registre ``B`` (c'est-à-dire la valeur
``2``) dans le registre ``A``. Après l'exécution de ces trois instructions, 
les registres ``A`` et ``B`` contiennent tous les deux la séquence
``0000000000000010``.


L'instruction ``MOV``, et toutes les instructions de l'assembleur que
nous utilisons, permettent de spécifier leurs arguments numérique en
notation, binaire, décimale, octale et hexadécimale. Dans le cours,
nous privilégierons la notation décimale qui est la plus courante,
mais les autres notations sont parfois utiles lorsque l'on veut
stocker un blocs de 16 bits bien particulier. Les quatre instructions
ci-dessous placent toute la valeur vingt trois dans le registre ``D``.

.. code-block:: nasm
   :linenos:
      
   MOV D, 23d       ; en notation décimale       
   MOV D, 0x17      ; en notation hexadécimale
   MOV D, 0o27      ; en notation octale  
   MOV D, 10111b    ; en notation binaire


Notre processeur peut également réaliser des opérations arithmétiques
sur les données stockées dans ses registres. Les opérations
arithmétiques les plus simples sont :index:`INC` et :index:`DEC`. Elles prennent
toutes les deux comme argument un identifiant de
registre. L'instruction ``INC X`` incrémente le nombre entier stocké
dans le registre ``X`` d'une unité. L'instruction ``DEC X`` décrémente
d'une unité la valeur entière stockée dans le registre ``X``.

A titre d'exemple, considérons la séquence d'instructions suivante.


.. code-block:: nasm
   :linenos:
      
   ; première solution
   MOV A, 7  
   ; deuxième solution
   MOV B, 6  
   INC B
   ; troisième solution
   MOV C, 8  
   DEC C
   ; quatrième solution
   MOV D, 7 
   DEC D
   INC D

Après l'exécution de ces instructions, les quatre registres de notre
processeur contiennent tous la valeur entière ``7``. La première
ligne est, évidemment, la meilleure solution pour placer cette valeur
dans le registre ``A``, mais les autres aboutissent au même résultat.

Notre processeur peut aussi additionner et soustraire les valeurs
entières stockées dans des registres. L'instruction :index:`ADD` prend
deux arguments. Le premier est le registre qui est la destination du
résultat. Le second est un registre ou une constante. Cette
instruction calcule la somme entre ses deux arguments et place le
résultat dans le premier argument. L'instruction :index:`SUB` prend
également deux arguments. Elle stocke dans son premier argument
le résultat de l'opération ``arg1 - arg2``.


.. code-block:: nasm
      
   MOV A, 7  
   MOV B, 3  
   ADD A, B

La séquence d'instructions ci-dessus place dans le registre ``A`` la
somme entre la valeur stockée dans ce registre et celle se trouvant
dans le registre ``B``, c'est-à-dire la valeur ``10``.

.. code-block:: nasm
      
   MOV A, 7  
   MOV B, 3  
   SUB A, B

La séquence d'instruction ci-dessus place dans le registre ``A`` le
résultat de l'opération ``7 - 3``, c'est-à-dire la valeur ``4``.

Il est intéressant de noter que comme l'instruction ``ADD`` ne prend
que deux arguments, il n'est pas possible, en une seule instruction,
de calculer la somme entre deux registres et de la placer dans un
troisième. Cela nécessite deux instructions comme dans la séquence
ci-dessous qui place dans le registre ``C`` la somme entre les valeurs
stockées dans les registres ``A`` et ``B``.

.. code-block:: nasm
      
   MOV A, 9  
   MOV B, 12  
   ADD A, B
   MOV C, A


Il est important de noter qu'après exécution de la séquence
d'instructions ci-dessus, la valeur qui était stockée dans le registre
``A`` est perdue. Si cette valeur était importante pour la suite du
programme, alors il est préférable d'utiliser la séquence
d'instructions qui suit qui elle utilise le registre ``C`` comme 
mémoire intermédiaire.


.. code-block:: nasm
      
   MOV A, 9  
   MOV B, 12  
   MOV C, A
   ADD C, B
  
 
.. expliquer le carry et le bit zéro ou plus tard ?


Notre microprocesseur est aussi capable de réaliser des opérations
de multiplication et de division. Cependant, ces opérations, qui sont
nettement plus complexes à implémenter que les additions et soustractions,
ne peuvent que porter sur la valeur se trouvant dans le registre ``A``.
Il est donc nécessaire de d'abord placer la valeur à multiplier ou
diviser dans ce registre avant de pouvoir réaliser l'opération.

En utilisant l'instruction :index:`MUL`, il est possible de multiplier
une valeur entière stockée dans le registre ``A`` par une constante.


.. code-block:: nasm
      
   MOV A, 9  
   MUL 3


Après exécution du code ci-dessus, le registre ``A`` contient la
valeur décimale ``27``. Il est aussi possible de multiplier la
valeur entière stockée dans le registre ``A`` par la valeur se
trouvant dans un autre registre.
   
.. code-block:: nasm
      
   MOV A, 9  
   MOV B, 2
   MUL B

Après exécution des instructions ci-dessus, le registre ``A``
contient la valeur décimale ``18``. Le registre ``B`` contient
lui toujours la valeur ``2``.


L'instruction :index:`DIV` s'utilise de façon similaire. Il est
possible de diviser la valeur se trouvant dans le registre ``A``
par une constante entière.

.. code-block:: nasm
      
   MOV A, 24  
   DIV 3

Après exécution de ces instructions, le registre ``A``
contient la valeur ``8`` qui est le quotient de la division
de ``24`` par ``3``. Tout comme pour l'instruction
de multiplication, il est possible de diviser la
valeur stockée dans le registre ``A`` par une valeur
entière se trouvant dans un autre registre.

.. code-block:: nasm
      
   MOV A, 35  
   MOV B, 7
   DIV B

Après exécution de ces instructions, le registre ``A``
contient la valeur ``5``. Il est important de noter
que notre processeur calcule le quotient de la division
entière entre le dividende stocké dans le registre
``A`` et le diviseur qui peut être une constante ou
se trouver dans un autre registre. En python, la
séquence d'instructions ci-dessous permet également
de calculer le quotient de cette division entière.


.. code-block:: python


   a=35
   b=7
   a=a//b

   
Notre langage d'assemblage ne contient pas d'instruction
permettant de calculer le reste d'une division entière. Si
vous avez besoin de cette opération, vous devrez la
programmer en utilisant les autres instructions du langage. 

.. todo: Carole, faire un exercice pour calculer le reste de la division pour des naturels

Une dernière instruction qui nous sera utile par après est
l'instruction :index:`HLT`. Cette instruction permet
d'arrêter l'exécution du programme. Il faut pousser sur
le bouton `Reset` du simulateur pour redémarrer le processeur.


Interaction avec la mémoire RAM
-------------------------------

.. spelling:word-list::

   RAM
   Random
   Access
   Memory
   Read
   Only

A côté des instructions de calcul telles que celles qui
viennent d'être présentées, notre microprocesseur simple
est aussi capable d'interagir avec la mémoire. Il existe
plusieurs type de mémoires dans un ordinateur. Les deux
plus simples sont les :index:`Random Access Memory`
(:index:`RAM`) et les :index:`Read-Only Memory`
(:index:`ROM`).

Comme son nom l'indique, une mémoire :index:`ROM` est une mémoire dont le contenu ne peut qu'être lu. Le contenu de cette mémoire est écrit lors de la construction de la mémoire et ne peut jamais être modifié. Ces mémoires sont utilisées pour stocker des données ou des programmes qui ne changent jamais, comme par exemple le code qui permet de faire démarrer un ordinateur et de lancer son système d'exploitation. Une mémoire :index:`ROM` peut se représenter comme dans la :numref:`fig-rom`.


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


Une caractéristique important des mémoires de type :index:`ROM` est que
leur contenu est préservé même lorsque la mémoire est mise hors tension. 
Certaines mémoires de type :index:`ROM` sont dites programmables car il
est possible d'effacer et de modifier leur contenu. C'est le cas par
exemple des :index:`EPROM` (Electrically Programmable ROM) ou des 
:index:`EEPROM` (Electrically Erasable and Programmable ROM). La programmation d'un
tel circuit se fait en utilisant un dispositif spécialisé qui sort du cadre de ce cours. 

Une mémoire :index:`ROM` peut être vue comme un tableau permettant de
stocker des données (dans notre ordinateur des blocs de 16 bits). Chaque
élément du tableau est identifié par une :index:`adresse`. A titre d'exemple, considérons
une mémoire :index:`ROM` qui permet de stocker 4 blocs de 16 bits.

.. _table-rom4:

.. table:: Mémoire ROM permettant de stocker 4 blocs de 16 bits
   :align: center

   ======= ===================
   Adresse Valeur
   ------- -------------------
   0b11    0b1100100100100111
   0b10    0b0000000000000001
   0b01    0b0000000000000000
   0b00    0b1111111111111111
   ======= ===================



La mémoire :index:`ROM` représentée dans la table :numref:`table-rom4`
contient quatre blocs de 16 bits. Le microprocesseur peut accéder à
chacun de ces blocs en indiquant à la mémoire l'adresse à laquelle
il est stocké. Ainsi, la donnée stockée à l'adresse ``0b01`` en mémoire
:index:`ROM`, que l'on pourrait schématiser par la notation
``ROM[0b01]``, est la valeur ``0b0000000000000001`` ou ``1`` en notation
décimale.

Une mémoire :index:`ROM` utilise un nombre de bits d'adresse qui dépend de
sa capacité. Une mémoire permettant de stocker :math:`2^{n}` blocs de données
utilisera des adresses qui sont stockées sur :math:`n` bits. Il faut cependant
noter que dans la plupart des ordinateurs, les mémoires sont organisées de
façon à associer une adresse à chaque octet ou bloc de 8 bits. 

.. spelling:word-list::

   endian
   little
   big


Lorsque l'on doit stocker un bloc de 16 bits dans une mémoire dont l'unité
de stockage est l'octet (8 bits), il faut se mettre d'accord sur la convention
utilisée pour stocker les bits de poids fort et les bits de poids faible.
Considérons la séquence de bits ``0b 01000000 00000001``. Cette séquence de
bits correspond à la valeur entière ``8193``. Dans une mémoire dont l'unité
de stockage est l'octet, elle peut être stockée de deux façons différentes.
La première convention, baptisée :index:`big-endian` stocke l'octet de poids
fort (``0b01000000```) à l'adresse la plus petite comme illustré dans la
table :numref:`table-rom2-big`. C'est la convention qui est utilisée par
notre assembleur ainsi que par certains ordinateurs actuels. Gardez cette
convention en tête lorsque vous analysez le contenu d'une mémoire.


.. _table-rom2-big:

.. table:: Mémoire de deux octets contenant la séquence ``0b01000000 00000001``
	   en utilisant la convention `big-endian` 
   :align: center

   ======= ===================
   Adresse Valeur
   ------- -------------------
   0b1     0b00000001
   0b0     0b01000000
   ======= ===================


L'autre convention, baptisée :index:`little-endian`, est de stoker les bits
de poids fort à l'adresse la plus élevée comme représenté dans :numref:`table-rom2-little`.
Cette convention est utilisée par certains ordinateurs actuels.
   
.. _table-rom2-little:

.. table:: Mémoire de deux octets contenant la séquence ``0b01000000 00000001``
	   en utilisant la convention `little-endian`
   :align: center

   ======= ===================
   Adresse Valeur
   ------- -------------------
   0b1     0b01000000
   0b0     0b00000001
   ======= ===================

   

Une mémoire :index:`RAM` a une organisation similaire. Chaque zone de
mémoire permettant de stocker un octet est identifié par une adresse.
Tout comme dans une mémoire :index:`ROM`, le nombre de bits utilisé
pour représenter chaque adresse dépend de la capacité de la mémoire.


Dans une mémoire :index:`RAM`, outre les entrées relatives aux adresses, il faut aussi avoir
une entrée `load` (parfois appelée `read/write`) pour déterminer si la mémoire doit lire ou
écrire une donnée et une entrée `data` permettant de charger des données dans la `RAM`. Le 
nombre de bits d'adresses dépend uniquement de la capacité de la mémoire. En général, une
adresse correspond à un octet stocké en mémoire. L'entrée `data` quant à elle peut permettre
de charger des octets, des mots de 16, 32 bits ou encore plus. La :numref:`fig-ram`
représente une mémoire :index:`RAM` de façon schématique.

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

Cette mémoire :index:`RAM` peut être utilisée par notre microprocesseur
comme mémoire permettant de stocker à la fois les instructions et
les données. Tant les instructions que les données sont stockées sous
la forme de séquences de bits. Nous analyserons plus tard comment représenter
une instruction comme une séquence de bits. Pour le moment, concentrons-nous
sur l'utilisation de la mémoire :index:`RAM` pour stocker des données
qui seront utilisées par nos programmes.

Le langage d'assemblage nous permet de précharger en mémoire :index:`RAM`
des constantes qui pourront ensuite être utilisées dans notre programme.
Le mot clé :index:`DB` permet de stocker en mémoire une constante.

A titre d'exemple, le code ci-dessous stocke le bloc de 16 bits ``0b00000000 0000011`` à
l'adresse ``0`` en mémoire et le bloc ``0b00000000 00000111`` à l'adresse ``2``.

.. code-block:: nasm

   DB 3
   DB 7


En pratique, le mot clé ``DB`` sera rarement utilisé de cette façon.
Dans un programme, on utilisera ce mot clé pour définir des constantes
ou alors pour fixer la valeur initiale de certaines variables. Dans ces
deux cas d'utilisation, il est important pour le programmeur de pouvoir
connaître l'adresse mémoire correspondant à chacune de ces variables 
ou constantes. L'assembleur que nous utilisons permet d'associer une
:index:`étiquette` (:index:`label` en anglais) à certaines adresses mémoire. Ces
étiquettes peuvent ensuite être utilisées par les instructions du
programme et elles sont automatiquement traduites par l'assembleur en
l'adresse correspondante. Pour définir une étiquette, il suffit
d'écrire sur une ligne une chaîne de caractères suivie par le caractère
``:`` et ensuite l'instruction en assembleur (souvent ``DB``). 

Les instructions de l'assembleur telles que ``MOV`` peuvent
utiliser des étiquettes de deux façons différentes. Tout d'abord,
si une étiquette apparaît dans une instruction en assembleur, elle
est automatiquement remplacée par l'adresse mémoire à laquelle elle
correspond. Si cette étiquette est placée entre crochets (``[``  et
``]``), alors le processeur ira chercher la donnée qui se trouve en
mémoire à l'adresse de l'étiquette.

Le programme ci-dessous définit deux étiquettes: `x` et `y`. Il
initialise la valeur stockée à l'adresse `x` à ``3`` et celle
stockée à l'adresse `y` à ``7`` via les deux commandes
``DB``. La première instruction place dans le registre
``A`` la valeur qui se trouve en mémoire à l'adresse de l'étiquette
`x`, c'est-à-dire la valeur ``3``. La deuxième instruction
place dans le registre ``B`` la valeur qui se trouve en mémoire
à l'adresse de l'étiquette `y`, c'est-à-dire la valeur ``7``.
Ensuite, l'instruction ``ADD`` place la valeur ``10`` dans le registre
``A``. 

.. todo:: vérifier avec le nouveau simulateur et mettre une copie d'écran

.. code-block:: nasm

   MOV A, [x]
   MOV B, [y]
   ADD A, B
   HLT
   ;  Variables et données du programme
   x: DB 3
   y: DB 7

   
   

Lorsque le programme ci-dessus est transformé en langage machine et
stocké en mémoire, l'instruction :index:`HLT` se trouve à l'adresse
``18```. L'étiquette `x` correspond à l'adresse ``19`` et `y` à
l'adresse ``20``.


Nous pouvons maintenant lister tous les arguments possibles de
l'instruction :index:`MOV`:

 - ``MOV reg1, reg2`` (``reg1`` et ``reg2`` sont des identifiants
   de registres) : place dans ``reg1`` la valeur se trouvant actuellement
   dans ``reg2``. Le contenu de ``reg2`` n'est pas modifié
 - ``MOV reg, cst`` (``reg`` est un identifiant de registre et ``cst`` une
   constante) : place dans le registre ``reg`` la valeur ``cst``
 - ``MOV reg, adr`` (``reg`` est un identifiant de registre et
   ``adr`` une adresse en mémoire ou une étiquette) : place dans ``reg``
   l'adresse ``adr``
 - ``MOV reg, [adr]`` (``reg`` est un identifiant de registre et
   ``adr`` une adresse en mémoire ou une étiquette) : place dans ``reg``
   la valeur se trouvant en mémoire à l'adresse ``adr``
 - ``MOV [adr], reg`` (``reg`` est un identifiant de registre et
   ``adr`` une adresse en mémoire ou une étiquette) : place la valeur
   se trouvant dans le registre ``reg`` en mémoire à l'adresse ``adr``
   
Les instructions ``ADD`` et ``SUB`` prennent les mêmes arguments que l'instruction
``MOV``. Les instructions ``INC`` et ``DEC`` ne prennent qu'un registre comme
argument.

Les instructions ``MUL`` et ``DIV`` supportent elles trois types d'arguments:

 - ``MUL reg`` (``reg`` est un identifiant de registre) : place dans le
   registre ``A`` le résultat du produit entre la valeur se trouvant dans
   le registre ``reg`` et le registre ``A``.
 - ``MUL cst`` (``cst`` est une valeur entière) : place dans le
   registre ``A`` le résultat du produit entre la valeur entière passée
   en argument et le registre ``A``.
 - ``MUL [adr]`` (``adr`` est une adresse en mémoire ou une étiquette) :
   place dans le registre ``A`` le résultat du produit entre la valeur
   se trouvant à l'adresse passée en argument et le registre ``A``.


L'instruction ``DIV`` prend également ces trois types d'arguments.   

Avec ces instructions qui permettent de manipuler des données se trouvant
en mémoire, il est possible de gérer des variables et de réaliser des opérations
arithmétiques sur ces variables en mémoire. A titre d'exemple, considérons
le programme python ci-dessous.

.. code-block:: python

   x=3
   y=5
   z=x+2*y


Lors de son exécution, ce programme place dans la variable ``z`` la
valeur ``13``. Pour écrire un programme équivalent en assembleur, nous
devons d'abord réserver une zone mémoire pour stocker chacune des
trois variables. Cela se fait en utilisant les trois lignes en
fin de programme avec le mot-clé ``DB``. Nous initialisons la variable
``z`` à la valeur ``0``. Ces zones mémoire étant définies et initialisées,
nous pouvons d'abord calculer l'expression :math:`2*y` et stocker son
résultat dans le registre ``A``. Ensuite, il suffit d'ajouter
le contenu de la variable ``x`` au résultat obtenu et de sauver le
résultat de l'addition à l'adresse de la variable ``z``.
   

.. code-block:: nasm

   MOV A, [y]     ; place la valeur de la variable y dans A
   MUL 2          ; multiplie le contenu de A par 2
   ADD A, [x]     ; ajoute au contenu de A la valeur de la variable x
   MOV [z], A     ; sauvegarde du résultat du calcul dans la variable z
   HLT
   ;  Variables et données du programme
   x: DB 3
   y: DB 5	 
   z: DB 0
   

   
En mathématiques, on sait que les expressions :math:`x*x-y*y` et
:math:`(x-y)*(x+y)` sont équivalents. Vérifions en python et
en assembleur que c'est bien le cas lorsque la variable ``x``
vaut ``9`` et la variable ``y`` vaut ``2``.

.. code-block:: python

   x=9
   y=2
   z1=x*x-y*y
   z2=(x-y)*(x+y)


Pour traduire ces lignes de python en assembleur, nous
devons découper les expressions mathématiques en sous-expressions
qui sont réalisables avec les instructions ``ADD``, ``SUB`` et ``MUL``.
Commençons par l'expression :math:`x*x-y*y`. Nous pouvons d'abord
calculer les deux carrés et les stocker dans deux registres avant
de réaliser la soustraction.
   
   
.. code-block:: nasm

   MOV A, [y]     ; place la valeur de la variable y dans A
   MUL A          ; multiplie le contenu de A par lui-même
   MOV B, A   	  ; sauvegarde du résultat dans	le registre B
   MOV A, [x]     ; place la valeur de la variable x dans A
   MUL A          ; multiplie le contenu de A par lui-même
   SUB A, B       ; soustraction des deux carrés
   MOV [z1], A    ; sauvegarde du résultat du calcul dans la variable z1
   MOV A, [x]     ; place la valeur de la variable x dans A
   SUB A, [y]     ; calcul de x-y
   MOV B, [x]     ; place la valeur de la variable x dans B
   ADD B, [y]     ; calcul de x+y
   MUL B
   MOV [z2], A 	  ; sauvegarde du résultat du calcul dans la variable z2
   HLT
   ;  Variables et données du programme
   x: DB 9
   y: DB 2
   z1: DB 0
   z2: DB 0		


En exécutant ce programme dans le simulateur, on peut facilement vérifier
que les zones mémoires étiquettées ``z1`` et ``z2`` contiennent bien le même naturel
avec l'exécution du programme.


Instructions logiques
---------------------

Comme nous l'avons indiqué précédemment, un microprocesseur manipule des séquences de bits.
Outre les opérations arithmétiques que nous venons de voir, il est parfois intéressant
de réaliser des opérations directement sur les séquence de bits. Cela se fait en utilisant
les instructions logiques qui s'appuient sur les opérations booléennes. Une :index:`opération 
booléenne` est une fonction qui prend en entrée 0, 1 ou plusieurs bits et retourne un résultat.

Fonctions booléennes
____________________

La fonction booléenne la plus simple est la fonction identité. Elle prend comme entrée un bit et retourne la valeur de ce bit. On peut la définir en utilisant une :index:`table de vérité` qui indique la valeur du résultat de la fonction pour chaque valeur possible de son entrée. Dans la table ci-dessous, la colonne `x` contient les différentes valeurs possibles de l'entrée `x` et la valeur du résultat pour chacune des valeurs possibles de `x`.

.. spelling:word-list::

   NOT
   AND
   OR
   XOR
   NAND
   NOR



=== ===========
x   identité(x) 
--- -----------
0   0 
1   1
=== ===========


Cette fonction n'est pas très utile en pratique. Elle nous permet d'illustrer une table de vérité simple dans laquelle il y a une valeur binaire en entrée et une valeur binaire également en sortie.

Une fonction plus intéressante est l':index:`inverseur`, aussi dénommée :index:`NOT(x)` en anglais. Cette fonction prend comme entrée un bit. Si le bit d'entrée vaut `1`, elle retourne `0`. Tandis que si le bit d'entrée vaut `0`, elle retourne `1`. Cette fonction sera très fréquemment utilisée pour construire des circuits électroniques. 

=== ======
x   NOT(x)
--- ------
0   1 
1   0
=== ======

Il y a encore deux fonctions que l'on peut construire avec une seule entrée binaire. La première, baptisée :index:`Toujours0`, retourne toujours la valeur ``0``, quelle que soit son entrée. La seconde, baptisée :index:`Toujours1` retourne toujours la valeur ``1``. Voici leurs tables de vérité.

=== ============
x   Toujours0(x) 
--- ------------
0   0 
1   0 
=== ============



=== ============
x   Toujours1(x) 
--- ------------
0   1 
1   1
=== ============


La logique booléenne devient nettement plus intéressante lorsque l'on considère des fonctions qui prennent plus d'une entrée.


Fonctions booléennes à deux entrées 
___________________________________

Plusieurs fonctions booléennes classiques existent. Les premières correspondent
à la conjonction (`et`) et à la disjonction (`ou`) en logique. Commençons par
la fonction `AND`. Celle-ci correspond à la table de vérité suivante:

=== = ========
x   y AND(x,y) 
--- - --------
0   0 0 
0   1 0 
1   0 0 
1   1 1 
=== = ========


Cette table comprend quatre lignes qui correspondent à toutes les combinaisons possibles des deux entrées de la fonction. On remarque aisément que la fonction :index:`AND(x,y)` retourne la valeur ``1`` uniquement lorsque ses deux entrées ont la valeur ``1``. Si une des deux entrées de la fonction `AND(x,y)` a la valeur
``0``, alors sa sortie est nécessairement ``0``. Cette fonction est bien l'équivalent de la conjonction logique si l'on applique la convention que ``0`` représente la valeur `Faux`.

La fonction :index:`OR(x,y)`, quant à elle, est l'équivalent de la disjonction logique. Sa table de vérité est reprise ci-dessous.


=== = ========
x   y OR(x,y) 
--- - --------
0   0 0 
0   1 1 
1   0 1 
1   1 1 
=== = ========


On remarque aisément que la fonction `OR(x,y)` correspond bien à la disjonction logique lorsque `1` représente la valeur `Vrai`. Cette fonction `OR(x,y)` ne retourne la valeur ``0`` que si ses deux entrées valent ``0``. Dans tous les autres cas, elle retourne la valeur ``1``.

Ces fonctions peuvent être combinées entre elles. Un premier exemple est d'appliquer un inverseur (opération `NOT` au résultat de la fonction `AND`). Cette fonction booléenne s'appelle généralement :index:`NAND(x,y)` (`NOT AND`) et sa table de vérité est la suivante. On pourra dire que :math:`NAND(x,y) \iff NOT(AND(x,y))`. 

=== = =========
x   y NAND(x,y) 
--- - ---------
0   0 1 
0   1 1 
1   0 1 
1   1 0 
=== = =========


De même, la fonction :index:`NOR(x,y)` s'obtient en inversant le résultat de la fonction `OR`. On pourra dire que :math:`NOR(x,y) \iff NOT(OR(x,y))`. 


=== = ========
x   y NOR(x,y) 
--- - --------
0   0 1 
0   1 0 
1   0 0 
1   1 0 
=== = ========

Il est important de noter que `NOR(x,y)` n'est pas équivalent à la fonction `OR(NOT(x),NOT(y))`. La table de vérité de cette dernière fonction est reprise ci-dessous.

= = ======  ====== =================
x y NOT(x)  NOT(y) OR(NOT(x),NOT(y)) 
- - ------  ------ -----------------
0 0   1        1          1
0 1   1        0          1
1 0   0        1          1
1 1   0        0          0
= = ======  ====== =================

 
Il existe d'autres fonctions booléennes à deux entrées qui sont utiles en pratique. Parmi celles-ci, on retrouve la fonction :index:`XOR(x,y)` qui retourne la valeur `1` uniquement si une seule de ses entrées a la valeur `1`. Sa table de vérité est reprise ci-dessous. On remarquera qu'elle diffère de celle des autres fonctions booléennes que nous avons déjà présenté.


=== = ========
x   y XOR(x,y) 
--- - --------
0   0 0 
0   1 1 
1   0 1 
1   1 0 
=== = ========


Ces opérations logiques peuvent être réalisées bit à bit sur des blocs de 16 bits tels que ceux qui sont stockés dans les registres de notre processeur ou en mémoire. On peut aisément définir l'opération ``NOT`` sur le mot de 16 bits :math:`b_{15}b_{14}b_{13}b_{12}b_{11}b_{10}b_{9}b_{8}b_{7}b_{6}b_{5}b_{4}b_{3}b_{2}b_{1}b_{0}` comme suit:

:math:`NOT(b_{15}b_{14}b_{13}b_{12}b_{11}b_{10}b_{9}b_{8}b_{7}b_{6}b_{5}b_{4}b_{3}b_{2}b_{1}b_{0})=not(b_{15})not(b_{14})not(b_{13})not(b_{12})not(b_{11})not(b_{10})not(b_{9})not(b_{8})not(b_{7})not(b_{6})not(b_{5})not(b_{4})not(b_{3})not(b_{2})not(b_{1})not(b_{0})` où :math:`not(...)` est l'opération NOT appliquée à un bit définie plus haut.


De la même façon, on peut définir les opérations qui prennent deux arguments telles que ``OR`` ou ``AND`` comme suit:

:math:`OR(a_{15}a_{14}a_{13}a_{12}a_{11}a_{10}a_{9}a_{8}a_{7}a_{6}a_{5}a_{4}a_{3}a_{2}a_{1}a_{0},b_{15}b_{14}b_{13}b_{12}b_{11}b_{10}b_{9}b_{8}b_{7}b_{6}b_{5}b_{4}b_{3}b_{2}b_{1}b_{0})=or(a_{15},b_{15})or(a_{14},b_{14})or(a_{13},b_{13})or(a_{12},b_{12})or(a_{11},b_{11})or(a_{10},b_{10})or(a_{9},b_{9})or(a_{8},b_{8})or(a_{7},b_{7})or(a_{6},b_{6})or(a_{5},b_{5})or(a_{4},b_{4})or(a_{3},b_{3})or(a_{2},b_{2})or(a_{1},b_{1})or(a_{0},b_{0})` où :math:`or(...)` est l'opération OR appliquée à un bit définie plus haut.

Ces opérations logiques existent sous trois formes en fonction de leurs arguments:

 - ``OR reg1, reg2``: place dans le registre ``reg1`` le résultat de l'opération ``OR`` appliquée aux valeurs stockées dans les registres ``reg1`` et ``reg2``
 - ``OR reg1, [adr]``: place dans le registre ``reg1`` le résultat de l'opération ``OR`` appliquée aux valeurs stockées dans le registre ``reg1`` et en mémoire à l'adresse ``adr``
 - ``OR reg1, c``: place dans le registre ``reg1`` le résultat de l'opération ``OR`` appliquée aux valeurs stockées dans le registre ``reg1`` et la constance ``c``

 
Ces instructions permettent d'utiliser ces opérations logiques sur des blocs de 16 bits. En pratique, elles s'avèrent aussi très utile lorsque l'on souhaite fixer des valeurs à certains bits en particulier. Considérons par exemple le bloc de 16 bits :math:`b_{15}b_{14}b_{13}b_{12}b_{11}b_{10}b_{9}b_{8}b_{7}b_{6}b_{5}b_{4}b_{3}b_{2}b_{1}b_{0}` qui est actuellement stocké dans le registre ``A``.

Si l'on souhaite forcer le bit de poids faible à la valeur ``0`` sans changer aucun des autres bits de ce bloc, il suffit d'exécuter l'instruction ``AND A, 1111111111111110b``. Le lecteur attentif vérifiera aisément que :math:`AND(b,1)` vaut :math:`b` et que :math:`AND(b,0)` vaut toujours :math:`0`, quelle que soit la valeur du bit :math:`b`.

L'instruction ``OR`` permet elle de forcer la valeur d'un bit à ``1``. Ainsi ``OR A, 1000000000000000b`` forcera la valeur du bit de poids fort du registre ``A`` à ``1`` sans changer les valeurs des autres registres. 
   

Le langage python supporte également les opérations booléennes bit à bit. Les principales sont listées ci-dessous:

   - En python `AND(a,b)` s'écrit ``a & b``
   - En python `OR(a,b)` s'écrit ``a | b``
   - En python `NOT(a)` s'écrit ``~ a``
   - En python `XOR(a,b)` s'écrit ``a ^ b``



Instructions de manipulation de bits
------------------------------------

.. spelling:word-list::

   SHR
   SHL
   SHift
   Left
   Right

Notre processeur supporte également des opérations de décalage à gauche (:index:`SHL` - SHift Left) et à droite (:index:`SHR` - SHift Right). Ces instructions prennent deux arguments comme les opérations arithmétiques. En pratique, ces instructions sont généralement utilisées avec une constante comme second argument.

L'instruction ``SHL reg, n`` décale de n positions les bits se trouvant dans le registre ``reg`` vers la gauche. A titre d'exemple, si le registre ``B`` contient les bits :math:`b_{15}b_{14}b_{13}b_{12}b_{11}b_{10}b_{9}b_{8}b_{7}b_{6}b_{5}b_{4}b_{3}b_{2}b_{1}b_{0}`, alors après exécution de l'instruction ``SHL B, 3`` ce registre contiendra les bits :math:`b_{12}b_{11}b_{10}b_{9}b_{8}b_{7}b_{6}b_{5}b_{4}b_{3}b_{2}b_{1}b_{0}000`. De façon équivalente, si on exécute ``SHR B, 5`` sur les bits :math:`b_{15}b_{14}b_{13}b_{12}b_{11}b_{10}b_{9}b_{8}b_{7}b_{6}b_{5}b_{4}b_{3}b_{2}b_{1}b_{0}`, on obtient :math:`00000b_{15}b_{14}b_{13}b_{12}b_{11}b_{10}b_{9}b_{8}b_{7}b_{6}b_{5}`. 

Il est aussi possible de demander à python d'effectuer des décalages à gauche et à droite. Ainsi, ``x << p`` décale la représentation binaire de ``x`` de `p` positions vers la gauche. De la même façon, ``y >> p`` décale la représentation binaire de ``y`` de `p` positions vers la droite.    


