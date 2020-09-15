.. LSINC1102 documentation master file, created by
   sphinx-quickstart on Tue Jan 28 18:06:33 2020.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Arithmétique binaire
====================

Un ordinateur est conçu pour manipuler de l'information binaire, c'est-à-dire de l'information encodée sous la forme de symboles binaires: `0` et `1`. Un symbole binaire est généralement désigné comme étant un :index:`bit` (pour `binary digit` ou chiffre binaire en anglais).

En utilisant des bits, il est possible de représenter n'importe quel type d'information, que ce soient des nombres, du texte, des images, du son, de la vidéo, ...


Représentation des nombres naturels
-----------------------------------

Commençons par analyser comme représenter les nombres pour effectuer des opérations arithmétiques. Avec un groupe de 4 bits, il est possible de représenter seize valeurs différentes :

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

Un tel groupe de quatre bits, aussi appelé un :index:`nibble`, peut se représenter de façon symbolique: :math:`B_{3}B_{2}B_{1}B_{0}` où les symboles :math:`B_{i}` peuvent prendre les valeurs `0` ou `1`. Dans un tel nibble, le symbole :math:`B_{3}` est appelé le :index:`bit de poids fort` tandis que le symbole :math:`B_{0}` est appelé le :index:`bit de poids faible`.

Cette représentation des nibbles est similaire à la représentation que l'on utilise pour les nombres décimaux. Un nombre en représentation décimale peut aussi s'écrire :math:`C_{n-1}C_{n-2}...C_{2}C_{1}C_{0}`. Dans cette représentation, les symboles :math:`C_{i}` sont les chiffres de `0` à `9`, :math:`C_{0}` est le chiffre des unités, :math:`C_{1}` le chiffre correspondant aux dizaines, :math:`C_{2}` celui qui correspond aux centaines, ... Numériquement, on peut écrire que la représentation décimale :math:`C_{3}C_{2}C_{1}C_{0}` correspond au nombre :math:`C_{3}*1000 + C_{2}*100 + C_{1}*10 + C_{0}` ou encore :math:`C_{3}*10^{3} + C_{2}*10^{2} + C_{1}*10^{1} + C_{0}*10^{0}` en se rappelant que :math:`10^{0}` vaut 1.

A titre d'exemple, le nombre sept cent trente six s'écrit en notation décimale `736`, ce qui équivaut bien à :math:`7*10^{2}+3*10^{2}+6*10^{0}`. 

Pour représenter les nombres naturels en notation binaire, nous allons utiliser le même principe. Un nombre en notation binaire :math:`B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}` représente le nombre naturel :math:`B_{n-1}*2^{n-1} + B_{n-2}*2^{n-2} + ... + B_{2}*2^{2} + B_{1}*2^{1} + B_{0}*2^{0}`. En appliquant cette règle aux nibbles, on obtient aisément :

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
 
.. octal ?

.. hexadécimal ?

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

5. Considérons le nombre binaire :math:`N=B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}`. Construisons le nombre `M` dans lequel on ajoute un bit de poids fort à  0, c'est-à-dire :math:`M=0B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}`. Quelle relation y-a-t-il entre `N` et `M` ?
   - :math:`N > M`
   - :math:`N < M`
   - :math:`N = M`

6. Considérons le nombre binaire :math:`N=B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}`. Construisons le nombre `P` dans lequel on ajoute un bit de poids faible à  0, c'est-à-dire :math:`P=B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}0`. Quelle relation y-a-t-il entre `N` et `P` ?
   - :math:`N > P`
   - :math:`N < P`
   - :math:`N = P`

7. Combien de nombres naturels différents peut-on représenter avec un nombre décimal sur:
   - 8 bits
   - 16 bits
   - 32 bits

Opérations arithmétiques sur les nombres binaires
-------------------------------------------------

Sur base de cette représentation binaire des nombres naturels, il est possible de réaliser toutes les opérations arithmétiques. La première que nous aborderons est l'addition. Avant de travailler en binaire, il est intéressant de se rappeler comment l'addition se réalise en calcul écrit. Considerons comme premier exemple :math:`123+463`. 

