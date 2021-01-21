Compléments sur les fonctions booléennes
========================================

Dans les chapitres précédents, nous avons couvert les bases de la construction des fonctions booléennes en utilisant les fonctions `AND`, `OR` et `NOT`. Il existe de nombreuses fonctions de ce type. La plupart de ces fonctions manipulent des séquences de bits. Certaines de ces séquences de bits servent à représenter de l'information d'un type particulier. 

Représentation binaire de l'information
---------------------------------------

Dans un ordinateur, toutes les informations peuvent être stockées sous la forme d'une séquence de bits. La longueur de la séquence est fonction de la quantité d'information à stocker. Notre premier exemple concerne les caractères. Il est important de pouvoir représenter les différents caractères des langues écrites de façon compacte et non-ambiguë pour pouvoir stocker et manipuler du texte sur un ordinateur. Le principe est très simple. Il suffit de construire une table qui met en correspondance une séquence de bits et le caractère qu'elle représente.

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
   
Fonctions booléennes sur les séquences de bits
----------------------------------------------


De nombreuses fonctions manipulent des séquences de bits. Nous verrons dans le prochain chapitre comment représenter des nombres sous la forme d'une séquence de bits et comment réaliser différentes opérations arithmétiques sur ces séquences de bits. Ces fonctions sont dites combinatoires car ce sont des fonctions dont le résultat dépend uniquement des valeurs d'entrée. Dans cette section, nous abordons d'abord les fonctions combinatoires qui permettent de déplacer des bits dans une séquence. Nous considérons trois types de fonctions:

 - les fonctions de décalage (à droite ou à gauche)
 - les fonctions de rotation (à droite ou à gauche)
 - les fonctions de masquage permettant de forcer certains bits à la valeur `0` ou  `1`

Chacune de ces fonctions travaille sur une séquence de `n` bits, :math:`b_{n-1}b_{n-2}...b_{2}b_{1}b_{0}`. Dans une telle séquence, nous avons vu que :math:`b_{n-1}` était le bit de poids fort tandis que :math:`b_{0}` est le bit de poids faible. Ces opérations sont généralement appliquées à des séquences de 8, 16, 32 ou 64 bits  

Plusieurs fonctions de décalage sont possibles. La plus simple est la fonction de décalage d'un bit vers la droite. Cette fonction prend comme entrée la séquence de bits :math:`b_{n-1}b_{n-2}...b_{2}b_{1}b_{0}` et retourne comme résultat la séquence :math:`0b_{n-1}b_{n-2}...b_{2}b_{1}`. Tous les bits sont décalés d'une place vers la droite. Il existe une variante de cette fonction de décalage qui retourne :math:`b_{n-1}b_{n-1}b_{n-2}...b_{2}b_{1}` pour la séquence d'entrée :math:`b_{n-1}b_{n-2}...b_{2}b_{1}b_{0}`. Elle est parfois utilisée pour certaines manipulations des nombres entiers.

De la même façon, la fonction de décalage d'une place vers la gauche prend comme entrée la séquence de bits :math:`b_{n-1}b_{n-2}...b_{2}b_{1}b_{0}` et retourne comme résultat :math:`b_{n-2}...b_{2}b_{1}b_{0}0`.

Ces deux fonctions peuvent se généraliser. Plutôt que de décaler la séquence de bits d'une place vers la gauche ou vers la droite, on peut la décaler de `p` places où `p` est aussi une entrée de la fonction. Ainsi, lorsque l'on décale de deux places vers la droite la séquence :math:`b_{n-1}b_{n-2}...b_{2}b_{1}b_{0}`, on obtient la séquence :math:`00b_{n-1}b_{n-2}...b_{2}`. Il en va de même pour le décalage vers la gauche.


Exercices
_________

