.. LSINC1102 documentation master file, created by
   sphinx-quickstart on Tue Jan 28 18:06:33 2020.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

.. spelling:word-list::

   coeur
   Etape
   
.. include:: defs.rst
   
Arithmétique binaire
====================

Dans le chapitre précédent, nous avons vu comment un ordinateur pouvait représenter des caractères et des images sous la forme d'un séquence de symboles binaires ou bits. Dans ce chapitre, nous nous focaliserons sur la façon dont il est possible de représenter les nombres entiers et ensuite de réaliser des opérations arithmétiques simples (addition et soustraction) sur ces nombres.


Représentation des nombres naturels
-----------------------------------

Commençons par analyser comment représenter les nombres pour effectuer des opérations arithmétiques. Pour simplifier la présentation, nous travaillerons surtout avec des quartets dans ce chapitre. Il y a seize quartets différents : 

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

En toute généralité, la suite de chiffres :math:`C_{n-1}C_{n-2}...C_{2}C_{1}C_{0}` correspond au naturel :math:`\sum_{i=0}^{i=n-1} C_{i} \times 10^{i}`.

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
      

     
Opérations arithmétiques sur les nombres binaires
-------------------------------------------------

Sur base de cette représentation binaire des nombres naturels, il est possible de réaliser toutes les opérations arithmétiques. La première que nous aborderons est l'addition. Avant de travailler en binaire, il est intéressant de se rappeler comment l'addition se réalise en calcul écrit. Considérons comme premier exemple :math:`123+463`. 

.. code-block:: console

      1 2 3   << premier naturel
    + 4 6 3   << second naturel
    -------
      5 8 6

Pour des nombres simples comme celui repris ci-dessus, l'addition s'effectue
"chiffre par chiffre". Vous avez aussi appris qu'il faut parfois faire des reports lorsqu'une addition "chiffre par chiffre" donne un résultat qui est supérieur à 10. C'est le cas lorsque l'on cherche à ajouter `456` à `789`. 

.. code-block:: console

      1  1  1 	   << reports	
         4  5  6   << premier naturel
    +    7  8  9   << second naturel
    ------------ 
      1  2  4  5 


L'intérêt de cette approche est que l'addition avec des nombres en représentation binaire peut se faire de la même façon. Considérons quelques exemples avec des naturels représentés sur 4 bits.



.. code-block:: console

      0  0  1  0   << premier nombre binaire (2 en décimal)
   +  0  1  0  1   << second nombre binaire (5 en décimal)
   ------------- 
      0  1  1  1   << 7 en décimal

On vérifie aisément que :math:`2+5=7`. Comme avec l'addition des naturels, il est aussi possible d'avoir des reports lorsque l'on réalise une addition entre des nombres binaires. L'exemple ci-dessous réalise l'addition :math:`2+7`.

      
.. code-block:: console

      1	 1  0  0   << reports
      0  0  1  0   << premier nombre binaire (2 en décimal)
   +  0  1  1  1   << second nombre binaire  (7 en décimal)
   -------------
      1  0  0  1


Tout comme avec l'addition des naturels, le report est aussi possible avec le bit de poids fort. En toute généralité, lorsque l'on additionne deux quartets, la notation binaire du résultat devra parfois être stockée sur 5 bits et non 4. L'exemple ci-dessous illustre ce cas.

.. code-block:: console

     1  1  1          << reports	
        1  0  1  0    << premier nombre binaire (10 en décimal)
   +    0  1  1  1    << second nombre binaire  (7 en décimal)
   ---------------
     1  0  0  0  1


En utilisant la représentation binaire, il est possible de construire des fonctions booléennes qui permettent de réaliser l'opération d'addition. Commençons par considérer l'addition entre deux bits. En tout généralité, cette addition peut donner comme résultat un nombre stocké sur deux bits, le bit de poids fort (`report`) et le bit de poids faible (`somme`). Si les deux bits à additionner sont `a` et `b`, on peut facilement vérifier que cette addition correspond à la table de vérité ci-dessous.

= = ====== =====
a b report somme
- - ------ -----
0 0   0      0   
0 1   0      1   
1 0   0      1
1 1   1      0
= = ====== =====

Cette table de vérité correspond à ce que l'on appelle un :index:`demi-additionneur` (:index:`half-adder en anglais`). On l'appelle demi-additionneur car en général, un bit du résultat de l'addition binaire est le résultat de l'addition de trois bits et non deux: les deux bits des nombres à additionner et le bit de report de l'étage précédent.

= = = ====== =====
a b r report somme
- - - ------ -----
0 0 0    0     0   
0 0 1    0     1   
0 1 0    0     1 
0 1 1    1     0
1 0 0    0     1   
1 0 1    1     0 
1 1 0    1     0
1 1 1    1     1
= = = ====== =====


Cette table de vérité correspond à ce que l'on appelle un :index:`additionneur complet` ( :index:`full-adder` en anglais). Il s'agit d'une fonction booléenne à trois entrées (`a`, `b` et `r`) et deux sorties (`report` et `somme`). Comme toutes les fonctions booléennes que nous avons vu dans les chapitres précédents, celle-ci peut facilement s'implémenter en utilisant des fonctions `AND`, `OR` et des inverseurs. 

Vous développerez les circuits correspondants à ces additionneurs dans le cadre du deuxième projet. Un point important à noter est que l'additionneur complet peut facilement remplacer un demi-additionneur en mettant son entrée `r` à zéro. Dans ce cas, sa table de vérité est la suivante:

= = = ====== =====
a b r report somme
- - - ------ -----
0 0 0    0     0   
0 1 0    0     1 
1 0 0    0     1   
1 1 0    1     0
= = = ====== =====

Cet additionneur sera important dans le cadre de ce cours. La :numref:`fig-adder` le représente schématiquement sous la forme d'un rectangle avec trois entrées (`a`, `b` et `r`) et deux sorties (`report` et `somme`).

.. _fig-adder:
.. tikz:: Un additionneur complet
   :libs: positioning 
   
   [
    fulladder/.style={draw, minimum size=2cm, 
    label={[anchor=west]left:$report$}, 
    label={[anchor=south]below:$somme$}, 
    label={[anchor=east]right:$r$}, 
    label={[anchor=north]65:$b$}, 
    label={[anchor=north]115:$a\vphantom{b}$}, 
    }]

    \node[fulladder] (a) {};
    \draw[<-] (a.115) --++(90:0.5cm) node [above] {$a_0$};
    \draw[<-] (a.65) --++(90:0.5cm) node [above] {$b_0$};
    \draw[->] (a.south) --++(-90:0.5cm) node [below] {};
    \draw[<-] (a.east) --++(0:0.5cm) node [right] {$r$};
    \draw[->] (a.west) --++(180:0.5cm) node [left] {};

Le plus intéressant est que ces additionneurs peuvent se combiner en cascade pour construire un additionneur qui est capable d'additionner deux nombres binaires sur `n` bits. La :numref:`fig-adder-4` présente un additionneur qui travaille avec deux quartets, `a` et `b`.

.. _fig-adder-4:
.. tikz:: Avec quatre additionneurs, on peut additionner des quartets 
   :libs: positioning 
   
   [
    fulladder/.style={draw, minimum size=2cm, 
    label={[anchor=west]left:$report$}, 
    label={[anchor=south]below:$somme$}, 
    label={[anchor=east]right:$r$}, 
    label={[anchor=north]65:$b$}, 
    label={[anchor=north]115:$a\vphantom{b}$}, 
    }]

    \node[fulladder] (a) {};
    
    \node[fulladder, right = 1cm of a] (b) {};
    \node[fulladder, left = 1cm of a] (c) {};
    \node[fulladder, left = 1cm of c] (d) {};
    

    \draw[<-] (a.115) --++(90:0.5cm) node [above] {$a_1$};
    \draw[<-] (a.65) --++(90:0.5cm) node [above] {$b_1$};
    \draw[<-] (b.115) --++(90:0.5cm) node [above] {$a_0$};
    \draw[<-] (b.65) --++(90:0.5cm) node [above] {$b_0$};
    
    \draw[<-] (c.115) --++(90:0.5cm) node [above] {$a_2$};
    \draw[<-] (c.65) --++(90:0.5cm) node [above] {$b_2$};
    \draw[<-] (d.115) --++(90:0.5cm) node [above] {$a_3$};
    \draw[<-] (d.65) --++(90:0.5cm) node [above] {$b_3$};


    \draw[<-] (b.east) --++(0:0.5cm) node [right] {$0$};
    \draw[<-] (a.east) -- (b.west);
    \draw[<-] (c.east) -- (a.west);
    \draw[<-] (d.east) -- (c.west);
   
    \draw[->] (a.south) --++(-90:0.5cm) node [below] {$s_1$}; 
    \draw[->] (b.south) --++(-90:0.5cm) node [below] {$s_0$};
    \draw[->] (c.south) --++(-90:0.5cm) node [below] {$s_2$}; 
    \draw[->] (d.south) --++(-90:0.5cm) node [below] {$s_3$};
 

    \draw[->] (d.west) --++(180:0.5cm) node [left] {$r$};

Pour des raisons graphiques, il est compliqué de dessiner un additionneur pour des octets ou des mots de 16 ou 32 bits, mais le même principe s'applique. On peut donc facilement construire un additionneur qui prend en entrées deux nombres encodés sur `n` bits et retourne un résultat encodé sur `n` bits avec un report éventuel.
    
L'additionneur que nous venons de construire prend comme entrées les bits des deux nombres à additionner. Dans ce circuit, le report de l'additionneur qui correspond au bit de poids faible est mis à `0`. Que se passerait-il si cette entrée `r` était mise à la valeur `1` ? Le circuit calculerait le résultat de l'addition :math:`a+b+1`.

En informatique, on doit très souvent incrémenter une valeur entière, par exemple à l'intérieur de boucles. Si `a` est la valeur à incrémenter, on peut grâce à nos quatre additionneurs incrémenter cette valeur en forçant les entrées :math:`b_{i}` à 0 et le report du bit de poids faible à `1`. Ce circuit est représenté dans le schéma de la :numref:`fig-adder-nibble`.