.. code-block:: console

      1 2 3   << premier naturel
    + 4 6 3   << second naturel
    -------
      5 8 6

Pour des nombres simples comme celui repris ci-dessus, l'addition s'effectue
"chiffre par chiffre". Vous avez aussi appris qu'il faut parfois faire des reports lorsqu'une addition "chiffre par chiffre" donne un résultat qui est supérier à 10. 

.. code-block:: console

      1  1  1 	   << reports	
         4  5  6   << premier naturel
    +    7  8  9   << second naturel
    ------------ 
      1  2  4  5 


L'intérêt de cette approche est que l'addition avec des nombres en représentation binaire peut se faire de la même façon. Considérons quelques exemples avec des naturels représentés sur 4 bits.



.. code-block:: console

      0  0  1  0   << premier nombre binaire
   +  0  1  0  1   << second nombre binaire
   -------------
      0  1  1  1

On vérifie aisément que :math:`2+5=4`. Comme avec l'addition des naturels, il est aussi possible d'avoir des reports lorsque l'on réalise une addition entre des nombres binaires. L'exemple ci-dessous réalise l'addition :math:`2+7`.

      
.. code-block:: console

      1	 1  0  0   << reports
      0  0  1  0   << premier nombre binaire
   +  0  1  1  1   << second nombre binaire
   -------------
      1  0  0  1


Tout comme avec l'addition des naturels, le report est aussi possible avec le bit de poids fort. En toute généralité, lorsque l'on additionne deux nibbles, la notation binaire du résultat devra parfois être stockée sur 5 bits et non 4. L'exemple ci-dessous illustre ce cas.

.. code-block:: console

     1  1  1          << reports	
        1  0  1  0    << premier nombre binaire
   +    0  1  1  1    << second nombre binaire 
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

Cette table de vérité correspond à ce que l'on appelle un "demi-additionneur" (`half-adder en anglais`). On l'appelle demi-additionneur car en général, un bit du résultat de l'addition binaire est le résultat de l'addition de trois bits et non deux: les deux bits des nombres à additionner et le bit de report.

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


Cette table de vérité correspond à ce que l'on appele un additionneur complet ( `full-adder` en anglais). Il s'agit d'une fonction booléenne à trois entrées et deux sorties qui peut facilement s'implémenter en utilisant des fonctions `AND`, `OR` et des inverseurs tout comme les fonctions que nous avons vu durant la première mission.

Vous développerez les circuits correspondant à ces additionneurs dans le cadre de la deuxième mission. Un point important à noter est que l'additionneur complet peut facilement remplacer un demi-additionneur en mettant son entrée `r` à zéro. Dans ce cas, sa table de vérité est la suivante:

= = = ====== =====
a b r report somme
- - - ------ -----
0 0 0    0     0   
0 1 0    0     1 
1 0 0    0     1   
1 1 0    1     0
= = = ====== =====

Cet additionneur sera important dans le cadre de ce cours. Nous pouvons le représenter schématiquement sous la forme d'un rectangle avec trois entrées et deux sorties (figure :numref:`fig-adder`).

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

Le plus intéressant est que ces additionneurs peuvent se combiner en cascade pour construire un additionneur qui est capable d'additionner deux nombres binaires sur n bits. La figure :numref:`fig-adder-4` présente un additionner qui travaille avec deux nibbles, `a` et `b`.

.. _fig-adder-4:
.. tikz:: Avec quatre additionneurs, on peut additionner des nibbles 
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

Pour des raisons graphiques, il est compliqué de dessiner un additionneur pour des bytes ou des mots de 16 ou 32 bits, mais le même principe s'applique. On peut donc facilement construire un additionneur qui prend en entrées deux nombres encodés sur `n` et retourne un résultat encodé sur `n` avec un report éventuel.

    
L'additionneur que nous venons de construire prend comme entrées les bits des deux nombres à additionner. Dans ce circuit, le report de l'additionneur qui correspond au bit de poids faible est mis à `0`. Que se passerait-il si cette entrée `r` était mise à la valeur `1` ? Le circuit calculerait le résultat de l'addition :math:`a+b+1`.