1. Écrivez la table de vérité de la fonction de décalage permettant de décaler bloc de quatre bits (:index:`nibble` en anglais et index:`quartet` ou index:`semi-octet` en français d'une place vers la droite. Implémentez ensuite cette fonction en utilisant uniquement des fonctions `AND`, `OR` et `NOT`.

2. Écrivez la table de vérité de la fonction de décalage permettant de décaler un quartet (4 bits) d'une place vers la gauche. Implémentez ensuite cette fonction en utilisant uniquement des fonctions `AND`, `OR` et `NOT`.

3. Écrivez la table de vérité de la fonction de décalage permettant de décaler un quartet (4 bits) de `p` places vers la droite. Pour écrire cette date de vérité, on utilisera deux bits pour représenter l'entrée `p` est les séquences de deux bits suivantes pour représenter les entiers de `0` à `3`.

   - `00` représente l'entier 0
   - `01` représente l'entier 1
   - `10` représente l'entier 2
   - `11` représente l'entier 3
     
  Implémentez ensuite cette fonction en utilisant uniquement des fonctions `AND`, `OR` et `NOT`.  

4. Faites de même pour le décalage de `p` places vers la droite.


Les fonctions de décalage sont utiles pour certaines manipulations sur les bits dans une séquence. Malheureusement, elles résultent en une perte d'information puisque un ou des bits de poids faible sont perdus lors d'un décalage vers la droite. Les fonctions de rotation évitent ce problème. Elles peuvent notamment servir à construire des algorithmes pour crypter (et décrypter) des données stockées sous forme binaire.

La rotation la plus simple est la rotation d'une place vers la droite. Cette fonction prend en entrée une séquence de bits :math:`b_{n-1}b_{n-2}...b_{2}b_{1}b_{0}` et retourne la séquence :math:`b_{0}b_{n-1}b_{n-2}...b_{2}b_{1}`. D'une façon similaire, dans un décalage à gauche d'une place, lorsque la fonction reçoit la séquence :math:`b_{n-1}b_{n-2}...b_{2}b_{1}b_{0}` en entrée, elle retourne la séquence :math:`b_{n-2}...b_{2}b_{1}b_{0}b_{n-1}`. Tout comme pour les fonctions de décalage, les fonctions de rotation peuvent recevoir une seconde entrée qui est le nombre de places de rotation.

Exercices
_________


1. Écrivez la table de vérité de la fonction qui réalise la rotation d'une place vers la gauche d'un quartet (4 bits). Implémentez ensuite cette fonction en utilisant uniquement des fonctions `AND`, `OR` et `NOT`.

2. Écrivez la table de vérité de la fonction qui réalise la rotation d'un quartet (4 bits) de `p` places vers la gauche. Pour écrire cette table de vérité, on utilisera deux bits pour représenter l'entrée `p` est les séquences de deux bits suivantes pour représenter les entiers de `0` à `3`.

   - `00` représente l'entier `0`
   - `01` représente l'entier `1`
   - `10` représente l'entier `2`
   - `11` représente l'entier `3`
     
  Implémentez ensuite cette fonction en utilisant uniquement des fonctions `AND`, `OR` et `NOT`.  

.. masquage

Dans certaines applications, il est utile de pouvoir forcer la valeur d'un bit particulier à `0` ou `1`. Pour illustrer ces interactions, considérons deux exemples sur base de la représentation des caractères et l'utilisation de pixels. Dans la table US-ASCII, les lettres majuscules sont représentées par des chaînes de bits dont les deux bits de poids forts sont à `10` tandis que pour les minuscules, ces deux bits de poids forts sont à `11`. Si on observe les séquences de bits pour chaque caractère, on remarque que les 4 bits de poids faible sont identiques pour la majuscule et la minuscule d'une lettre. Ainsi, pour la lettre `E`, on utilise les séquence `1000101` en majuscules et `1100101` en minuscules. Si une séquence de 7 bits représente une lettre majuscules, alors on peut facilement la convertir en minuscules en forçant le deuxième bit de poids fort à la valeur `1`. Sachant que la fonction booléenne `OR` retourne toujours `1` lorsqu'au moins une de ses deux entrées vaut `1`, on peut transformer une majuscule en minuscule en calculant `OR` avec la séquence `0100000`. Si la représentation du caractère initiale est :math:`b_{6}b_{5}b_{4}b_{3}b_{2}b_{1}b_{0}`, alors la fonction `OR 0100000` retournera :math:`b_{6}1b_{4}b_{3}b_{2}b_{1}b_{0}`. De la même façon, on peut forcer un bit à zéro en utilisant la fonction `AND`. Par exemple, pour transformer une minuscule en majuscule en utilisant le masque `1011111`. 



Lorsqu'un ordinateur doit transmettre ou stocker de l'information encodée sous la forme d'une séquence de bits, il doit parfois pouvoir s'assurer que l'information qui est reçue ou lue est bien identique à celle qui a été envoyée ou écrite.

Un exemple classique de l'utilisation de ces techniques concerne les sondes spatiales qui sont envoyées pour explore les planètes du système solaire voire explorer au-delà de notre système solaire. Ces sondes collectent de nombreuses informations qu'elles doivent envoyer par radio vers la Terre. Différentes techniques, qui sortent du cadre de ce cours, permettent d'envoyer des séquences de bits par radio. Malheureusement, les transmissions radio peuvent être perturbées par différents phénomènes naturels dont les émissions du soleil par exemple. Suite à ces perturbations, une séquence de bits envoyée par une sonde spatiale peut être reçue de façon incorrecte par la station d'écoute se trouvant au sol. Vu les capacités de la sonde spatiale et les délais de transmission entre les confins du système solaire et la Terre, il est impossible de demander à la sonde spatiale de stocker de l'information pour pouvoir la retransmettre au cas où elle ne serait pas reçue correctement par la station d'écoute sur la Terre. A titre d'exemple, la distance entre Mercure et la Terre varie entre 77 millions de kilomètres et 222 millions de kilomètres. La lumière, qui est la façon la plus rapide de transmettre de l'information, se propage à une vitesse de 300.000 kilomètres par seconde. Cela signifie que lorsque Mercure est proche de la Terre, un signal émis par une sonde autour de Mercure met au moins 256 secondes pour atteindre la Terre. Pour les sondes Voyager 1 et Voyager 2 qui explorent les confins du système solaire, les délais sont encore plus grands. En octobre 2020, un signal radio émis par Voyager 1 mettait près de 21 heures pour atteindre la Terre.

.. voir https://voyager.jpl.nasa.gov/mission/status/

Plusieurs techniques ont étés proposées pour faire face à des erreurs dans la transmission de séquences de bits. Certaines permettent de détecter des erreurs dans l'information reçue. D'autres, plus complexes, permettent de récupérer certaines erreurs de transmission.

Les techniques de détection les plus simples sont les techniques dite `de parité`. L'idée est très simple. Pour pouvoir détecter si une erreur de transmission a affecté une séquence de bits, il suffit d'encoder ces séquences de bits de façon à pouvoir facilement distinguer une séquence valide d'une séquence invalide. Les techniques de parité séparent les séquences de bits en deux moitiés. La première contient les séquences valides qui sont émises par l'émetteur. La seconde contient des séquences qui peuvent être obtenues des première après une erreur de transmission.

La technique de parité paire fonctionne comme suit. Une séquence de `n+1` bits, :math:`b_{n-1}b_{n-2}...b_{2}b_{1}b_{0}p` est valide si elle contient un nombre pair de bits ayant la valeur `1` et invalide sinon. Lorsqu'un émetteur veut envoyer `n` bits, il doit calculer la valeur du bit de poids faible de façon à ce que la séquence des `n+1` bits contienne un nombre pair de bits à la valeur `1`.

Il est utile de prendre quelques exemples pour bien comprendre comment cette technique fonctionne. Considérons les caractères représentés sur 7 bits. Une parité peut être associé à chacun de ces caractères.

 - la parité paire de `01100000` sera `0`
 - la parité paire de `01101001` sera `0`
 - la parité paire de `10000011` sera `1`

Considérons une sonde spatiale qui envoie la séquence de bits composée de ces trois caractères avec leur parité paire, c'est-à-dire : `011000000` `011010010` `100000111`. La station d'écoute pourra recalculer le bit de parité qui est placé dans le bit de poids faible de chaque octet pour vérifier qu'il n'y a pas eu d'erreur de transmission. Si par contre la station d'écoute reçoit `011000001` `111010010` `100000111`, elle pourra vérifier que les deux premiers octets sont incorrects tandis que le troisième est correct. Cette technique de parité permet de détecter les erreurs de transmission qui modifient la valeur de un (et un seul bit) dans la séquence de bits couverte par la parité. En pratique, l'émetteur envoie les bits et calcule la valeur du bit de parité pendant l'envoi de ces bits. Le receveur fait l'inverse pour vérifier que la parité de la séquence reçue est correcte.

.. parité paire

.. parité impaire

Exercices
_________

1. Écrivez la table de vérité d'une fonction qui prend une séquence de trois bits en entrée et retourne un bit de parité paire.

2. Écrivez la table de vérité d'une fonction qui prend une séquence de trois bits en entrée et retourne un bit de parité impaire.

3. Écrivez la table de vérité d'une fonction qui prend en entrée un quartet dont le bit de poids faible contient une parité paire et retourne `1` si ce quartet est valide et `0` sinon.

4. Écrivez la table de vérité d'une fonction qui prend en entrée un quartet dont le bit de poids faible contient une parité impaire et retourne `1` si ce quartet est valide et `0` sinon.
   
.. code de Hamming https://en.wikipedia.org/wiki/Hamming_code   
  
.. Le code de Hamming dépend de la représentation des nombres
   
