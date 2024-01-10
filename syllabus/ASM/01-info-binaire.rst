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


.. table:: Représentation possibles de chiffres décimaux
   :align: center


   ======= ================
   Chiffre Séquence binaire
   ------- ----------------
   0       ``0000``
   1       ``0001``
   2	   ``0010``
   3       ``0011``
   4	   ``0100``
   5	   ``0101``
   6	   ``0110``
   7	   ``0111``
   8	   ``1000``
   9	   ``1001``
   ======= ================

.. spelling:word-list::

   DCB
   BCD
   Binary
   Coded
   Decimal

   
En utilisant cette représentation, on peut représenter n'importe quel nombre naturel comme une séquence de bits. Il suffit pour cela de représenter chaque chiffre par un bloc de quatre bits. Ainsi, le nombre `478` en notation décimale pourra être représenté par la séquence de bits ``0100 0111 1000``. Dans la littérature, cette représentation est dénommé :index:`DCB`, pour Décimal Codé en Binaire ou :index:`BCD` pour Binary Coded Decimal en anglais.

Pour représenter les lettres de l'alphabet en plus des chiffres, il nous faut utiliser plus de bits. On peut facilement voir qu'avec :math:`n` bits on peut construire :math:`2^n` séquences distinctes. Avec 4 bits, on peut donc obtenir 16 séquences distinctes. Il faut 5 bits pour avoir 32 séquences distinctes, 6 bits pour en construire 64, ... Notre alphabet latin comprend 26 lettres. Si on veut pouvoir représenter les lettres majuscules et les chiffres sous forme binaire, nous utiliser au minimum 6 bits. Avec ces six bits, on peut représenter les 26 lettres majuscules, les 26 lettres minuscules et les 10 chiffres. Il ne nous reste ensuite plus que 2 séquences de bits pour représenter tous les autres caractères comme la ponctuation, les symboles mathématiques, ...

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

   