En informatique, on doit très souvent incrémenter une valeur entière. Si `a` est la valeur à incrémenter, on peut grâce à nos quatre additionneurs incrémenter cette valeur en forçant les entrées :math:`b_{i}` à 0. Cet "incrémenteur" est représenté dans le schéma de la figure :numref:`fig-adder-nibble`.


.. _fig-adder-nibble:
.. tikz:: Un incrémenteur de nibble 
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

 - `0000` représente le nombre `+0`
 - `0001` représente le nombre `+1`
 - `0010` représente le nombre `+2`
 - `0011` représente le nombre `+3`
 - `0100` représente le nombre `+4`
 - `0101` représente le nombre `+5`
 - `0110` représente le nombre `+6`
 - `0111` représente le nombre `+7`
 - `1000` représente le nombre `-0`
 - `1001` représente le nombre `-1`
 - `1010` représente le nombre `-2`
 - `1011` représente le nombre `-3`
 - `1100` représente le nombre `-4`
 - `1101` représente le nombre `-5`
 - `1110` représente le nombre `-6`
 - `1111` représente le nombre `-7`

Nous aurions pu aussi choisir d'utiliser le bit de poids faible pour indiquer le signe du nombre entier. Avec cette convention, nous pourrions représenter les nombres suivants:

 - `0000` représente le nombre `+0`
 - `0001` représente le nombre `-0`
 - `0010` représente le nombre `+1`
 - `0011` représente le nombre `-1`
 - `0100` représente le nombre `+2`
 - `0101` représente le nombre `-2`
 - `0110` représente le nombre `+3`
 - `0111` représente le nombre `-3`
 - `1000` représente le nombre `+4`
 - `1001` représente le nombre `-4`
 - `1010` représente le nombre `+5`
 - `1011` représente le nombre `-5`
 - `1100` représente le nombre `+6`
 - `1101` représente le nombre `-6`
 - `1110` représente le nombre `-7`
 - `1111` représente le nombre `-7`

Ces deux conventions permettent de représenter les entiers de `-7` à `+7`. Malheureusement, ces deux représentations utilisent deux nombres binaires différents pour représenter la valeur nulle. De plus, il est difficile de construire des circuits électroniques qui permettent de facilement manipuler de telles représentations des nombres entiers.


La solution à ce problème est d'utiliser la notation en :math:`complément à deux`. Pour représenter les nombres entiers en notation binaire, nous allons adaptons la représentation utilisée pour les nombres naturels. Le nombre binaire :math:`B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}` représente le nombre naturel :math:`(-1)*B_{n-1}*2^{n-1} + B_{n-2}*2^{n-2} + ... + B_{2}*2^{2} + B_{1}*2^{1} + B_{0}*2^{0}`. Il est important de noter que la présence du facteur `(-1)` qui est appliqué au bit de poids fort. En appliquant cette règle aux nibbles, on obtient aisément :


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

On remarque aisément qu'il n'y a qu'une seule chaine de bits qui représente la valeur nulle et que celle-ci correspond à la chaine de bits dans laquelle tous les bits sont à `0`. C'est un avantage important par rapport aux représentations précédentes. Par contre, il existe un nombre négatif qui n'a pas d'opposé dans une représentation utilisant un nombre fixe de bits. C'est inévitable sachant qu'avec `n` bits on ne peut représenter que :math:`2^{n}` nombres distincts.

Une propriété intéressante de la notation en complément à deux est que tous les nombres négatifs ont leur bit de poids fort qui vaut `1`. C'est une conséquence de la façon dont ces nombres sont représentés et pas un `bit de signe` explicite comme dans les représentations précédentes.

Enfin, l'avantage principal de cette représentation est que l'on va pouvoir assez facilement construire les circuits qui permettent de d'effectuer des opérations arithmétique sur ces nombres. Avec la représentation en complément à deux, il est possible de réutiliser notre additionneur sans aucune modification pour additionner des entiers. Considérons comme premier exemple :math:`(-6)+-(1)`.