.. _fig-adder-nibble:
.. tikz:: Un circuit pour incrémenter un quartet 
   :libs: positioning 
   
   [
    fulladder/.style={draw, minimum size=2cm, 
    label={[anchor=west]left:$report$}, 
    label={[anchor=south]below:$somme$}, 
    label={[anchor=east]right:$r$}, 
    label={[anchor=north]65:$b$}, 
    label={[anchor=north]115:$a\vphantom{b}$}, 
    }]

    \node[fulladder] (a) {};
    
    \node[fulladder, right = 1cm of a] (b) {};
    \node[fulladder, left = 1cm of a] (c) {};
    \node[fulladder, left = 1cm of c] (d) {};
    

    \draw[<-] (a.115) --++(90:0.5cm) node [above] {$a_1$};
    \draw[<-] (a.65) --++(90:0.5cm) node [above] {$0$};
    \draw[<-] (b.115) --++(90:0.5cm) node [above] {$a_0$};
    \draw[<-] (b.65) --++(90:0.5cm) node [above] {$0$};
    
    \draw[<-] (c.115) --++(90:0.5cm) node [above] {$a_2$};
    \draw[<-] (c.65) --++(90:0.5cm) node [above] {$0$};
    \draw[<-] (d.115) --++(90:0.5cm) node [above] {$a_3$};
    \draw[<-] (d.65) --++(90:0.5cm) node [above] {$0$};


    \draw[<-] (b.east) --++(0:0.5cm) node [right] {$1$};
    \draw[<-] (a.east) -- (b.west);
    \draw[<-] (c.east) -- (a.west);
    \draw[<-] (d.east) -- (c.west);
   
    \draw[->] (a.south) --++(-90:0.5cm) node [below] {$s_1$}; 
    \draw[->] (b.south) --++(-90:0.5cm) node [below] {$s_0$};
    \draw[->] (c.south) --++(-90:0.5cm) node [below] {$s_2$}; 
    \draw[->] (d.south) --++(-90:0.5cm) node [below] {$s_3$};
 

    \draw[->] (d.west) --++(180:0.5cm) node [left] {$r$};
    

Représentation des nombres entiers
----------------------------------

La solution présentée dans la section précédente permet de facilement représenter les nombres naturels qui sont nuls ou strictement positifs. En pratique, les ordinateurs doivent aussi pouvoir représenter les nombres négatifs et effectuer des soustractions. Différentes solutions sont envisageables pour représenter ces nombres entiers.

Une première approche serait d'utiliser un bit du nombre binaire pour indiquer explicitement si le nombre est positif ou négatif. A titre d'exemple, considérons une représentation sur 4 bits et utilisons le bit de poids fort pour indiquer le signe (`0` pour un nombre positif et `1` pour un nombre négatif). Avec cette convention, nous pourrions représenter les nombres suivants:

 - `0 000` représente le nombre `+0`
 - `0 001` représente le nombre `+1`
 - `0 010` représente le nombre `+2`
 - `0 011` représente le nombre `+3`
 - `0 100` représente le nombre `+4`
 - `0 101` représente le nombre `+5`
 - `0 110` représente le nombre `+6`
 - `0 111` représente le nombre `+7`
 - `1 000` représente le nombre `-0`
 - `1 001` représente le nombre `-1`
 - `1 010` représente le nombre `-2`
 - `1 011` représente le nombre `-3`
 - `1 100` représente le nombre `-4`
 - `1 101` représente le nombre `-5`
 - `1 110` représente le nombre `-6`
 - `1 111` représente le nombre `-7`

Nous aurions pu aussi choisir d'utiliser le bit de poids faible pour indiquer le signe du nombre entier. Avec cette convention, nous pourrions représenter les nombres suivants :

 - `000 0` représente le nombre `+0`
 - `000 1` représente le nombre `-0`
 - `001 0` représente le nombre `+1`
 - `001 1` représente le nombre `-1`
 - `010 0` représente le nombre `+2`
 - `010 1` représente le nombre `-2`
 - `011 0` représente le nombre `+3`
 - `011 1` représente le nombre `-3`
 - `100 0` représente le nombre `+4`
 - `100 1` représente le nombre `-4`
 - `101 0` représente le nombre `+5`
 - `101 1` représente le nombre `-5`
 - `110 0` représente le nombre `+6`
 - `110 1` représente le nombre `-6`
 - `111 0` représente le nombre `-7`
 - `111 1` représente le nombre `-7` 

Ces deux conventions permettent de représenter les entiers de `-7` à `+7`. Malheureusement, ces deux représentations ont deux inconvénients majeurs. Premièrement, elles utilisent deux nombres binaires différents pour représenter la valeur nulle. De plus, il est difficile de construire des circuits électroniques qui permettent de facilement manipuler de telles représentations des nombres entiers.


La solution à ce problème est d'utiliser la notation en :index:`complément à deux`. Pour représenter les nombres entiers en notation binaire, nous adaptons la représentation utilisée pour les nombres naturels. Le nombre binaire :math:`B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}` représente le nombre entier :math:`(-1)*B_{n-1}*2^{n-1} + B_{n-2}*2^{n-2} + ... + B_{2}*2^{2} + B_{1}*2^{1} + B_{0}*2^{0}`. Il est important de noter que le facteur `(-1)` est appliqué uniquement au bit de poids fort. En appliquant cette règle aux quartets, on obtient aisément :


 - `0000` représente le nombre `0`
 - `0001` représente le nombre `1`
 - `0010` représente le nombre `2`
 - `0011` représente le nombre `3`
 - `0100` représente le nombre `4`
 - `0101` représente le nombre `5`
 - `0110` représente le nombre `6`
 - `0111` représente le nombre `7`
 - `1000` représente le nombre :math:`-8 + 0 \rightarrow -8`
 - `1001` représente le nombre :math:`-8 + 1 \rightarrow -7`
 - `1010` représente le nombre :math:`-8 + 2 \rightarrow -6`
 - `1011` représente le nombre :math:`-8 + 3 \rightarrow -5`
 - `1100` représente le nombre :math:`-8 + 4 \rightarrow -4`
 - `1101` représente le nombre :math:`-8 + 5 \rightarrow -3`
 - `1110` représente le nombre :math:`-8 + 6 \rightarrow -2`
 - `1111` représente le nombre :math:`-8 + 7 \rightarrow -1`

On remarque aisément qu'il n'y a qu'une seule chaîne de bits qui représente la valeur nulle et que celle-ci correspond à la chaîne de bits dans laquelle tous les bits sont à `0`. C'est un avantage important par rapport aux représentations précédentes. Par contre, il existe un nombre négatif qui n'a pas d'opposé dans une représentation utilisant un nombre fixe de bits. C'est inévitable sachant qu'avec `n` bits on ne peut représenter que :math:`2^{n}` nombres distincts.

Une propriété intéressante de la notation en complément à deux est que tous les nombres négatifs ont leur bit de poids fort qui vaut `1`. C'est une conséquence de la façon dont ces nombres sont représentés et pas un `bit de signe` explicite comme dans les représentations précédentes.

Enfin, l'avantage principal de cette représentation est que l'on va pouvoir assez facilement construire les circuits qui permettent d'effectuer des opérations arithmétiques sur ces nombres. Un premier avantage de la représentation en complément à deux, est qu'il est possible de réutiliser notre additionneur sans aucune modification pour additionner des entiers. Considérons comme premier exemple :math:`(-6)+(-1)`.


.. code-block:: console

      1  1         << reports
      1  0  1  0   << premier nombre binaire : -6
   +  1  1  1  1   << second nombre binaire  : -1
   -------------
   1  1  0  0  1   

Le quartet `1001` est bien la représentation du nombre négatif `-7`. Comme second exemple, prenons :math:`(-2)+(-3)`. Le résultat de l'addition bit à bit est `1011` qui est le quartet qui représente le nombre entier `-5`.


.. code-block:: console

      1            << reports
      1  1  1  0   << premier nombre binaire : -2
   +  1  1  0  1   << second nombre binaire  : -3
   -------------
   1  1  0  1  1

On peut maintenant se demander comment calculer l'opposé d'un nombre en représentation binaire. Une première approche est de déterminer la table de vérité de cette opération qui prend comme entrée `n` bits et retourne un résultat sur `n` bits également. A titre d'exemple, considérons des nombres binaires sur 3 bits.

== == == == == == ============================
a2 a1 a0 b2 b1 b0 Commentaire
-- -- -- -- -- -- ----------------------------
0  0  0  0  0  0  `opposé(0)=0`
0  0  1  1  1  1  `opposé(1)=-1`
0  1  0  1  1  0  `opposé(2)=-2`
0  1  1  1  0  1  `opposé(3)=-3`
1  0  0  ?  ?  ?  `-4` n'a pas d'opposé  
1  0  1  0  1  1  `opposé(-3)=3`
1  1  0  0  1  0  `opposé(-2)=2`
1  1  1  0  0  1  `opposé(-1)=1`
== == == == == == ============================

Sur base de cette table de vérité, on pourrait facilement construire un circuit qui calcule l'opposé d'un nombre sur n bits en utilisant des fonctions `AND`, `OR` et `NOT` ou uniquement des fonctions `NAND` comme durant le premier projet. Cependant, on peut faire beaucoup mieux en réutilisant l'additionneur dont nous disposons déjà. Si on observe la table de vérité ci-dessus, on remarque que l'on peut calculer l'opposé d'un nombre binaire en deux étapes:

 a. inverser tous les bits de ce nombre en utilisant l'opération `NOT`
 b. incrémenter d'une unité le nombre binaire obtenu


La première opération est facile à réaliser en utilisant la fonction `NOT`. La seconde peut se réaliser en utilisant notre additionneur avec un report du bit de poids faible initialisé à `1`. Schématiquement, le circuit à construire pour calculer l'opposé du quartet `a` est donc celui de la :numref:`fig-nibble-oppose`.

