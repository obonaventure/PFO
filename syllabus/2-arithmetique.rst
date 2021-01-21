.. LSINC1102 documentation master file, created by
   sphinx-quickstart on Tue Jan 28 18:06:33 2020.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Arithmétique binaire
====================

Dans le chapitre précédent, nous avons vu comment un ordinateur pouvait représenter des caractères et des images sous la forme d'un séquence de symboles binaires ou bits. Dans ce chapitre, nous nous focaliserons sur la façon dont il est possible de représenter les nombres entiers et ensuite de réaliser des opérations arithmétiques simples (addition et soustraction) sur ces nombres.


Représentation des nombres naturels
-----------------------------------

Commençons par analyser comme représenter les nombres pour effectuer des opérations arithmétiques. Pour simplifier la présentation, nous travaillerons surtout avec des quartets dans ce chapitre. Il y a seize quartets différents : 

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

A titre d'exemple, le nombre sept cent trente six s'écrit en notation décimale `736`, ce qui équivaut bien à :math:`7*10^{2}+3*10^{2}+6*10^{0}`. 

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
      

Exercices
_________

1. Quel est le nombre décimal qui correspond au nombre binaire `1001100` ?

2. Quel est le nombre décimal qui correspond au nombre binaire `00001101110` ?

3. Comment peut-on facilement reconnaître si un nombre en notation binaire est :
   
   - pair
   - impair

4. Quel est le plus grand nombre naturel que l'on peut représenter en utilisant :
    - un nombre binaire sur 4 bits
    - un nombre binaire sur 6 bits
    - un nombre binaire sur 8 bits

5. Considérons le nombre naturel en représentation binaire :math:`N=B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}`. Construisons le nombre `M` dans lequel on ajoute un bit de poids fort à  0, c'est-à-dire :math:`M=0B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}`. Quelle relation y-a-t-il entre `N` et `M` ?
   
   - :math:`N > M`
   - :math:`N < M`
   - :math:`N = M`

6. Considérons le nombre naturel en représentation binaire :math:`N=B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}`. Construisons le nombre `P` dans lequel on ajoute un bit de poids faible à  0, c'est-à-dire :math:`P=B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}0`. Quelle relation y-a-t-il entre `N` et `P` ?
   
   - :math:`N > P`
   - :math:`N < P`
   - :math:`N = P`