.. code-block:: console

      1  1         << reports
      1  0  1  0   << premier nombre binaire : -6
   +  1  1  1  1   << second nombre binaire  : -1
   -------------
   1  1  0  0  1

Le nibble `1001` est bien la représentation du nombre négatif `-7`. Comme second exemple, prenons :math:`(-2)+-(3)`. Le résultat de l'addition bit à bit est `1011` qui est le nibble qui représente le nombre entier `-5`.


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
1  0  0  -  -  -  `-4` n'a pas d'opposé  
1  0  1  0  1  1  `opposé(-3)=3`
1  1  0  0  1  0  `opposé(-2)=2`
1  1  1  0  0  1  `opposé(-1)=1`
== == == == == == ============================

Sur base de cette table de vérité, on pourrait facilement construire un circuit qui calcule l'opposé d'un nombre sur n bits en utilisant des fonctions `AND`, `OR` et `NOT` ou uniquement des fonctions `NAND` comme durant la première mission. Cependant, on peut faire beaucoup mieux en réutilisant l'additionneur dont nous disposons déjà. Si on observe la table de vérité, on remarque que l'on peut calculer l'opposé d'un nombre binaire en deux étapes:

 a. inverser tous les bits de ce nombre en utilisant l'opération `NOT`
 b. incrémenter d'une unité le nombre binaire obtenu


La première opération est facile à réaliser en utilisant la fonction `NOT`. La seconde peut se réaliser en utilisant notre "incrémenteur". Schématiquement, le circuit à construire pour calculer l'opposé du nibble `a` est donc celui de la figure :numref:`fig-nibble-oppose`.

.. _fig-nibble-oppose:
.. tikz:: Calcul de l'opposé d'un nibble 
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
    

Si on sait facilement calculer l'opposé d'un nombre, et additionner deux nombres, il devient possible de réaliser la soustraction. Pour calculer :math:`a-b`, il suffit de calculer :math:`a+(-b)`. Le circuit de la figure :numref:`fig-b-a` réalise la soustraction :math:`b-a`. Notez que le report du bit de poids faible est mis à `1` et que les bits :math:`a_{i}` sont inversés.

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

1. Quel est le nombre décimal qui correspond au nombre entier binaire `1001100` ?

2. Quel est le nombre décimal qui correspond au nombre binaire `00001101110` ?

3. Comment peut-on facilement reconnaître si un nombre en notation binaire est :
   - pair
   - impair

4. Quels sont les plus petit et plus grands nombres entiers que l'on peut représenter en utilisant :
    - un nombre binaire sur 8 bits

5. Considérons le nombre binaire :math:`N=B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}` en notation complément à deux. Construisons le nombre `M` dans lequel on ajoute un bit de poids fort à  0, c'est-à-dire :math:`M=0B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}`. Quelle relation y-a-t-il entre `N` et `M` ?
   - :math:`N > M`
   - :math:`N < M`
   - :math:`N = M`

6. Considérons le nombre binaire :math:`N=B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}` en notation complément à deux. Construisons le nombre `M` dans lequel on ajoute un bit de poids fort à  0, c'est-à-dire :math:`M=1B_{n-1}B_{n-2}...B_{2}B_{1}B_{0}`. Quelle relation y-a-t-il entre `N` et `M` ?
   - :math:`N > M`
   - :math:`N < M`
   - :math:`N = M`

Unité Arithmétique et Logique
-----------------------------

Avec ce additionneur et les circuits associés que nous venons de voir, il est possible de construire une :index:`Unité Arithmétique et Logique` (`Arithmetic and Logic Unit` (ALU) en anglais). Ce circuit constitue le coeur d'un ordinateur au niveau du calcul. Il a deux entrées, `x` et `y` et peut retourner, à la demande, les résultats suivants: 

 - `0`
 - `1`
 - `-1`
 - `x`
 - `y`
 - `NOT(x)`
 - `NOT(y)`
 - `(-x)`
 - `(-y)`
 - `x+1`
 - `y+1`
 - `x-1`
 - `y-1`
 - `x+y`
 - `x-y`
 - `y-x`
 - `AND(x,y)`
 - `OR(x,y)`