.. _fig-nibble-oppose:
.. tikz:: Calcul de l'opposé d'un quartet 
   :libs: positioning 
   
   [
    fulladder/.style={draw, minimum size=2cm, 
    label={[anchor=west]left:$report$}, 
    label={[anchor=south]below:$somme$}, 
    label={[anchor=east]right:$r$}, 
    label={[anchor=north]65:$b$}, 
    label={[anchor=north]115:$a\vphantom{b}$}, 
    }]

    \node[fulladder] (a) {};
    
    \node[fulladder, right = 1cm of a] (b) {};
    \node[fulladder, left = 1cm of a] (c) {};
    \node[fulladder, left = 1cm of c] (d) {};
    
    \node[not gate US, draw, rotate=-90, scale=0.6] at ($(a.115)+(0,0.5)$) (na1) {}; 
    \node[] at ($(na1)+(0,0.5)$) (a1) {$a_1$}; 
    \draw[-] (a1) --(na1); 
    \draw[->] (na1) -- (a.115);    

    \draw[<-] (a.65) --++(90:0.5cm) node [above] {$0$};

    \node[not gate US, draw, rotate=-90, scale=0.6] at ($(b.115)+(0,0.5)$) (na0) {};
    \node[] at ($(na0)+(0,0.5)$) (a0) {$a_0$};
    \draw[-] (a0) --(na0);
    \draw[->] (na0) -- (b.115);
    \draw[<-] (b.65) --++(90:0.5cm) node [above] {$0$};


    \node[not gate US, draw, rotate=-90, scale=0.6] at ($(c.115)+(0,0.5)$) (na2) {}; 
    \node[] at ($(na2)+(0,0.5)$) (a2) {$a_2$}; 
    \draw[-] (a2) --(na2); 
    \draw[->] (na2) -- (c.115);    

   
    \draw[<-] (c.65) --++(90:0.5cm) node [above] {$0$};

    \node[not gate US, draw, rotate=-90, scale=0.6] at ($(d.115)+(0,0.5)$) (na3) {};
    \node[] at ($(na3)+(0,0.5)$) (a3) {$a_3$};
    \draw[-] (a3) --(na3);
    \draw[->] (na3) -- (d.115);
    

    \draw[<-] (d.65) --++(90:0.5cm) node [above] {$0$};


    \draw[<-] (b.east) --++(0:0.5cm) node [right] {$1$};
    \draw[<-] (a.east) -- (b.west);
    \draw[<-] (c.east) -- (a.west);
    \draw[<-] (d.east) -- (c.west);
   
    \draw[->] (a.south) --++(-90:0.5cm) node [below] {$s_1$}; 
    \draw[->] (b.south) --++(-90:0.5cm) node [below] {$s_0$};
    \draw[->] (c.south) --++(-90:0.5cm) node [below] {$s_2$}; 
    \draw[->] (d.south) --++(-90:0.5cm) node [below] {$s_3$};
 

    \draw[->] (d.west) --++(180:0.5cm) node [left] {$r$};
    

Si on sait facilement calculer l'opposé d'un nombre, et additionner deux nombres, il devient possible de réaliser la soustraction. Pour calculer :math:`a-b`, il suffit de calculer :math:`a+(-b)`. Le circuit de la :numref:`fig-b-a` réalise la soustraction :math:`b-a`. Notez que le report du bit de poids faible est mis à `1` et que les bits :math:`a_{i}` sont inversés.

.. _fig-b-a:
.. tikz:: Soustraction: b-a
   :libs: positioning 
   
   [
    fulladder/.style={draw, minimum size=2cm, 
    label={[anchor=west]left:$report$}, 
    label={[anchor=south]below:$somme$}, 
    label={[anchor=east]right:$r$}, 
    label={[anchor=north]65:$b$}, 
    label={[anchor=north]115:$a\vphantom{b}$}, 
    }]

    \node[fulladder] (a) {};
    
    \node[fulladder, right = 1cm of a] (b) {};
    \node[fulladder, left = 1cm of a] (c) {};
    \node[fulladder, left = 1cm of c] (d) {};
    
    \node[not gate US, draw, rotate=-90, scale=0.6] at ($(a.115)+(0,0.5)$) (na1) {}; 
    \node[] at ($(na1)+(0,0.5)$) (a1) {$a_1$}; 
    \draw[-] (a1) --(na1); 
    \draw[->] (na1) -- (a.115);    

    \draw[<-] (a.65) --++(90:0.5cm) node [above] {$b_1$};

    \node[not gate US, draw, rotate=-90, scale=0.6] at ($(b.115)+(0,0.5)$) (na0) {};
    \node[] at ($(na0)+(0,0.5)$) (a0) {$a_0$};
    \draw[-] (a0) --(na0);
    \draw[->] (na0) -- (b.115);


    
    \draw[<-] (b.65) --++(90:0.5cm) node [above] {$b_0$};


    \node[not gate US, draw, rotate=-90, scale=0.6] at ($(c.115)+(0,0.5)$) (na2) {}; 
    \node[] at ($(na2)+(0,0.5)$) (a2) {$a_2$}; 
    \draw[-] (a2) --(na2); 
    \draw[->] (na2) -- (c.115);    

   
    \draw[<-] (c.65) --++(90:0.5cm) node [above] {$b_2$};

    \node[not gate US, draw, rotate=-90, scale=0.6] at ($(d.115)+(0,0.5)$) (na3) {};
    \node[] at ($(na3)+(0,0.5)$) (a3) {$a_3$};
    \draw[-] (a3) --(na3);
    \draw[->] (na3) -- (d.115);
    

    \draw[<-] (d.65) --++(90:0.5cm) node [above] {$b_3$};


    \draw[<-] (b.east) --++(0:0.5cm) node [right] {$1$};
    \draw[<-] (a.east) -- (b.west);
    \draw[<-] (c.east) -- (a.west);
    \draw[<-] (d.east) -- (c.west);
   
    \draw[->] (a.south) --++(-90:0.5cm) node [below] {$s_1$}; 
    \draw[->] (b.south) --++(-90:0.5cm) node [below] {$s_0$};
    \draw[->] (c.south) --++(-90:0.5cm) node [below] {$s_2$}; 
    \draw[->] (d.south) --++(-90:0.5cm) node [below] {$s_3$};
 

    \draw[->] (d.west) --++(180:0.5cm) node [left] {$r$};


     

Unité Arithmétique et Logique
-----------------------------

Cet additionneur joue un rôle important dans les microprocesseurs utilisés par un ordinateur. Souvent, il n'est pas utilisé seul, mais plutôt à l'intérieur d'une :index:`Unité Arithmétique et Logique` (`Arithmetic and Logic Unit` (ALU) en anglais). Ce circuit constitue le coeur d'un ordinateur au niveau du calcul. Il combine les principales fonctions de manipulations de séquences de bits. Dans le projet précédent, vous avez construit un premier circuit programmable: le multiplexeur. Celui-ci a deux entrées sur `n` bits et un signal de contrôle qui permet de sélectionner en sortie la valeur de la première ou de la seconde entrée. L'ALU va plus loin car elle prend deux signaux sur `n` bits en entrée (`x` et `y`) et plusieurs signaux de contrôle qui permettent de sélectionner l'opération à effectuer et à envoyer vers les fils de sortie. L'ALU proposée dans le livre permet de réaliser les 18 opérations reprises dans la :numref:`tableAlu`. 


.. _tableAlu:
.. table:: Signaux de contrôle de l'ALU
	   
   =============  ===========
   Opération      Commentaire
   -------------  -----------
   `0`            La sortie vaut toujours la représentation binaire de `0`
   `1`            La sortie vaut toujours la représentation binaire de `1`
   `-1`           La sortie vaut toujours la représentation binaire de `-1`
   `x`            La sortie est égale à l'entrée `x`
   `y`            La sortie est égale à l'entrée `y`
   `NOT(x)`       La sortie est égale à l'entrée `x` inversée
   `NOT(y)`       La sortie est égale à l'entrée `y` inversée
   opposé(x)      La sortie est égale à l'opposé de l'entrée `x`
   opposé(y)      La sortie est égale à l'opposé de l'entrée `y` 
   incrément(x)   La sortie vaut :math:`x+1`
   incrément(y)   La sortie vaut :math:`y+1`
   décrément(x)   La sortie vaut :math:`x-1`
   décrément(y)   La sortie vaut :math:`y-1`
   addition       La sortie vaut :math:`x+y`
   soustraction   La sortie vaut :math:`x-y`
   soustraction   La sortie vaut :math:`y-x`
   `AND`          La sortie vaut `AND(x,y)`
   `OR`           La sortie vaut `OR(x,y)`
   =============  ===========

Certaines ALUs vont plus loin et supportent d'autres opérations, mais supporter toutes ces opérations va déjà nécessiter un peu de travail dans le cadre de notre deuxième projet. Nous avons déjà vu comment effectuer quasiment chacune de ces opérations en utilisant des fonctions booléennes. Pour les combiner dans un seul circuit, il suffira d'utiliser des multiplexeurs et de choisir des signaux permettant de les contrôler. L'ALU du livre de référence utilise six signaux de contrôle :

 - `zx` : l'entrée `x` est mise à `0`
 - `zy` : l'entrée `y` est mise à `0`
 - `nx` : l'entrée `x` est inversée
 - `ny` : l'entrée `y` est inversée
 - `f`: permet de choisir entre le résultat de l'additionneur (`1`) et de la fonction `AND` pour la sortie
 - `no` : permet d'inverser ou non le résultat

Outre le résultat qui est encodé sur 16 bits, l'ALU retourne également deux drapeaux:

 - `zr` qui est mis à `1` si le résultat de l'ALU vaut zéro et `0` sinon
 - `ng` qui est mis à `1` si le résultat de l'ALU est négatif et `0` sinon


   