7. Combien de nombres naturels différents peut-on représenter avec un nombre décimal sur :
   
   - 8 bits (c'est-à-dire un :index:`byte` ou un :index:`octet`)
   - 16 bits 
   - 32 bits 

     
Opérations arithmétiques sur les nombres binaires
-------------------------------------------------

Sur base de cette représentation binaire des nombres naturels, il est possible de réaliser toutes les opérations arithmétiques. La première que nous aborderons est l'addition. Avant de travailler en binaire, il est intéressant de se rappeler comment l'addition se réalise en calcul écrit. Considérons comme premier exemple :math:`123+463`. 

.. code-block:: console

      1 2 3   << premier naturel
    + 4 6 3   << second naturel
    -------
      5 8 6

Pour des nombres simples comme celui repris ci-dessus, l'addition s'effectue
"chiffre par chiffre". Vous avez aussi appris qu'il faut parfois faire des reports lorsqu'une addition "chiffre par chiffre" donne un résultat qui est supérieur à 10. C'est le case lorsque l'on cherche à ajouter `456` à `789`. 

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

Cet additionneur sera important dans le cadre de ce cours. La :numref:`fig-adder` le représente schématiquement sous la forme d'un rectangle avec (`a`, `b` et `r`) et deux sorties (`report` et `somme`).

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

Pour des raisons graphiques, il est compliqué de dessiner un additionneur pour des octets ou des mots de 16 ou 32 bits, mais le même principe s'applique. On peut donc facilement construire un additionneur qui prend en entrées deux nombres encodés sur `n` et retourne un résultat encodé sur `n` bits avec un report éventuel.
    
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


La solution à ce problème est d'utiliser la notation en :index:`complément à deux`. Pour représenter les nombres entiers en notation binaire, nous adaptons la représentation utilisée pour les nombres naturels. Le nombre binaire :math:`B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}` représente le nombre entier :math:`(-1)*B_{n-1}*2^{n-1} + B_{n-2}*2^{n-2} + ... + B_{2}*2^{2} + B_{1}*2^{1} + B_{0}*2^{0}`. Il est important de noter que la présence du facteur `(-1)` qui est appliqué au bit de poids fort. En appliquant cette règle aux quartets, on obtient aisément :


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

Enfin, l'avantage principal de cette représentation est que l'on va pouvoir assez facilement construire les circuits qui permettent de d'effectuer des opérations arithmétique sur ces nombres. Un premier avantage de la représentation en complément à deux, est qu'il est possible de réutiliser notre additionneur sans aucune modification pour additionner des entiers. Considérons comme premier exemple :math:`(-6)+-(1)`.


.. code-block:: console

      1  1         << reports
      1  0  1  0   << premier nombre binaire : -6
   +  1  1  1  1   << second nombre binaire  : -1
   -------------
   1  1  0  0  1   

Le quartet `1001` est bien la représentation du nombre négatif `-7`. Comme second exemple, prenons :math:`(-2)+-(3)`. Le résultat de l'addition bit à bit est `1011` qui est le quartet qui représente le nombre entier `-5`.


.. code-block:: console

      1            << reports
      1  1  1  0   << premier nombre binaire : -2
   +  1  1  0  1   << second nombre binaire  : -3
   -------------
   1  1  0  1  1

On peut maintenant se demander comment calculer l'opposé d'un nombre en représentation binaire. Une première approche est de déterminer la table de vérité de cette opération qui prend comme entrée `n` bits et retourne un résultat sur `n` bits également. A titre d'exemple, considérons des nombres binaires sur 3 bits.

== == == == == == ============================
a2 a1 a0 b0 b1 b0 Commentaire
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



Exercices
_________

1. Quel est le nombre décimal qui correspond au nombre binaire `1001100` ?

2. Quel est le nombre décimal qui correspond au nombre binaire `00001101110` ?

3. Comment peut-on facilement reconnaître si un nombre en notation binaire est :
   
   - pair
   - impair

4. Quels sont les plus petit et plus grand nombres entiers que l'on peut représenter en utilisant un nombre binaire sur 8 bits

5. Considérons le nombre binaire :math:`N=B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}` en notation en complément à deux. Construisons le nombre de `n+1` bits baptisé `M` dans lequel on ajoute un bit de poids fort mis à la valeur `0`, c'est-à-dire :math:`M=0B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}`. Quelle relation y-a-t-il entre les valeurs de `N` et `M` ?
   
   - :math:`N > M`
   - :math:`N < M`
   - :math:`N = M`
   - :math:`N \ne M`

6. Considérons le nombre binaire :math:`N=B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}` en notation en complément à deux. Construisons le nombre encodé sur `n+1` bits `M` dans lequel on ajoute un bit de poids fort mis à la valeur `1`, c'est-à-dire :math:`M=1B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}`. Quelle relation y-a-t-il entre `N` et `M` ?
   
   - :math:`N > M`
   - :math:`N < M`
   - :math:`N = M`
   - :math:`N \ne M`

     

Unité Arithmétique et Logique
-----------------------------

Cet additionneur joue un rôle important dans les microprocesseurs utilisés par un ordinateur. Souvent, il n'est pas utilisé seul, mais plutôt à l'intérieur d'une :index:`Unité Arithmétique et Logique` (`Arithmetic and Logic Unit` (ALU) en anglais). Ce circuit constitue le coeur d'un ordinateur au niveau du calcul. Il combine les principales fonctions de manipulations de séquences de bits. Dans le projet précédent, vous avez construit un premier circuit programmable: le multiplexeur. Celui-ci a deux entrées sur `n` bits et un signal de contrôle qui permet de sélectionner en sortie la valeur de la première ou de la seconde entrée. L'ALU va plus loin car elle prend deux signaux sur `n` bits en entrée (`x` et `y`) et plusieurs signaux de contrôle qui permettent de sélectionner l'opération à effectuer et à envoyer vers les fils de sortie. L'ALU proposée dans le livre permet de réaliser les 18 opérations reprises dans la :numref:`table-alu`. 


.. _table-alu:
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
 - `f`: permet de choisir entre le résultat de l'additionneur (`1`) et de le fonction `AND` pour la sortie
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

La construction complète de cette ALU nécessite l'utilisation quelques astuces et propriétés de la représentation binaire des nombres entiers. Le livre suggère d'utiliser les signaux de contrôle d'une façon particulière.

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

Deuxième projet
===============

Ce projet est à rendre par groupe de deux étudiants pour le lundi 26 octobre 2020 à 18h00 sur inginious. 

1. Construisez un demi-additionneur sur un bit, https://inginious.info.ucl.ac.be/course/LSINC1102/HalfAdder 

2. Construisez un additionneur complet sur un bit, https://inginious.info.ucl.ac.be/course/LSINC1102/FullAdder

3. Construisez un additionneur sur 16 bits, https://inginious.info.ucl.ac.be/course/LSINC1102/Add16

4. Construisez un circuit permettant d'incrémenter un nombre sur 16 bits, https://inginious.info.ucl.ac.be/course/LSINC1102/Inc16

5. Construisez l'ALU qui a été présentée en détails dans la section précédente, https://inginious.info.ucl.ac.be/course/LSINC1102/ALU
   