Certaines ALUs vont plus loin et supportent d'autres opérations, mais supporter toutes ces opérations va déjà nécessiter un peu de travail. Nous avons déjà vu comment effectuer quasiment chacune de ces opérations en utilisant des fonctions booléennes. Pour les combiner dans un seul circuit, il suffira d'utiliser des multiplexeurs et de choisir des signaux permettant de les contrôler. L'ALU du livre de référence utilise six signaux de contrôle :

 - `zx` : l'entrée `x` est mise à `0`
 - `zy` : l'entrée `y` est mise à `0`
 - `nx` : l'entrée `x` est inversée
 - `ny` : l'entrée `y` est inversée
 - `f`: permet de choisir entre le résultat de l'additionneur (`1`) et de le fonction `AND` pour la sortie
 - `no` : permet d'inverser ou non le résultat

Outre le résultat qui est encodé sur 16 bits, l'ALU retourne également deux drapeaux:

 - `zr` qui est mis à `1` si le résultat de l'ALU vaut zéro et `0` sinon
 - `ng` qui est mis à `1` si le résultat de l'ALU est négatif et `0` sinon


Ces deux drapeaux méritent un peu d'explication. Sur base de la représentation des nombres entiers, il est facile de vérifier si un nombre binaire vaut `0`. Il suffit de vérifier que tous ses bits valent `0`.  Pour calculer la valeur de `ng`, c'est encore plus simple, il suffit de retourner la valeur du bit de poids fort du résultat puisqu'en notation complément à 2, celui-ci vaut `1` pour tous les entiers négatifs.  
   
La construction complète de cette ALU nécessite de s'appuie sur quelques astuces et propriétés de la représentation binaire des nombres entiers. Le livre suggère d'utiliser les signaux de contrôle d'une façon particulière.

Pour calculer `0`, il faut mettre `zx`, `zy` et `f` à `1`. Cela revient donc à calculer :math:`0+0`.

Pour calculer `1`, il faut mettre tous les signaux de contrôle`(`zx`, `zy`, `nx`, `ny`, `f` et `no` à `1`). Voyez-vous pourquoi cette addition suivie d'une inversion donne bien comme résultat la valeur `1` ?

Pour calculer `-1`, il faut mettre cinq signaux de contrôle (`zx`, `zy`, `nx`, et `f`) à `1`. Les signaux `ny` et `no` sont mis à `0`. En mettant `zx` et `nx` à `1`, l'entrée `x` de l'ALU contient la valeur `-1`. Comme `zy` est mis à `1`, l'ALU calcule :math:`-1+0`. On aurait pu obtenir le même résultat avec d'autres valeurs des signaux de contrôle. Lesquels ?

Pour calculer `x`, il faut mettre `zy` à `1`.

Pour calculer `y`, il faut mettre `zx` à `1`.

Pour calculer `NOT(x)`, il y a deux approches possibles. La première est de mettre `zy` à `1` et `nx` à `1`. La seconde est de mettre uniquement `zy` et `nx` à `1`. Dans le premier cas, on calcule :math:`x+0` et on inverse le résultat. Dans le second cas, on calcule :math:`NOT(x)+0`. On peut raisonner de façon similaire pour le calcul de `NOT(y)`.

Pour calculer `-x`, le livre suggère de mettre quatre signaux à `1`: `zy`, `ny`, `f` et `no`. Cela revient à calculer l'opération :math:`NOT(ADD(x,11..11))`. Regardons avec des nombres de trois bits le résultat de cette opération.

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


Pour calculer `x-1`, les signaux `zy` et `ny` et `f` sont mis à `1`. Le circuit calcule donc `ADD(x,11..11)` ce qui correspond bien à `x-1`. De même, on peut calculer `

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


1. Construisez un demi-additionneur

2. Construisez un additionneur complet sur 1 bit

3. Construisez un additionneur sur 16 bits

4. Construisez un incrémenteur sur 16 bits

5. Construisez l'ALU qui a été présentée en détails dans la section précédente.
   