.. _fig-alu:
.. tikz:: Unité Arithmétique et Logique (ALU)
   :libs: positioning 

   \fill[gray] (0,0) -- (4,0) -- (5, 1) -- (5,5) -- (4,6) -- (0,6) -- (1,5) -- (1,1) -- cycle;
   \node at (-2,2) (x) {x};
   \node at (-2,4) (y) {y};
   \node at (7,3) (out) {out};
   \node at (2,6) (zrALU) {};
   \node at (3,6) (ngALU) {};

   
   \node at (1,2) (xALU) {};
   \node at (1,4) (yALU) {};
   \node at (5,3) (outALU) {};
   \node at (2,8) (zr) {zr};
   \node at (3,8) (ng) {ng};
   
   \node at (1,0) (zxALU) {};
   \node at (1.5,0) (nxALU) {};
   \node at (2,0) (zyALU) {}; 
   \node at (2.5,0) (nyALU) {};
   \node at (3,0) (fALU) {};
   \node at (3.5,0) (noALU) {};

   
   \node at (1,-2) (zx) {zx};
   \node at (1.5,-2) (nx) {nx};
   \node at (2,-2) (zy) {zy}; 
   \node at (2.5,-2) (ny) {ny};
   \node at (3,-2) (f) {f};
   \node at (3.5,-2) (nop) {no};
   \node at (3,3) (alu) {ALU};

   
   \draw[->] (zx) -- (zxALU) {};
   \draw[->] (nx) -- (nxALU) {};
   \draw[->] (zy) -- (zyALU) {};
   \draw[->] (ny) -- (nyALU) {};
   \draw[->] (f) -- (fALU) {};
   \draw[->] (nop) -- (noALU) {};
   
      
   \draw[->] (x) -- (xALU) node[midway, below] {16 bits};
   \draw[->] (y) -- (yALU) node [midway, below] {16 bits};
   \draw[->] (outALU) -- (out) node [midway, below] {16 bits};
   \draw[->] (zrALU) -- (zr) {};
   \draw[->] (ngALU) -- (ng) {};



   
.. inf https://tex.stackexchange.com/questions/372745/advice-on-latex2e-diagram-possibly-using-tikz dessin de processeur
   
Les drapeaux `zr` et `ng` méritent un peu d'explication. Sur base de la représentation des nombres entiers, il est facile de vérifier si la représentation binaire d'un nombre entier vaut `0`. Il suffit de vérifier que tous ses bits valent `0`.  Pour calculer la valeur de `ng`, c'est encore plus simple, il suffit de retourner la valeur du bit de poids fort du résultat puisqu'en notation complément à 2, celui-ci vaut `1` pour tous les entiers négatifs.  

Les signaux de contrôle ont chacun une signification particulière.

 - lorsque le signal `zx` est mis à `1`, l'entrée `x` est remplacée par la valeur `0`
 - lorsque le signal `zy` est mis à `1`, l'entrée `y` est remplacée par la valeur `0`
 - lorsque le signal `nx` est mis à `1`, alors l'entrée `x` est inversée (opération `NOT`) avant d'être utilisée
 - lorsque le signal `ny` est mis à `1`, alors l'entrée `y` est inversée (opération `NOT`) avant d'être utilisée
 - lorsque le signal `no` est mis à `1`, alors la sortie `out` est inversée (opération `NOT`) après l'exécution de l'opération demandée

Ces signaux de contrôle sont connectés à des multiplexeurs qui permettent de choisir entre un signal, l'inverse de ce signal ou la constante `0`.

Enfin, le signal de contrôle `f` permet de connecter soit le résultat de l'additionneur ou soit celui d'une fonction `AND` à la sortie.

Les éléments principaux de l'ALU sont donc des inverseurs, la constante `0`, des multiplexeurs, un additionneur 16 bits et une fonction `AND` à 16 bits.

La construction complète de cette ALU nécessite l'utilisation de quelques astuces et propriétés de la représentation binaire des nombres entiers. Le livre suggère d'utiliser les signaux de contrôle d'une façon particulière.

Pour calculer `0`, il faut mettre `zx`, `zy` et `f` à `1`. Cela revient donc à calculer l'opération :math:`0+0`.

Pour calculer `1`, il faut mettre tous les signaux de contrôle`(`zx`, `zy`, `nx`, `ny`, `f` et `no` à `1`). Voyez-vous pourquoi cette addition suivie d'une inversion donne bien comme résultat la valeur `1` ?

Pour calculer `-1`, il faut mettre cinq signaux de contrôle (`zx`, `zy`, `nx`, et `f`) à `1`. Les signaux `ny` et `no` sont mis à `0`. En mettant `zx` et `nx` à `1`, l'entrée `x` de l'ALU contient la valeur `-1`. Comme `zy` est mis à `1`, l'ALU calcule :math:`-1+0`. On aurait pu obtenir le même résultat avec d'autres valeurs des signaux de contrôle. Lesquels ?

Pour retourner `x` comme sortie, il faut mettre `zy` à `1`. On calcule donc le résultat de :math:`x+0`.

Pour retourner `y` comme sortie, il faut mettre `zx` à `1`. On calcule donc le résultat de :math:`0+y`.

Pour calculer `NOT(x)`, il y a deux approches possibles. La première est de mettre `zy` à `1` et `nx` à `1`. La seconde est de mettre uniquement `zy` et `nx` à `1`. Dans le premier cas, on calcule :math:`x+0` et on inverse le résultat. Dans le second cas, on calcule :math:`NOT(x)+0`. On peut raisonner de façon similaire pour le calcul de `NOT(y)`.

Pour calculer `-x`, le livre suggère de mettre quatre signaux à `1`: `zy`, `ny`, `f` et `no`. Cela revient à calculer l'opération :math:`NOT(ADD(x,11..11))`. Regardons avec des nombres encodés sur trois bits le résultat de cette opération.

== == == ========== ===============
x2 x1 x0 ADD(x,111) NOT(ADD(x,111))
-- -- -- ---------- ---------------
0  0  0  0 1 1 1      0 0 0        
0  0  1  1 0 0 0      1 1 1       
0  1  0  1 0 0 1      1 1 0
0  1  1  1 0 1 0      1 0 1        
1  0  0  1 0 1 1      1 0 0         << pas d'opposé
1  0  1  1 1 0 0      0 1 1
1  1  0  1 1 0 1      0 1 0
1  1  1  1 1 1 0      0 0 1
== == == ========== ===============

On obtient bien le résultat attendu.


Pour calculer :math:`x-1`, les signaux `zy` et `ny` et `f` sont mis à `1`. Le circuit calcule donc `ADD(x,11..11)` ce qui correspond bien à `x-1`. De même, on peut calculer :math:`y-1`.

Pour calculer `x+1`, seul `zx` est mis à zéro, tous les autres signaux de contrôle sont mis à `1`. Le circuit calcule donc `NOT(ADD(NOT(x),11...11))`.  Regardons avec des nombres de trois bits le résultat de cette opération.

== == == ====== ================ ==========  ============
x2 x1 x0 NOT(x) ADD(NOT(x),111))  NOT(...)   Commentaire
-- -- -- ------ ---------------- ----------  ------------
0  0  0  1 1 1  1 1 1 0          0 0 1       << 0+1=1
0  0  1  1 1 0  1 1 0 1          0 1 0       << 1+1=2
0  1  0  1 0 1  1 1 0 0          0 1 1       << 2+1=3
0  1  1  1 0 0  1 0 1 1          1 0 0       << 3+1=4
1  0  0  0 1 1  1 0 1 0          1 0 1       << -4+1=-3
1  0  1  0 1 0  1 0 0 1          1 1 0       << -3+1=-2
1  1  0  0 0 1  1 0 0 0          1 1 1       << -2+1=-1
1  1  1  0 0 0  0 1 1 1          0 0 0       << -1+1=0
== == == ====== ================ ==========  ============

Pour la même raison, pour calculer `y+1`, seul `zy` est mis à zéro, tous les autres signaux de contrôle sont mis à `1`.

Pour calculer `x+y`, seul `f` doit être mis à `1`. Pour calculer `x-y`, `nx`, `f` et `no` sont mis à `1`. On doit donc calculer `NOT(ADD(NOT(x),y))`. Vous pouvez vous en convaincre en reconstruisant la table de vérité. De même pour calculer `y-x`, seuls les signaux `no`, `f` et `ny` sont mis à `1`.

Enfin, pour implémenter l'opération `OR` en utilisant l'ALU, on se souviendra des lois de De Morgan et il suffira de mettre les signaux `nx`, `ny` et `no` à `1`. Pour calculer `AND(x,y)`, tous les signaux de contrôle sont mis à `0`.


   
Compléments d'arithmétique
==========================

Avant d'aborder d'autres opérations arithmétiques que l'addition et la soustraction, il est intéressant de voir comment python supportent les nombres en notation binaire. Python supporte à la fois les conversions de décimal en binaire et vice-versa ainsi que les fonctions booléennes.

En python, on peut facilement entrer un nombre en représentation binaire en le préfixant par `0b` et l'inverse avec la fonction `bin` comme dans l'exemple ci-dessous.

.. code-block:: python

   a=0b00100111
   print(a)   # affiche 39
   print(bin(39)) # affiche 0b100111

Le langage python supporte également les opérations booléennes bit à bit. Les principales sont listées ci-dessous:

   - En python `AND(a,b)` s'écrit ``a & b``
   - En python `OR(a,b)` s'écrit ``a | b``
   - En python `NOT(a)` s'écrit ``~ a``
   - En python `XOR(a,b)` s'écrit ``a ^ b``

Il est aussi possible de demander à python d'effectuer des décalages à gauche et à droite. Ainsi, ``x << p`` décale la représentation binaire de ``x`` de `p` positions vers la gauche. De la même façon, ``y >> p`` décale la représentation binaire de ``y`` de `p` positions vers la droite.    

Ces notations nous seront utiles pour présenter certains algorithmes dont ceux de la multiplication et de la division.

Multiplication des naturels
---------------------------

Dans le chapitre précédent, nous avons vu les opérations de base qui sont l'addition et la soustraction. Pour supporter la multiplication, nous pourrions construire une table de vérité et utiliser des portes `AND`, `OR` et `NOT`. Malheureusement, ce serait assez fastidieux pour supporter une multiplication sur 32 bits. Nous allons travailler comme pour l'addition, c'est-à-dire essayer de séparer la multiplication en une suite de calculs simples. Pour l'addition, nous avions pu travailler sur des opérations sur un bit. Malheureusement nous ne pourrons pas faire de même pour la multiplication. Par contre, il est assez facile de se rendre compte qu'une multiplication est une série d'additions. Comme nous savons déjà comment construire ces additions, nous allons pouvoir nous appuyer sur elles pour construire des circuits permettant de multiplier deux nombres entiers.

L'opération de multiplication :math:`a \times b` prend deux arguments. Le premier, :math:`a` est appelé le multiplicande. Le second, :math:`b` est appelé le multiplicateur. Le résultat de la multiplication est appelé le produit. La multiplication se définit sur base de l'addition :

    :math:`a \times b = \overbrace{b + b + ... + b}^{a~fois}`

La multiplication et la division étant des opérations complexes, le livre de référence a choisi des les supporter par du logiciel. Il est intéressant de construire ces algorithmes simples en python de façon à bien comprendre comment ces opérations sont réalisées. Les ordinateurs modernes contiennent bien entendu des circuits électroniques qui implémentent ces opérations arithmétiques de façon efficace.
       

Pour l'opération de multiplication, un point important à prendre en compte est que la multiplication de deux nombres encodés sur `n` bits retourne un nombre qui peut nécessiter jusqu'à :math:`2 \times n` bits. Pour s'en convaincre, il suffit de considérer les naturels encodés sur 8 bits. Le carré du plus grand de ces naturels, :math:`11111111` (255 en décimal), vaut :math:`65025` dont la représentation binaire est :math:`1111111000000001`.Lorsque l'on calcule :math:`A_{n-1}A_{n-2}...A_{2}A_{1}A_{0} \times B_{m-1}B_{m-2}...B_{2}B_{1}A_{0}`, le résultat est stocké sur :math:`m+n` bits.


Avant d'aborder la multiplication en général, il est intéressant de considérer la multiplication par une puissance de 10. En notation décimale, pour multiplier le nombre :math:`C_{n-1}C_{n-2}...C_{2}C_{1}C_{0}` par :math:`10^{k}`, il suffit d'insérer k fois le chiffre `0` à droite du nombre de façon à obtenir  :math:`C_{n-1}C_{n-2}...C_{2}C_{1}C_{0}\overbrace{0..0}^{k~fois}`.

Avant d'aborder la multiplication binaire, regardons le cas particulier de la multiplication d'un nombre par 2. Si :math:`B_{n}B_{n-1}..B_{2}B_{1}B_{0}` est un naturel en notation binaire, alors on peut facilement calculer le double de ce naturel en décalant tous les bits d'une position vers la gauche. Mathématiquement, on pourrait écrire que :math:`2 \times B_{n}B_{n-1}..B_{2}B_{1}B_{0} = B_{n}B_{n-1}..B_{2}B_{1}B_{0}0`. Cette relation est correcte et peut s'étendre à toute puissance positive de `2`. Ainsi, :math:`2^{k} \times B_{n-1}B_{n-2}..B_{2}B_{1}B_{0} = B_{n-1}B_{n-2}..B_{2}B_{1}B_{0}\overbrace{00..0}^{k}`.


.. note:: Les décalages sont plus rapides que les multiplications
   
   Les opérations de décalage beaucoup plus rapide que la multiplication entière, mais il faut les utiliser correctement. Lorsque l'on manipule des nombres stockés sur un nombre fixe de bits, il faut être attentif à deux points. Tout d'abord, le résultat de la multiplication doit pouvoir être stocké sur le même nombre de bits que l'opérande. Ainsi, si l'on travaille en représentant des naturels sur 8 bits, alors on peut calculer :math:`2 \times 37` en décalant `00100101` vers la gauche, ce qui donne :math:`01001010`. Par contre, le décalage de `00100101`  de trois positions vers la gauche donne comme résultat :math:`00101000`, c'est-à-dire :math:`40` en notation décimale.

   Le deuxième problème est que cette technique ne fonctionne pas avec tous les entiers signés. Considérons cette fois les quartets. Le quartet `1011` représente la valeur :math:`-5` en notation décimale. Si on décale ce quartet d'une position vers la gauche, on obtient `0110` qui correspond à la valeur positive :math:`6`. Les décalages sont donc à utiliser avec précautions. 


Sur base de la définition de la multiplication comme une séquence d'additions, on pourrait utiliser un algorithme simple comme celui qui est présenté ci-dessous.

.. _mult-simple-python: 
.. literalinclude:: python/mult-simple.py 
   :start-after: #begin 
   :end-before: #end 
   :language: python             

Cet algorithme est inefficace lorsque le multiplicateur est grand. Son temps d'exécution augmente avec le multiplicateur. Comme la multiplication est commutative, on pourrait l'accélérer en comparant les deux facteurs à multiplier comme dans le code ci-dessous.

.. _mult-simple2-python: 
.. literalinclude:: python/mult-simple2.py 
   :start-after: #begin 
   :end-before: #end 
   :language: python             

	      
Cette approche reste inefficace. Essayons de l'améliorer. Prenons comme exemple la multiplication :math:`123 \times 456` en notation décimale. Celle-ci peut également s'écrire :math:`123 \times ( 6 \times 10^{0} + 5 \times 10^{1} + 4 \times 10^{2})`. Pour simplifier la discussion, considérons le cas simple où le multiplicande, bien qu'étant en notation décimale, ne contient que des chiffres `1` et `0`.

Lorsque l'on calcule :math:`123 \times 101`, on calcule en fait :math:`123 \times ( 1 \times 10^{0} + 0 \times 10^{1} + 1 \times 10^{2})`. En distribuant, on obtient :math:`123 \times 1 \times 10^{0} + 123 \times 0 \times 10^{1} + 123 \times 1 \times 10^{2}`. Cette séquence d'additions peut se représenter graphiquement comme dans :numref:`mult-dec`. Cette représentation nous permet d'insister sur deux points importants de la réalisation de cette multiplication "en calcul écrit". Premièrement, à chaque étape on multiplie le multiplicande par un chiffre du multiplicateur. Deuxièmement, multiplier le multiplicande par une puissance de dix revient à le décaler vers la gauche.

.. _mult-dec:    
.. tikz:: Une multiplication en notation décimale

   \node (calc) [text width=5cm, align=right] {\\
   \texttt{\hfill\textcolor{blue}{123}\\
   \hfill\underline{*~101}\\
   \hfill\textcolor{green}{000}\textcolor{blue}{123}\\
   \hfill\textcolor{green}{00}\textcolor{blue}{000}\textcolor{red}{0}\\
   \underline{+~~\textcolor{green}{0}\textcolor{blue}{123}\textcolor{red}{00}}\\
    \hfill\emph{012423}}}; 


Prenons un second exemple en notation binaire avec deux naturels sur 4 bits: :math:`11` en notation décimale dont la représentation binaire est :math:`1011` et  :math:`10` dont la représentation binaire est :math:`1010`. Leur produit vaut :math:`110` en notation décimale. Lorsque l'on multiplie ces deux quartets, on obtient un résultat qui est stocké sur un octet. Le résultat est obtenu par une succession d'additions sur 8 bits. Il s'obtient en utilisant un algorithme qui fonctionne comme suit:

 0. Initialisation. Le résultat est initialisé à :math:`0`.
 1. Etape 0. L'algorithme examine le bit de poids faible du multiplicateur (:math:`B_0`). Celui-ci valant zéro, on ajoute la valeur :math:`0 \times 2^{0} \times 00001011 = 00000000` au résultat intermédiaire.
 2. Etape 1. L'algorithme examine le bit :math:`B_1` du multiplicateur. Celui valant `1`, nous devons ajouter au résultat intermédiaire la valeur :math:`1 \times 2^{1} \times 00001011`. En notation binaire, les multiplications par une puissance de deux se réalisent facilement via un décalage vers la gauche. Dans ce cas, :math:`2^{1} \times 00001011 = 00010110`. Le résultat intermédiaire vaut maintenant :math:`00010110`.
 3. Etape 2. L'algorithme examine le bit :math:`B_2` du multiplicateur. Celui-ci valant zéro, on ajoute la valeur :math:`0 \times 2^{2} \times 00001011 = 00000000` au résultat intermédiaire.
 4. Etape 3. L'algorithme examine le bit de poids fort (:math:`B_3`) du multiplicateur. Celui valant `1`, nous devons ajouter au résultat intermédiaire la valeur :math:`1 \times 2^{3} \times 00001011` soit :math:`01011000`. Le résultat intermédiaire vaut maintenant :math:`01101110`. C'est le résultat final.    


:numref:`mult-bin` présente la succession d'additions de façon plus lisible.

.. _mult-bin:    
.. tikz:: Une multiplication en notation binaire

   \node (calc) [text width=5cm, align=right] {\\
   \texttt{\hfill\textcolor{blue}{1011}\\
   \hfill\underline{*~1010}\\
   \hfill\textcolor{green}{0000}\textcolor{blue}{0000}\\
   \hfill\textcolor{green}{000}\textcolor{blue}{1011}\textcolor{red}{0}\\
   \hfill\textcolor{green}{00}\textcolor{blue}{0000}\textcolor{red}{00}\\
   \underline{+~~\textcolor{green}{0}\textcolor{blue}{1011}\textcolor{red}{000}}\\
   \hfill\emph{01101110}}}; 
    

Pour implémenter cette addition dans un programme python, nous pouvons utiliser le principe décrit ci-dessus avec trois variables :

 - le multiplicande
 - le multiplicateur
 - le produit intermédiaire

Pour multiplier le multiplicateur à chaque étape, il suffit de le décaler d'un bit vers la gauche. De la même façon, pour pouvoir tester successivement les différents bits du multiplicande, il suffit de le décaler d'un bit vers la droite à chaque étape. Le programme ci-dessous présente cet algorithme en python.

.. _mult-python: 
.. literalinclude:: python/mult.py 
   :start-after: #begin 
   :end-before: #end 
   :language: python             
   
    
Cet algorithme est beaucoup plus efficace que notre première solution naïve. Le nombre d'additions qui sont calculées dépend uniquement du nombre de bits utilisés pour représenter chacun des nombres à additionner. Sur un ordinateur, ce nombre de bits est une constante.

Il est facile d'étendre cet algorithme pour supporter les entiers positifs et négatifs. Le plus simple est de d'abord déterminer le signe du résultat et ensuite d'utiliser l'algorithme ci-dessous pour multiplier les valeurs absolues des nombres. Pour rappel, la multiplication de deux nombres de même signe donne un résultat positif tandis que le résultat est négatif si ils sont de signes opposés.

Exercices
_________

1. En utilisant l'algorithme ci-dessus, calculez :math:`7*9`.

2. En utilisant l'algorithme ci-dessus, calculez :math:`(-4)*(-5)`.

2. En utilisant l'algorithme ci-dessus, calculez :math:`(-8)*(11)`.   
   

.. multiplication

.. points d'attention, dépassement de capacité

   
.. pas d'overflow pour les entiers en python car ils sont sotckés sur un nombre variable de bits https://mortada.net/can-integer-operations-overflow-in-python.html. Dans d'autres langages comme C ou Java le problème se poste
   

.. note:: Représentation des entiers en python

   Les ordinateurs utilisent un nombre fixe de bits pour stocker les entiers. En notation en complément à deux, le plus grand nombre positif que l'on peut stocker sur 32 bits est :math:`2^{31}-1`, soit 2147483641. Si une opération arithmétique retourne une résultat qui est supérieur à 2147483641, celui-ci ne pourra plus être stocké sur 32 bits. La plupart des processeurs indiquent alors un problème de dépassement de capacité qui peut être traité par le logiciel qui réalise le calcul. Si ce dépassement n'est pas traité, le calcul sera erroné.

   Le langage python ne souffre pas de ce problème car ce langage utilise un nombre variable de bits pour stocker les nombres entiers. Il ajuste le nombre de bits nécessaire en fonction du nombre à stocker. On peut observer ce comportement en utilisant la fonction `sys.getsizeof <https://docs.python.org/3/library/sys.html#sys.getsizeof>`_ du module `sys <https://docs.python.org/3/library/sys.html>`_. Cette fonction retourne la zone mémoire occupée par un type primitif ou un objet en python.

   Grâce à cette fonction, on peut observer qu'un programme python utilise `28` octets pour stocker un entier mais que la zone mémoire nécessaire augmente avec la valeur de cet entier. Au-delà de :math:`2^{30}`, un entier occupe 32 bytes en python et la représentation du nombre :math:`2^{900}` nécessite `148` octets en mémoire (bytes = octets).

   Cette adaptation dynamique de la taille des entiers dans python permet de réaliser des calculs exacts avec les nombres entiers, quel que soit le nombre considéré. Tous les langages de programmation ne sont pas aussi précis. Vous verrez l'an prochain qu'en :index:`Java` et en :index:`C` par exemple les entiers sont stockés sur un nombre fixe de bits, ce qui vous posera différents problèmes liés à des dépassements de capacité.


Division euclidienne
--------------------
   
.. division euclidienne entière
   calcul du reste

La quatrième opération arithmétique de base sur les naturels est la division euclidienne. Cette division prend deux arguments : un `dividende` et un `diviseur`. Elle retourne deux entiers : un quotient et un reste. Formellement, la relation entre ces trois entiers est: :math:`dividende = diviseur \times quotient + reste`. Nous nous concentrerons sur la division euclidienne appliquée aux naturels même si elle peut évidemment s'appliquer aux entiers positifs et négatifs.


.. note:: Division entière en python 
        
   Le langage python permet de réaliser les divisions entières de différentes façons. Si les variable ``x`` et ``y`` contiennent des nombres entiers, alors ``x / y`` et ``x // y`` (depuis python 3.5) retournent le quotient de la division euclidienne. Le reste de la division euclidienne s'obtient en utilisant l'expression ``x % y``. Il est aussi possible d'utiliser la fonction `divmod(a,b) <https://docs.python.org/3/library/functions.html#divmod>`_ qui retourne le quotient et le reste de la division entière entre ``a`` et ``b``. 




Avant d'aborder cette division euclidienne, il est intéressant de discuter le cas particulier de la division par deux ou par une puissance de 2. En représentation binaire, la division par deux d'un naturel revient à décaler sa représentation binaire d'une position vers la droite. A titre d'exemple, considérons le quartet :math:`0110` qui représente le nombre `6` en notation décimale. Lorsque l'on décale ce quartet d'une position vers la droite, on obtient la séquence :math:`0011` qui est bien la représentation binaire de `3`. Ce décalage vers la droite fonctionne également pour les puissances de deux. Ainsi, pour obtenir le quotient de la division du nombre décimal `109` représenté par l'octet :math:`01101101` par :math:`2^3`, il suffit de décaler la séquence de bits de trois positions vers la droite. Ce décalage donne :math:`00001101` qui est bien la représentation de `13`.

.. note:: Division rapide d'un entier par une puissance de deux

   Le décalage fonctionne pour les naturels, mais pas pour les entiers en notation en complément à deux. Pour s'en rendre compte, considérons la valeur `-5` dont la représentation binaire est :math:`11111011`. Si on décale cette représentation binaire de deux positions vers la droite, on obtient :math:`00111110` qui est la représentation binaire du nombre :math:`+62`...

   On pourrait imaginer de résoudre ce problème en insérant des bits de poids fort avec la valeur `1` plutôt que `0`. Dans notre exemple, cela donnerait la séquence binaire :math:`11111110` qui correspond à la valeur :math:`-2`. C'est plus proche de la valeur attendue mais malheureusement incorrect. Soyez prudents lorsque vous utilisez des décalages pour remplacer des multiplications ou des divisions.


Pour illustrer la division euclidienne, considérons l'opération :math:`1011 / 10` en notation décimale. Lorsque l'on réalise cette division en calcul écrit, on réalise en fait une suite de soustractions. Analysons ce calcul étape par étape. Chaque étape nous permet d'obtenir un chiffre du quotient. Le calcul démarre en initialisant le reste à la valeur du dividende. Nous allons d'abord déterminer la valeur du chiffre des centaines du quotient, :math:`Q_2`. Pour cela, nous essayons de soustraire :math:`1 \times 10^{2} \times diviseur` du reste (:numref:`div-dec1`). Comme son résultat est positif et vaut `11`, le chiffre des centaines du quotient est connu et il vaut `1`. Le reste est mis à jour à la valeur `11`.

.. _div-dec1:    
.. tikz:: Première étape de la division décimale
          
   \node (calc) [text width=5cm, align=right] {\\
   \texttt{\hfill\textcolor{blue}{1011}\\
   \hfill\underline{-~~10\textcolor{red}{00}}}\\
   \texttt{11}};

   \node (q) [text width=5cm, align=right, right =of calc] {$Q_{2}=1$\\ reste = \texttt{011}};

  
   
L'étape suivante est de déterminer le chiffre des dizaines du quotient. Pour cela, nous essayons de soustraire :math:`1 \times 10^{1} \times diviseur` du reste (:numref:`div-dec2`). Le résultat étant négatif, le chiffre des dizaines du quotient doit valoir `0`.
   
.. _div-dec2:    
.. tikz:: Deuxième étape de la division décimale
   :libs: positioning
             
   \node (calc) [text width=5cm, align=right] {\\
   \texttt{\hfill\textcolor{blue}{011}\\
   \hfill\underline{-~~\textcolor{green}{0}10\textcolor{red}{0}}}\\
   \emph{négatif} };

   \node (q) [text width=5cm, align=right, right =of calc] {$Q_{1}=0$\\ reste = \texttt{011}};



   
Nous pouvons maintenant réaliser la troisième soustraction pour déterminer le chiffre des unités du quotient. Pour cela, nous essayons de soustraire :math:`1 \times 10^{0} \times diviseur` du reste (:numref:`div-dec3`). Ce résultat est positif, le chiffre des unités du quotient vaut donc `1` et le reste de notre division également.


.. _div-dec3:    
.. tikz:: Première étape de la division décimale
          
   \node (calc) [text width=5cm, align=right] {\\
   \texttt{\hfill\textcolor{blue}{011}\\
   \hfill\underline{-~~10}}\\
   \texttt{1}};

   \node (q) [text width=5cm, align=right, right =of calc] {$Q_{0}=1$\\ reste = \texttt{1}};
   
   
Essayons maintenant de transposer cette méthode au calcul des divisions binaires. Pour cela, considérons la division entière de :math:`46` par :math:`5`. Cette division euclidienne retourne comme quotient la valeur :math:`9` avec un reste de :math:`1`. 


A chaque étape, on va déterminer la valeur d'un bit du quotient en commençant par le bit de poids fort. La première étape est d'essayer de soustraire :math:`2^{4} \times diviseur` du dividende. En notation binaire, cette valeur s'obtient facilement en décalant le diviseur de 4 positions vers la gauche. La soustraction réalisée dans la :numref:`div-bin1` retourne un résultat négatif. Cela indique que le bit :math:`Q_4` du quotient doit valoir `0`.

   
.. _div-bin1:    
.. tikz:: Première étape de la division binaire
          
   \node (calc) [text width=5cm, align=right] {\\
   \texttt{\hfill\textcolor{blue}{00101110}\\
   \hfill\underline{-~~0101\textcolor{red}{0000}}}\\
   \emph{négatif}};

   \node (q) [text width=5cm, align=right, right =of calc] {$Q_{4}=0$};

La deuxième étape (:numref:`div-bin2`) nous permet de déterminer la valeur du bit :math:`Q_3` de notre quotient. Celui-ci vaudra `1` si en soustrayant :math:`2^{3} \times diviseur` on obtient un résultat positif. C'est le cas. Le bit :math:`Q_3` est donc mis à la valeur `1` et le reste prend la valeur du résultat.
   
.. _div-bin2:    
.. tikz:: Deuxième étape de la division binaire
   :libs: positioning
             
   \node (calc) [text width=5cm, align=right] {\\
   \texttt{\hfill\textcolor{blue}{00101110}\\
   \hfill\underline{-~~\textcolor{green}{0}0101\textcolor{red}{000}}}\\
   \texttt{00000110} };

   \node (q) [text width=5cm, align=right, right =of calc] {$Q_{3}=1$\\ reste = \texttt{00000110}};

   
La troisième étape nous permet de déterminer la valeur du bit :math:`Q_2` du quotient. Pour cela, on essaye de soustraire :math:`2^{2} \times diviseur` de notre dividende intermédiaire. Le résultat de cette soustraction est négatif (:numref:`div-bin3`) et :math:`Q_2` prend donc la valeur zéro.

.. _div-bin3:    
.. tikz:: Troisième étape de la division binaire
          
   \node (calc) [text width=5cm, align=right] {\\
   \texttt{\hfill\textcolor{blue}{00000110}\\
   \hfill\underline{-~~\textcolor{green}{00}0101\textcolor{red}{00}}}\\
   \emph{négatif} };

   \node (q) [right= of calc] {$Q_{2}=0$};

La troisième étape nous permet de déterminer la valeur du bit :math:`Q_1` du quotient. Pour cela, on essaye de soustraire :math:`2^{1} \times diviseur` de notre dividende intermédiaire. Le résultat de cette soustraction est négatif (:numref:`div-bin4`) et :math:`Q_2` prend donc la valeur zéro.
   
.. _div-bin4:    
.. tikz:: Quatrième étape de la division binaire
          
   \node (calc) [text width=5cm, align=right] {\\
   \texttt{\hfill\textcolor{blue}{00000110}\\
   \hfill\underline{-~~\textcolor{green}{000}0101\textcolor{red}{0}}}\\
   \emph{négatif} }; 

   \node (q) [right= of calc] {$Q_{1}=0$};

   
La dernière étape (:numref:`div-bin5`) nous permet de déterminer la valeur du bit :math:`Q_0` de notre quotient. Celui-ci vaudra `1` si en soustrayant :math:`2^{0} \times diviseur` du dividende intermédiaire on obtient un résultat positif. C'est le cas. Le bit :math:`Q_0` est donc mis à la valeur `1` et le dividende intermédiaire prend la valeur du reste de notre calcul.

.. _div-bin5:    
.. tikz:: Dernière étape de la division binaire
   :libs: positioning       
          
   \node (calc) [text width=5cm, align=right] {\\
   \texttt{\hfill\textcolor{blue}{00000110}\\
   \hfill\underline{-~~\textcolor{green}{0000}0101}}\\
   \texttt{00000001}}; 

   \node (q) [text width=5cm, align=right, right= of calc] {$Q_{0}=1$ \\ Reste=\texttt{00000001}};

   

Le résultat final de notre division en binaire est donc :

 - :math:`quotient=01001`
 - :math:`reste=0001`

Cette procédure peut également s'écrire en :index:`python` comme nous l'avons fait pour la multiplication. Une version de cet algorithme permettant de diviser un naturel représenté sur 8 bits par un naturel représenté sur quatre bits est repris dans le code ci-dessous. Cet algorithme peut être étendu pour supporter des nombres encodés sur un plus grand nombre de bits.


.. literalinclude:: python/div.py 
   :start-after: #begin 
   :end-before: #end 
   :language: python             


La plupart des ordinateurs utilisent des circuits logiques pour calculer efficacement les divisions euclidiennes. Ces circuits permettent de diviser des entiers, positifs et négatifs. Le fonctionnement de ces circuits sort du cadre de ce cours d'introduction. 

.. note:: Division par zéro en python

   La division euclidienne n'est pas définie lorsque le diviseur vaut zéro. Pourtant, il peut arriver que l'utilisateur demande par inadvertance de réaliser une division par zéro. Dans la plupart des langages de programmation, une telle division par zéro provoque une :index:`exception`. Cette exception correspond à un signal généré par le matériel pour avertir d'une erreur lors de l'exécution d'un programme. Ce signal est intercepté par le :index:`système d'exploitation`. Un système d'exploitation est un logiciel spécialisé qui contrôle les interactions entre les programmes qui s'exécutent sur l'ordinateur et le matériel. Parmi les systèmes d'exploitation les plus connus, on peut citer :index:`Microsoft Windows`, :index:`Linux`, :index:`MacOS`, ... Le système d'exploitation avertit ensuite le programme qui a tenté d'effectuer cette division par zéro. Par défaut, le système d'exploitation termine l'exécution du programme en erreur, mais il est possible dans certains langages de programmation de traiter ces erreurs de division par zéro. C'est le cas en :index:`python` via le mécanisme d'exceptions. Python définit l'exception ``ZeroDivisionError`` qui correspond exactement à ce cas de figure.

   .. code-block:: python
      :caption: Division par zéro en python
                
      a = ...
      b = ...
      try:
        a / b
      except ZeroDivisionError:
        print("Erreur")

   
Opérations sur les réels
------------------------
   
.. nombres en virgule flottante et opérations

Les entiers sont des nombres importants, mais ce ne sont pas les seuls types de nombres avec lesquels nous devons réaliser des opérations mathématiques. Les réels sont nettement plus importants dans de très nombreux domaines scientifiques. Les réels sont d'ailleurs les nombres que nous manipulons le plus fréquemment, que ce soit dans la vie de tous les jours pour représenter des montants en Euros ou pour réaliser des calculs scientifiques. Les constantes mathématiques importantes comme :math:`\pi` (3.141592653589793) ou :math:`e` (2.718281828459045) sont des réels.

Quasiment tous les ordinateurs construits depuis les années 1980s ont adopté la norme `IEEE 754 <https://fr.wikipedia.org/wiki/IEEE_754>`_ pour représenter les nombres réels et réaliser des opérations mathématiques sur ces nombres. Cette norme peut être vue comme la façon d'utiliser sur un ordinateur la notation scientifique à laquelle vous avez étés habituée durant vos études secondaires. Lorsque l'on doit représenter des réels très grands ou très petits, on exprime le réel sous la forme d'une mantisse et d'un exposant. La notation standard est :math:`\pm m \times 10^{p}` où :math:`m` est appelée la mantisse et doit être dans l'intervalle :math:`[1,10[` et :math:`p` est l'exposant. L'avantage de la notation scientifique est qu'elle permet de manipuler efficacement de grands et de petits nombres comme le nombre d'Avogadro, :math:`N_{A} = 6.02214076 \times 10^{23}` ou la masse de l'électron, :math:`9.109 \times 10^{-31}`. Formellement, il n'y a pas de représentation pour le nombre `0` en utilisant la notation scientifique, mais tout le monde utilise le chiffre `0` dans ce cas.

La norme IEEE 754 permet à l'ordinateur de représenter les réels en utilisant une notation binaire qui est inspirée de la notation scientifique. Cette représentation est souvent appelée la :index:`représentation en virgule flottante`. Dans cette représentation, tout nombre réel est de la forme :math:`(-1)^{s} 1.mmmm \times 2^{eeee}` où tant la mantisse (`mmm`) que l'exposant (`eeee`) sont en notation binaire.

Il est intéressant d'analyser plus en détails la représentation de la partie fractionnaire d'un nombre en binaire. Formellement, le nombre :math:`1.B_{(-1)}B_{(-2)}B_{(-3)}...B_{(-n)}` correspond à la valeur numérique :math:`(1 + B_{(-1)} \times 2^{-1} + B_{(-2)} \times 2^{-2} + B_{(-3)} \times 2^{-3} + ... B_{-n} \times 2^{-n})`. On peut donc aisément convertir en nombre binaire en notation fractionnaire en sa version décimal. Ainsi, :math:`1.1010` correspond au nombre décimal :math:`1 + 1 \times 2^{-1} + 0 \times 2^{-2} + 1 \times 2^{-3} + 0 \times 2^{-4} = 1.625`




Exercices
_________

1. Quel est le nombre réel qui correspond à :math:`1.0110` en notation binaire ?

    .. réponse 1 + 1/4 + 1/8

2. Si on utilise 4 bits pour représenter la partie fractionnaire du nombre :math:`1.B_{(-1)}B_{(-2)}B_{(-3)}B_{(-4)}`, quels sont le plus petit réel et le plus grand réel que l'on peut représenter ?

    .. réponse : 1
    .. réponse : 1 +1/2 + 1/4 + 1/8 + 1/16 = 1.9375       

3. Sans convertir les nombres :math:`A = 1.00110` et :math:`B = 1.010001`, quelle relation pouvez-vous identifier entre ces deux séquences de bits ?

    - :math:`A = B`
    - :math:`A \ne B`
    - :math:`A < B`
    - :math:`A > B`

   .. réponse A lt b
      
4. Quelle est la valeur décimale qui correspond au nombre binaire fractionnaire :math:`1.1111111111111111` ?

   .. réponse : environ 2 
      
   


La norme IEEE 754 définit deux représentations pour les réels :

 - la représentation en simple précision
 - la représentation en double précision


Ces deux représentations diffèrent au niveau de nombre de bits qui sont utilisés pour représenter l'exposant et la partie fractionnaire du nombre en virgule flottante. En simple précision, la partie fractionnaire est encodée sur 23 bits et l'exposant sur 8. En double précision, la partie fractionnaire est encodée sur 52 bits et l'exposant sur 11 bits. Dans les deux cas, un bit est utilisé pour indiquer si le nombre est positif ou négatif. Un nombre en simple précision occupe donc 32 bits tandis qu'un nombre en double précision occupe 64 bits.


Ces deux représentations utilisent quelques astuces dans l'encodage des nombres réels. La première astuce est que si tout nombre réel est exprimé sous la forme :math:`(-1)^{s} \times 1.mmmm \times 2^{eeee}`, alors il n'est pas nécessaire d'inclure le premier `1` dans la représentation binaire du nombre en virgule flottante. C'est une optimisation intéressante car elle libère un bit dans la représentation binaire de ces nombres. Cependant, il y a un nombre important que l'on ne peut pas représenter sous la forme :math:`(-1)^{s} 1.mmmm \times 2^{eeee}` : `zéro`. La norme IEEE 754 contourne cette difficulté en réservant la séquence de bits :math:`00000..00` pour représenter la valeur zéro.

La deuxième astuce est que le bit de poids fort de la représentation binaire contient le signe du nombre réel, `1` pour les nombres négatif et `0` pour les nombres positifs. Même si la notation en complément à deux ne contient pas de bit explicite de signe, tous les nombres entiers négatifs ont aussi leur bit de poids fort à `1`.

La troisième astuce concerne l'exposant. Pour faciliter le tri des nombres en virgule flottante sur base de leur séquence binaire, l'exposant est placé dans les bits de poids fort, juste après le bit de signe. Si l'exposant étant représenté en utilisant la notation en complément à deux, alors une séquence de bits commençant par :math:`0 11111111 ...` correspondrait à une valeur numériquement inférieure à :math:`0 00000001 ...` ce qui rendrait ces tris compliqués. La solution choisie par la notation IEEE 754 est d'encoder les exposants en utilisant un biais de 127 en simple précision (et de 1023 en double précision). Avec ce biais, l'exposant `-1` est encodé comme la séquence de bits `0111 1110` qui correspond à la valeur décimale `126`.   

La notation complète utilisée par la norme IEEE 754 est donc :math:`(-1)^{Signe} \times (1 + Fraction) \times 2^{Exposant-Biais}`.


.. tikz:: Notation IEEE 754 en simple précision
   :libs: positioning, arrows

      
          \draw (0cm,0cm) rectangle (0.5cm, 0.5cm);
          \draw (0.5cm,0cm) rectangle (2.5cm, 0.5cm);
          \draw (2.5cm,0cm) rectangle (5.5cm, 0.5cm);

          \node at (0.2cm,0.2cm) {s};
          \node at (1.5cm,0.2cm) {exposant};
          \node at (4.4cm,0.2cm) {fraction};
          
          \draw[thick,<->] (0cm,-0.2cm) -- node [below] {\small 1 bit} (0.5cm, -0.2cm);
          \draw[thick,<->] (0.5cm,-0.2cm) -- node [below] {\small 8 bits} (2.5cm, -0.2cm);
          \draw[thick,<->] (2.5cm,-0.2cm) -- node [below] {\small 23 bits} (5.5cm, -0.2cm);


.. tikz:: Notation IEEE 754 en double précision
   :libs: positioning, arrows

      
          \draw (0cm,0cm) rectangle (0.5cm, 0.5cm);
          \draw (0.5cm,0cm) rectangle (3.5cm, 0.5cm);
          \draw (3.5cm,0cm) rectangle (9.5cm, 0.5cm);

          \node at (0.2cm,0.2cm) {s};
          \node at (2.5cm,0.2cm) {exposant};
          \node at (6.4cm,0.2cm) {fraction};
          
          \draw[thick,<->] (0cm,-0.2cm) -- node [below] {\small 1 bit} (0.5cm, -0.2cm);
          \draw[thick,<->] (0.5cm,-0.2cm) -- node [below] {\small 11 bits} (3.5cm, -0.2cm);
          \draw[thick,<->] (3.5cm,-0.2cm) -- node [below] {\small 52 bits} (9.5cm, -0.2cm);
          

.. note:: Python et la norme IEEE 754

   Comme la plupart des langages de programmation, python supporte la norme IEEE 754. Par défaut, python utilise la notation en double précision pour tous les calculs avec des réels. La librairie python contient deux fonctions intéressantes qui permettent d'explorer la notation IEEE 754 :

    - `float.hex() <https://docs.python.org/3/library/stdtypes.html#float.hex>`_ permet de convertir un réel en notation hexadécimale sous la forme ``[sign] ['0x'] integer ['.' fraction] ['p' exponent]``
    - `float.fromhex() <https://docs.python.org/3/library/stdtypes.html#float.fromhex>`_  réalise la conversion inverse  

   Ces deux fonctions permettent d'explorer différents nombres réels en virgule flottante.

   .. code-block:: python

      print((0.0).hex())  # affiche 0x0.0p+0             
      print((4.0).hex())   # affiche 0x1.0000000000000p+2
      print((1.25).hex())  # affiche 0x1.4000000000000p+0
      print((1000000000.0).hex()) # affiche 0x1.dcd6500000000p+29
      print(float.fromhex('1.8p+0')) # affiche 1.5
      print(float.fromhex('1.fffffffffp+0')) # affiche 1.999999999985448
      


Exercices
_________

1. Quel est le plus petit nombre positif que l'on peut représenter en double précision ?

.. en double print(float.fromhex('-0.000000000001p-1023')) -4e-323
   
2. Quel est le plus petit nombre négatif que l'on peut représenter en double précision ?

.. double print(float.fromhex('-0.000000000001p+1023')) -3.193344495255552e+293

Lorsque l'on réalise des opérations mathématiques sur les nombres en virgule flottante, il se peut que le résultat soit trop grand ou trop petit pour être représenté en utilisant la notation IEEE 754. Dans ce cas, le circuit électronique va générer une :index:`exception` ou :index:`interruption`. Ce signal sera intercepté par la système d'exploitation qui avertira le programme du problème détecté.

Toutes les opérations arithmétiques peuvent être réalisées avec la notation en virgule flottante. Cependant, la notation en virgule flottante pose plusieurs problèmes qui sont liés au nombre de bits pour encoder la mantisse et l'exposant dont il est important d'être conscient. Afin de les illustrer, considérons d'abord une addition en utilisant la notation scientifique : :math:`9.998 \times 10^2 + 2.789 \times 10^{-1}`. Nous supposerons que notre représentation décimale nous permet uniquement de stocker 4 chiffres décimaux.

La première étape pour réaliser cette addition est de ramener les deux nombres à la même puissance de dix. Nous devons donc ramener :math:`2.789 \times 10^{-1}` sous la forme :math:`x \times 10^{2}`. Notre addition est donc :math:`9.998 \times 10^2 + 0.003 \times 10^{2}` où :math:`0.003 \times 10^{2}` est l'arrondi de :math:`2.789 \times 10^{-1}`. Cette opération a provoqué une première perte de précision.

Nous pouvons maintenant additionner les mantisses de nos deux nombres: :math:`9.998 + 0.003 = 10.001`. Le résultat de notre addition est :math:`10.001 \times 10^{2}`, soit :math:`1.0001 \times 10^{3}`. Malheureusement, ce résultat contient cinq chiffres décimaux alors que notre représentation ne permet qu'en stocker 4. Nous devons donc à nouveau arrondir la mantisse. Le résultat final de notre addition en virgule flottante :math:`9.998 \times 10^2 + 2.789 \times 10^{-1} = 1.000 \times 10^{3}`. Le résultat obtenu par ce calcul est à comparer au résultat exact: :math:`1000.0789`.

En pratique, l'ordinateur utilisera la représentation binaire des nombres pour réaliser les opérations mathématiques, mais des problèmes similaires vont se poser: la mantisse et l'exposant contiennent chacun un nombre finis de bits. A chaque étape d'un calcul, il faut potentiellement réaliser un arrondi pour que le résultat tienne dans la représentation en virgule flottante choisie. En simple précision, sachant que l'on utilise des nombres encodés sur 32 bits, on peut représenter au maximum :math:`2^{32} = 4294967296` réels différents. Vu la façon dont séquences de bits sont encodées, on remarque aisément que la moitié de ces nombres sont dans l'intervalle :math:`[-1,1]` et l'autre moitié sert à représenter des réels dont la valeur absolue est comprise entre :math:`1` et :math:`2^{127}`. Dans cet intervalle, nous ne pouvons représenter que :math:`2^{30}` réels différents parmi l'infinité de réels qui existent.  

Pour illustrer les imprécisions liées aux nombres en virgule flottante, il est intéressant de calculer les puissances de `3`. Si l'on calcule :math:`3^{33}` comme une multiplication d'entiers, on obtient :math:`5559060566555523` comme résultat. Le résultat est identique lorsque l'on calcule cette valeur avec une multiplication de réels: :math:`5559060566555523.0`. Par contre, si l'on multiplie ce dernier nombre par :math:`3.0`, on obtient :math:`1.6677181699666568e+16` comme résultat alors que la valeur exacte est :math:`16677181699666569`. Les erreurs relatives augmentent pour de plus grands nombres. Ainsi, :math:`3^{50}` vaut :math:`717897987691852588770249` lorsque le calcul est réalisé avec des entiers. En virgule flottante, le résultat obtenu est :math:`7.178979876918526e+23`. 

.. note:: Les opérations en virgule flottante ne sont pas toujours associatives

   En mathématique, vous avez l'habitude d'utiliser la propriété d'associativité qui implique que :math:`(a + b) + c = a + (b +c)`. Cette propriété est très pratique car elle vous permet de réaliser une opération arithmétique dans l'ordre dans lequel vous le souhaitez. En virgule flottante, cette propriété n'est pas toujours vérifiée, notamment lorsque l'on utilise des nombres réels de valeur très différentes. L'exemple ci-dessous en python devrait vous convaincre:

   .. code-block:: python

      import math

      a=1.234 * math.pow(10,56)
      b=-a
      c=5.678 * math.pow(10,-23)
      
      print(a+b+c) # affiche 5.678e-23             
      print(a+(b+c)) # affiche 0.0


   Il existe des techniques qui permettent de réaliser des calculs les plus précis possibles en virgule flottante. Certaines d'entre elles seront présentées dans le cours d'algorithmique numérique.
   

.. Python utilise la représentation en double précision des réels. Le module sys de python3 regroupe dans ``sys.float.info`` les informations relatives à ces nombres en virgule flottante, à savoir:

..   .. code-block:: python
      
..      max=1.7976931348623157e+308,
..      max_exp=1024, max_10_exp=308,
..      min=2.2250738585072014e-308,
..      min_exp=-1021, min_10_exp=-307,
..      dig=15,
..      mant_dig=53,
..      epsilon=2.220446049250313e-16,
..      radix=2,
..      rounds=1

Les dépassements de capacité et les divisions par zéro peuvent provoquer des exceptions en python lorsque l'on travaille avec des réels.

   .. code-block:: python

      import math
      
      a = math.exp(1000)  # provoque OverflowError: math range error
      b = 24.0 / 0.0 # provoque ZeroDivisionError: float division by zero

En python, le nombre ``float('inf')`` est utilisé pour représenter une valeur infinie. Elle pourrait être utilisée en cas de dépassement de capacité comme dans la fonction ci-dessous:
   
   .. code-block:: python

      import math
      
      def myexp(x):
          try:
              return math.exp(x)
          except OverflowError:
              return float('inf')
              
   


   
