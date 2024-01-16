x1gLes structures de données
=========================


Le langage python permet de supporter différents types de structure de données dont
les piles, les queues et les listes. Il est intéressant de comprendre comment ces
différentes structures de données sont stockées en mémoire avant de les implémenter
en assembleur. Nous avons déjà parlé de la pile qui est utilisée par notre processeur, 
mais une application peut aussi définir sa propre pile, indépendamment de celle que le 
processeur utilise pour supporter les fonctions et procédures.

.. spelling:word-list::

   last
   in
   first
   out
   push
   po
   

.. todo:: Exercice, faire la même chose, mais avec une queue

Une :index:`pile` utilisée par une application
est une structure de données qui permet de stocker des informations
et de les récupérer dans l'ordre inverse d'arrivée (dernier arrivé, premier servi ou
last-in first-out en anglais). La pile a une interface de programmation qui comprend
trois opérations:

 - une opération permettant d'initialiser une pile vide
 - une opération permettant d'ajouter un élément sur la pile
 - une opération permettant de récupérer l'élément se trouvant au sommet de la pile

Considérons une pile qui permet de stocker des naturels. En python, une telle pile
peut être construite en utilisant une liste. On y ajoute un élément avec l'opération
``append()`` et on récupère l'élément au sommet de la pile avec l'opération ``pop()``.

.. code-block:: console
		
   >>> pile=[]
   >>> pile.append(7)
   >>> pile.append(9)
   >>> pile.pop()
   9
   >>> pile.append(3)
   >>> pile.append(1)
   >>> pile.pop()
   1

Il est intéressant d'observer l'évolution de cette pile en la représentant d'abord
comme une pile d'assiettes. Après exécution de ``pile.append(7)``, notre pile
comprend la valeur ``7`` à son sommet (:numref:`fig-pile7`).

.. _fig-pile7:
.. tikz:: Représentation de la pile après exécution de ``pile.append(7)``

	  \matrix(m) [matrix of nodes]
	  {
	  \node(piletop)[blue,rectangle,draw,text width=40pt]{$7$}; \\
	  };

La figure :numref:`fig-pile9` représente notre pile après exécution de
``pile.append(9)``. Cette pile comprend deux éléments. La valeur ``9`` est
au sommet de la pile et la valeur ``7`` le second élément. 
	  
	  
.. _fig-pile9:
.. tikz:: Représentation de la pile après exécution de ``pile.append(9)``
	  
	  \matrix(m) [matrix of nodes]
	  {
	  \node(piletop)[blue,rectangle,draw,text width=40pt]{$9$}; \\
	  \node(pile2)[blue,rectangle,draw,text width=40pt]{$7$}; \\
	  };  	  

   
Après avoir récupéré la valeur ``9`` du sommet de la pile, on y ajoute ensuite
deux éléments via les opérations ``pile.append(3)`` et ``pile.append(1)``.
A ce moment, la pile contient trois éléments comme représenté dans la
:numref:`fig-pile31`.

.. _fig-pile31:
.. tikz:: Représentation de la pile après exécution de ``pile.append(3)`` et ``pile.append(1)``

   \matrix(m) [matrix of nodes]
   {
   \node(piletop)[blue,rectangle,draw,text width=40pt]{$1$}; \\
   \node(pile2)[blue,rectangle,draw,text width=40pt]{$3$}; \\   
   \node(pile3)[blue,rectangle,draw,text width=40pt]{$7$}; \\
   };
   


Avant de supporter une telle structure de données en assembleur, il est utile
de se demander comment elle peut être représentée en mémoire. Il faut bien
entendu disposer d'espace pour stocker les naturels que l'on stocke
sur la pile, mais il faut aussi mémoriser l'ordre dans lequel les opérations
d'ajout à la pile ont étés effectuées pour pouvoir retourner les données
stockées dans l'ordre inverse. Un première approche possible serait
de réserver une zone de mémoire pour stocker celle pile et d'y stocker le
nombre d'éléments se trouvant sur cette pile. Si cette zone de mémoire
commence à l'adresse :math:`p`, elle pourrait être initialisée comme
dans la :numref:`fig-pile-bloc`.

.. _fig-pile-bloc:
.. tikz:: Stockage d'une pile dans un bloc de mémoire
	  
  \matrix(m) [matrix of nodes, text width=60pt]
  {
    $p+10$  & \node(pile4)[blue,rectangle,draw]{$0$}; & \\
    $p+8$  & \node(pile3)[blue,rectangle,draw]{$0$}; & \\
    $p+6$  & \node(pile2)[blue,rectangle,draw]{$0$}; & \\
    $p+4$  & \node(pile1)[blue,rectangle,draw]{$0$}; & \\
    $p+2$ & \node(pile0)[blue,rectangle,draw]{$0$} ;& \\
    $p$ & \node(pilen)[red,rectangle,draw]{$0$}; & \texttt{;nombre d'éléments}\\
  };

  
Après exécution de ``pile.append(7)``, cette pile contient un élément et
la valeur ``7`` à son sommet (:numref:`fig-pile-bloc-7`).  
   
.. _fig-pile-bloc-7:
.. tikz:: Stockage d'une pile dans un bloc de mémoire après exécution de ``pile.append(7)``
	  
  \matrix(m) [matrix of nodes, text width=60pt]
  {
    $p+10$  & \node(pile4)[blue,rectangle,draw]{$0$}; & \\
    $p+8$  & \node(pile3)[blue,rectangle,draw]{$0$}; & \\
    $p+6$  & \node(pile2)[blue,rectangle,draw]{$0$}; & \\
    $p+4$  & \node(pile1)[blue,rectangle,draw]{$0$}; & \\
    $p+2$ & \node(pile0)[blue,rectangle,draw]{$7$} ;& \\
    $p$ & \node(pilen)[red,rectangle,draw]{$1$}; & \texttt{;nombre d'éléments}\\
  };

Après avoir récupéré la valeur ``9`` du sommet de la pile, on y ajoute ensuite
deux éléments via les opérations ``pile.append(3)`` et ``pile.append(1)``.
A ce moment, la pile contient trois éléments comme représenté dans la
:numref:`fig-pile-bloc-31`.  


.. _fig-pile-bloc-31:
.. tikz:: Stockage d'une pile dans un bloc de mémoire après exécution de ``pile.append(3)`` et ``pile.append(1)``
	  
  \matrix(m) [matrix of nodes, text width=60pt]
  {
    $p+10$  & \node(pile4)[blue,rectangle,draw]{$0$}; & \\
    $p+8$  & \node(pile3)[blue,rectangle,draw]{$0$}; & \\
    $p+6$  & \node(pile2)[blue,rectangle,draw]{$1$}; & \\
    $p+4$  & \node(pile1)[blue,rectangle,draw]{$3$}; & \\
    $p+2$ & \node(pile0)[blue,rectangle,draw]{$7$} ;& \\
    $p$ & \node(pilen)[red,rectangle,draw]{$3$}; & \texttt{;nombre d'éléments}\\
  };


Malheureusement, cette solution de stockage d'un pile souffre d'un problème
majeur. Que se passe-t-il lorsque la zone mémoire allouée à la pile est
remplie ? Dans note exemple, cela se produira si on veut encore ajouter
trois éléments sur notre pile. Il n'y a pas de solution simple à ce problème. Pour
le résoudre, il faut pouvoir déplacer la zone mémoire allouée à la pile pour
la mettre dans une autre zone de la mémoire qui contient plus d'espace libre. La copie
est assez facile à réaliser, mais il faut aussi modifier toutes les instructions
du programme qui utilisent l'adresse de la pile puisque celle-ci change et cela
c'est beaucoup plus difficile à réaliser. La pile utilisée par notre processeur évite
ce problème car le processeur contient le registre ``SP`` et elle utilise le haut
de la mémoire. Cette technique n'est pas utilisable dans un programme applicatif.

Une meilleure solution pour implémenter une pile de façon générique est d'utiliser
des références. L'exemple ci-dessous montre comment construire une telle pile en python.

.. code-block:: python

   # Définition de la classe Node
   class Node:
	def __init__(self, value):
	    self.value = value
	    self.next = None

   # Définition de la classe Stack
   class Stack:
        # Initialisation
        def __init__(self):
	    self.top = None
	    
	# Méthode pour empiler un élément sur la pile
	def push(self, value):
	    new_node = Node(value)
	    if self.top is None:
	        self.top = new_node else:
		new_node.next = self.top
	    self.top = new_node

	# Méthode pour dépiler un élément de la pile
	def pop(self):
	    if self.top is None:
		return None
	    else:
	        popped_node = self.top
		self.top = self.top.next
		popped_node.next = None
		return popped_node.value

	# Méthode pour vérifier si la pile est vide
	def is_empty(self):
	    return self.top is None

Dans cet exemple, nous utilisons une classe ``Node`` pour représenter chaque nœud de la liste chaînée, et une classe ``Stack`` pour encapsuler les opérations de la pile.

La méthode ``push()`` permet d'empiler un nouvel élément sur le dessus de la pile en créant un nouveau nœud et en modifiant les références pour pointer vers le nouveau nœud.

La méthode ``pop()`` permet de dépiler l'élément du dessus de la pile en ajustant les références pour pointer vers le nœud suivant.

La méthode ``is_empty()`` vérifie si la pile est vide en vérifiant si la référence `top` pointe vers ``None``.


Cette implémentation peut s'utiliser par le fragment de code ci-dessous.

.. code-block:: python
	    
   # Exemple d'utilisation de la pile
   stack = Stack()
   stack.push(1)
   stack.push(2)
   stack.push(3)
   print(stack.pop()) # Résultat: 3
   print(stack.pop()) # Résultat: 2
   print(stack.is_empty()) # Résultat: False


Dans l'exemple d'utilisation, nous empilons les éléments 1, 2 et 3 sur la pile à l'aide de la méthode ``push()``. Ensuite, nous dépilons les deux premiers éléments de la pile à l'aide de la méthode ``pop()``. Finalement, nous utilisons la méthode ``is_empty()`` pour vérifier si la pile est vide.

Cette implémentation de la pile utilise une :index:`structure chaînée`. Dans une pile,
il est nécessaire de connaître à tout moment l'élément qui se trouve au sommet de la
pile. Notre code python garde une référence vers le sommet de la pile via
la variable ``self.top``. Celle-ci a comme valeur ``None`` à la création de la
pile ou lorsqu'elle est vide.

Dans de nombreux langages de programmation on appelle cette adresse un
:index:`pointeur`. Lorsque l'on créée une pile, celle-ci est vide et le
pointeur du sommet de pile ne peut pas indiquer l'adresse d'un élément de la
pile. En assembleur on utilise la valeur ``NULL`` pour indiquer un pointeur qui
ne pointe vers rien. En mémoire, ce pointeur ``NULL`` correspondra à l'adresse
``0``.

En assembleur, nous pouvons également stocker l'équivalent de l'information
contenue dans chaque instance de la classe ``Node``, c'est-à-dire :

 - la valeur (le naturel) stockée en mémoire
 - l'adresse de l'instance suivante de la classe ``Node`` sur la pile ou ``NULL`` si
   on est en fin de pile.

Nous utiliserons une notation pointée pour indiquer les deux parties d'un élément d'une pile.
Si ``e`` est notre élément, alors ``e_val`` sera la valeur du naturel de cet élément
et ``e_ptr`` contiendra l'adresse de l'élément
suivant sur la pile. Sur base de cette notation, nous pouvons reprendre
notre exemple en python et analyser comment les différents éléments sont
stockés en mémoire. La pile est initialisée en plaçant la valeur ``0``, correspondant
au pointeur ``NULL``, à l'adresse (:math:`p`) correspondant au pointeur de sommet
de pile. Ensuite, nous ajoutons ``7`` sur la pile avec l'opération
``p.push(7)``. L'élément correspondant se trouve à l'adresse :math:`x` sur la
:numref:`fig-pile-chain-7`.

.. _fig-pile-chain-7:
.. tikz:: Stockage d'une pile dans une structure chaînée après exécution de ``pile.push(7)``

	  \matrix(m1) [matrix of nodes, text width=60pt] at (0,0)
	  {
	  $x+2$ & \node(p1_next)[red,rectangle,draw,align=center]{$NULL$}; & \node[align=right]{\texttt{;ptr}};\\
	  $x$ & \node(p1_val)[blue,rectangle,draw,align=center]{7}; & \node[align=right]{\texttt{;val}};\\
	  };

	  \matrix(m2) [matrix of nodes, text width=60pt] at (0, -2)
	  {
	  $p$ & \node(pile)[red,rectangle,draw,align=center]{$x$}; & \node[align=right]{\texttt{;sommet de pile}};\\
	  };

	  \draw[thick,red,->] (pile.west) to [bend left] (p1_val.west);


En assembleur, une telle structure chaînée peut être écrite en mémoire
en utilisant les instructions suivantes.

.. code-block:: nasm

   p:      DB n1_val   ; le pointeur vers le sommet de la pile
   n1_val: DB 7        ; le premier naturel stocké sur la pile
   n1_ptr: DB 0        ; pointeur NULL, pas de successeur

	  

La :numref:`fig-pile-chain-9` représente l'état de la pile en mémoire après exécution
de l'opération ``p.push(9)`` en supposant que l'élément correspondant soit
stocké en mémoire à l'adresse :math:`z`.
	  
.. _fig-pile-chain-9:
.. tikz:: Stockage d'une pile dans une structure chaînée après exécution de ``pile.push(9)``
	  

	  \matrix(m1) [matrix of nodes, text width=60pt] at (0,0)
	  {
	  $x+2$ & \node(p1_next)[red,rectangle,draw,align=center]{$NULL$}; & \node[align=right]{\texttt{;ptr}};\\
	  $x$ & \node(p1_val)[blue,rectangle,draw,align=center]{7}; & \node[align=right]{\texttt{;val}};\\
	  };

	  \matrix(m2) [matrix of nodes, text width=60pt] at (0, -2)
	  {
	  $p$ & \node(pile)[red,rectangle,draw,align=center]{$x$}; & \node[align=right]{\texttt{;sommet de pile}};\\
	  };

	  \matrix(m3) [matrix of nodes, text width=60pt] at (0,-5)
	  {
	  {$z+2$}  & \node(p2_next)[red,rectangle,draw]{$x$}; & \node[align=right]{\texttt{;ptr}};\\
	  {$z$} & \node(p2_val)[blue,rectangle,draw]{9}; & \node[align=right]{\texttt{;val}};\\
	  };
 

	  \draw[thick,red,->] (pile.west) to [bend right] (p2_val.west);
	  \draw[thick,red,->] (p2_next.east) to [bend right] (p1_val.east);

En assembleur, une telle structure chaînée peut être écrite en mémoire
en utilisant les instructions suivantes.

.. code-block:: nasm

   p: DB n2_val        ; le pointeur vers le sommet de la pile
   n1_val: DB 7        ; le deuxième naturel stocké sur la pile
   n1_ptr: DB 0        ; pointeur NULL, pas de successeur
   n2_val: DB 9        ; le premier naturel stocké sur la pile
   n2_ptr: DB n1_val   ; pointeur vers le successeur

Après avoir récupéré la valeur ``9`` du sommet de la pile, on y ajoute ensuite
deux éléments via les opérations ``pile.push(3)`` et ``pile.push(1)``.
A ce moment, la pile contient trois éléments comme représenté dans la
:numref:`fig-pile-chain-31`.

.. _fig-pile-chain-31:
.. tikz:: Stockage d'une pile dans une structure chaînée après exécution de ``pile.push(3)`` suivi de ``pile.push(1)``
	

	  \matrix(m1) [matrix of nodes, text width=60pt] at (0,0)
          {
          $x+2$ & \node(p1_next)[red,rectangle,draw,align=center]{$NULL$}; & \node[align=right]{\texttt{;ptr}}; \\
          $x$ & \node(p1_val)[blue,rectangle,draw,align=center]{7}; & \node[align=right]{\texttt{;val}};\\
          };

          \matrix(m2) [matrix of nodes, text width=60pt] at (0, -2)
          {
          $p$ & \node(pile)[red,rectangle,draw,align=center]{$v$}; & \node[align=right]{\texttt{;sommet de pile}};\\
          };

          \matrix(m3) [matrix of nodes, text width=60pt] at (0,-4)
          {
          {$v+2$}  & \node(p3_next)[red,rectangle,draw,align=center]{$y$}; & \node[align=right]{\texttt{;ptr}};\\
          {$v$} & \node(p3_val)[blue,rectangle,draw,align=center]{1}; & \node[align=right]{\texttt{;val}};\\
          };

          \matrix(mv) [matrix of nodes, text width=60pt] at (0,-6)
          {
          {$y+2$}  & \node(p2_next)[red,rectangle,draw,align=center]{$x$}; & \node[align=right]{\texttt{;ptr}};\\
          {$y$} & \node(p2_val)[blue,rectangle,draw,align=center]{3}; & \node[align=right]{\texttt{;val}};\\
          };


          \draw[thick,red,->] (pile.west) to [bend right] (p3_val.west);
          \draw[thick,red,->] (p3_next.east) to [bend left] (p2_val.east);
          \draw[thick,red,->] (p2_next.east) to [bend right] (p1_val.east);


Cette structure chaînée peut facilement s'adapter aux stockages d'autres types de
données que des naturels. A titre d'exemple, considérons des chaînes de caractères
qui sont terminées par un marqueur de fin valant ``0``. On peut facilement
construire une pile de prénoms en conservant un pointeur de sommet de pile et
en ayant dans chaque élément de la pile un pointeur vers la chaîne de caractères
stockée et un pointeur vers l'élément suivant sur la pile.

A titre d'exemple, considérons la pile de prénoms suivante en python:

.. code-block:: python

   # Exemple d'utilisation de la pile
   pile = Stack()
   pile.push("Louise")
   pile.push("Claire")
   pile.push("Dominique")
		

Si la chaîne de caractères ``Louise`` est stockée à l'adresse :math:`l`, la chaîne
``Claire`` à l'adresse :math:`c` et la chaîne ``Dominique`` à l'adresse :math:`d`,
alors en mémoire cette pile peut être organisée comme dans la :numref:`fig-pile-chain-prenoms`. 
Pour ne pas alourdir la figure, seule la chaîne de caractères ``Louise`` est
représentée dans la figure avec son marqueur de fin.

.. _fig-pile-chain-prenoms:
.. tikz:: Stockage d'une pile dans une structure chaînée après exécution de pile.push("Louise") suivi de pile.push("Claire") et pile.push("Dominique")

         \matrix(m1) [matrix of nodes, text width=60pt] at (0,0)
	 {
	 $x+2$ & \node(p1_next)[red,rectangle,draw,align=center]{$NULL$}; & \node[align= right]{\texttt{;ptr}};\\
	 $x$ & \node(p1_val)[blue,rectangle,draw,align=center]{$l$}; & \node[align=right]{\texttt{;val}};\\
	 };

	 \matrix(m2) [matrix of nodes, text width=60pt] at (0, -2)
	 {
	 $p$ & \node(pile)[red,rectangle,draw,align=center]{$y$}; & \node[align=right]{\texttt{;sommet de pile}};\\
	 };

	 \matrix(m3) [matrix of nodes, text width=60pt] at (0,-4)
	 {
	 {$v+2$}  & \node(p3_next)[red,rectangle,draw,align=center]{$x$}; & \node[align=right]{\texttt{;ptr}};\\
	 {$v$} & \node(p3_val)[blue,rectangle,draw,align=center]{$c$}; & \node[align=right]{\texttt{;val}};\\
	 };

	 \matrix(mv) [matrix of nodes, text width=60pt] at (0,-6)
	 {
	 {$y+2$}  & \node(p2_next)[red,rectangle,draw,align=center]{$v$}; & \node[align=right]{\texttt{;ptr}};\\
	 {$y$} & \node(p2_val)[blue,rectangle,draw,align=center]{$d$}; & \node[align=right]{\texttt{;val}};\\
	 };

	 \matrix(ml) [matrix of nodes, text width=60pt] at (0,-10)
	 {
	 {$l+12$}  & \node(l6)[blue,rectangle,align=center,draw]{0}; & & \node{\texttt{;fin chaîne}};\\
	 {$l+10$}  & \node(l5)[blue,rectangle,align=center,draw]{e}; & \\
	 {$l+8$}  & \node(l4)[blue,rectangle,align=center,draw]{s}; & \\
	 {$l+6$}  & \node(l3)[blue,rectangle,align=center,draw]{i}; & \\          
	 {$l+4$}  & \node(l2)[blue,rectangle,align=center,draw]{u}; & \\
	 {$l+2$}  & \node(l1)[blue,rectangle,align=center,draw]{o}; & \\
	 {$l$} & \node(l0)[blue,rectangle,align=center,draw]{L}; & \\
	 };

	 \draw[thick,red,->] (pile.west) to [bend right] (p2_val.west);
	 \draw[thick,red,->] (p2_next.east) to [bend right] (p3_val.east);
	 \draw[thick,red,->] (p3_next.east) to [bend right] (p1_val.east);
	 \draw[thick,red,->] (p1_val.west) to [bend right] (l0.west);

.. spelling:word-list::

   true
   false


Nous pouvons maintenant construire une implémentation en assembleur qui
permet d'ajouter et de retirer un naturel d'une pile. Tout comme l'implémentation
en python, notre implémentation en assembleur utilise des nœuds qui sont
composés de deux zones mémoires contiguës de 16 bits chacune :

 - ``n_val`` : le naturel stocké sur le pile
 - ``n_ptr`` : un pointeur vers le successeur de l'élément sur la pile ou ``NULL`` (``0``) pour indiquer la fin de pile

Nous utilisons la variable ``p`` pour stocker un pointeur vers l'adresse du nœud
qui se trouve au sommet de la pile (ou ``NULL`` si la pile est vide). Cette variable
est initialisée à la valeur ``0`` puisque la pile est initialement vide.


Nous pouvons commencer par la fonction ``push`` qui permet d'ajouter un élément
au sommet de la pile. Notre fonction ``push`` prend trois arguments :

 - la valeur entière à ajouter sur la pile qui est placée dans le registre ``D``
 - l'adresse de la variable contenant l'adresse du sommet de la pile
 - comme la fonction doit créer un nouveau nœud, nous devons aussi lui indiquer l'adresse mémoire de ce nouveau nœud


Cette fonction utilise les registres ``B`` et ``C``. Ils
sont donc sauvegardés sur la pile du processeur au début de la fonction. Durant l'exécution
de la fonction ``push``, la pile du programme contient donc les informations reprises en
:numref:`fig-pile-pendant-push`.

.. _fig-pile-pendant-push:
.. tikz:: État de la pile pendant l'exécution de la fonction push
	  
	  \matrix(m) [matrix of nodes]
	  {
	  \texttt{SP+6} & \ldots \\
	  \texttt{SP+8} & \node(piletop)[blue,rectangle,draw,text width=60pt]{$adresse noeud$}; \\
	  \texttt{SP+6} & \node(piletop)[blue,rectangle,draw,text width=60pt]{$adresse p$}; \\

	  \texttt{SP+4}  & \node(pile2)[blue,rectangle,draw,text width=60pt]{$Retour$}; \\
	  \texttt{SP+2}  & \node(pile2)[blue,rectangle,draw,text width=60pt]{$Ancien B$}; \\
	  \texttt{SP}  & \node(pile2)[blue,rectangle,draw,text width=60pt]{$Ancien C$}; \\
	  \texttt{SP-2} & \ldots \\
	  };
	


	  
.. code-block:: nasm

   ; push
   ; premier argument la valeur à ajouter dans D
   ; [SP+4] deuxième argument, l'adresse du sommet de la pile
   ; [SP+2] troisième argument, l'adresse du nœud à ajouter
   push:
      PUSH B
      PUSH C
      MOV B, [SP+8]    ; adresse pointeur de pile, premier sur stack
      MOV C, [SP+6]    ; adresse (val) du nœud à ajouter
      ; ajout de la valeur
      MOV [C], D  ; sauvegarde dans le nouveau nœud
      ADD C, 2    ; adresse de l'élément _ptr du nœud
      MOV B, [B]  ; adresse de l'ancien sommet de la pile
      MOV [C], B  ; sauvegarde dans l'élément _ptr du nouveau nœud
      ; mise à jour du pointeur de somme de pile
      MOV C, [SP+6]
      MOV B, [SP+8]
      MOV [B], C
      POP B 
      POP C
      RET

Nous pouvons ensuite implémenter la fonction ``pop`` qui retire l'élément se
trouvant au sommet de la pile. Cette fonction prend un argument, l'adresse
de la variable qui contient l'adresse du sommet de la pile. Le code de cette
fonction est assez simple. Il utilise le registre ``B`` comme registre temporaire.
Sa valeur est donc placée sur la pile au début de la fonction et récupérée à la
fin. Au début de la fonction, nous devons d'abord tester si la pile est vide.
C'est le cas si la variable qui stocke l'adresse du sommet de pile contient
la valeur ``NULL`` (``0``). Notre fonction récupère ensuite la valeur se
trouvant au sommet de la pile et met à jour le pointeur de sommet de pile passé
en argument pour qu'il pointe vers le nœud se trouvant maintenant au sommet. 
Elle remet à zéro le nœud qui a été effacé.

.. code-block:: nasm

  pop:
      PUSH B
      PUSH C
      MOV A, [D] ; si pile vide, retourne 0
      CMP A, 0
      JE fin_pop
      MOV B, [D] ; adresse de l'élément au sommet de la pile
      MOV A, [B] ; valeur à retourner
      ADD B, 2   ; adresse de l'élément ptr du nœud
      MOV C, [B]
      MOV [D], C ; nouveau sommet de pile
      MOV [B], 0 ; mise à zéro de l'élément
      SUB B, 2 ; ptr est au-dessus de val
      MOV [B], 0 ; mise à zéro du pointeur
   fin_pop:
      POP C
      POP B
      RET

      

Pour tester ces deux fonctions, nous pouvons construire une petite pile
en mémoire en utilisant les instructions ``DB`` à bon escient. Pour cela,
il suffit de se rappeler qu'un nœud occupe deux blocs de 16 bits consécutifs
en mémoire. L'exemple ci-dessous contient une pile contenant deux nœuds. Celui
du sommet contient la valeur ``3`` et son pointeur indique comme successeur le
nœud se trouvant à l'adresse ``n1_val`` qui contient la valeur ``7``. Ce second nœud
n'a pas de successeur. Les nœuds ``n3``, ``n4`` et ``n5`` sont vides.


.. code-block:: nasm


   JMP start:
   p: DB n2_val ; pile
   n1_val: DB 7
   n1_ptr: DB 0
   n2_val: DB 3
   n2_ptr: DB n1_val
   n3_val: DB 0
   n3_ptr: DB 0
   n4_val: DB 0
   n4_ptr: DB 0
   n5_val: DB 0
   n5_ptr: DB 0


Sur cette pile, on peut faire appel à la fonction ``pop`` en lui passant l'adresse
de la variable ``p`` comme argument dans le registre ``D``.


.. code-block:: nasm

   ; exemple d'appel à pop		
   MOV D, p
   CALL pop


L'appel à la fonction assembleur ``push`` est un peu plus compliqué puisqu'il faut
lui passer l'entier à ajouter, l'adresse du sommet de la pile et l'adresse d'un nœud
vide. L'exemple ci-dessous ajoute la valeur ``42`` sur notre pile. 


.. code-block:: nasm

   ; ajout de la valeur 42 sur la pile		
   MOV D, 42
   PUSH p
   PUSH n5_val
   CALL push


.. note:: Gestion de la mémoire


   En python, lorsque l'on écrit ``new_node = Node(value)``, on réserve une 
   zone mémoire pour stocker le nouveau nœud. Cela se fait en appelant une fonction
   de gestion de la mémoire qui sort du cadre de ce cours. C'est pour cette raison
   que notre fonction ``push``, et d'autres exemples que nous verrons ensuite,
   reçoivent l'adresse de la zone mémoire à utiliser. Vous verrez dans d'autres cours
   comment il est possible d'écrire des programmes pour gérer la mémoire. De
   la même façon, la fonction ``pop`` devrait libérer la mémoire du nœud qu'elle retire
   de la pile afin que celle-ci soit disponible pour d'autres parties du programme.

	
.. conventions du C

.. - ``false`` est toujours 0, ``true`` est n'importe quelle valeur qui n'est pas zéro
.. - NULL pas d'adresse: 0


Liste chaînée
-------------


Nous pouvons maintenant construire une liste chaînée et écrire quelques fonctions
pour manipuler une telle liste. Nous choisissons d'utiliser trois blocs de
16 bits consécutifs pour stocker les informations suivantes sur la liste :

 - le nombre d'éléments dans la liste (``len``)
 - l'adresse du dernier élément de la liste (``tail``, mis à ``NULL`` si la liste est vide)
 - l'adresse du premier élément de la liste (``head``, mis à ``NULL`` si la liste est vide)  


La :numref:`fig-entete-liste` représente ces trois blocs de données en mémoire.

.. _fig-entete-liste:
.. tikz:: Entête de la liste initialisée

   \matrix(m) [matrix of nodes]
   {
   $x+4$ & \node(l_len)[red,rectangle,draw,text width=40pt]{$0$}; & \hspace{40pt}\texttt{;l.len}\\
   $x+2$ & \node(l_tail)[red,rectangle,draw,text width=40pt]{$0$} ;& \hspace{40pt}\texttt{;l.tail}\\
   $x  $  & \node(l_head)[red,rectangle,draw,text width=40pt]{$0$}; & \hspace{40pt}\texttt{;l.head}\\
   };
   

Ce bloc de mémoire peut être initialisé par la fonction ``init_list`` qui
prend comme argument l'adresse du bloc.

.. code-block:: nasm

   ; initialise une liste
   ; D: adresse du bloc de mémoire
   init_list:
      MOV [D], 0   ; initialisation du pointeur du premier élément
      MOV [D+2], 0 ; initialisation du pointeur du dernier élément
      MOV [D+4], 0 ; initialisation de l'indication de longueur
      RET


Un nœud de notre liste contiendra deux éléments:

 - la valeur stockée (``val``)
 - le pointeur vers le nœud successeur (``next``)

La :numref:`fig-liste-nœud` représente un nœud de notre liste contenant la valeur
``17``. Ce nœud est le dernier de la liste puisqu'il n'a pas de successeur.

.. _fig-liste-nœud:
.. tikz:: Élément de la liste contenant la valeur 17 et Entête de la liste initialisée

   \matrix(m) [matrix of nodes]
   {
   $y+2$ \hspace{20pt} & \node(l_tail)[blue,rectangle,draw,text width=40pt]{$NULL$} ;& \hspace{40pt}\texttt{;node.next}\\
   $y$ \hspace{20pt} & \node(l_head)[blue,rectangle,draw,text width=40pt]{$17$}; & \hspace{40pt}\texttt{;node.val}\\
   };


Nous pouvons maintenant visualiser comment une telle liste peut être stockée en mémoire.
La :numref:`fig-liste-1` et la :numref:`fig-liste-2` représentent deux organisations
en mémoire possible d'une liste de deux éléments contenant la valeur ``42`` suivie par la valeur ``17``.

   
.. _fig-liste-1:
.. tikz:: Représentation en mémoire d'une liste contenant la valeur ``42`` suivie de ``17``

   \matrix(m1) [matrix of nodes, text width=60pt] at (0,0)
   {
   $x+2$ & \node(l1_next)[blue,rectangle,draw]{$z$}; & \node[align=right]{\texttt{;next}};\\
   $x$ & \node(l1_val)[blue,rectangle,draw]{$42$}; & \node[align=right]{\texttt{;val}};\\
   };
   
   \matrix(m2) [matrix of nodes, text width=60pt] at (0, -2)
   {
   $y+4$  & \node(l_len)[red,rectangle,draw]{$2$}; & \node[align=right]{\texttt{;l.len}};\\
   $y+2$ & \node(l_tail)[red,rectangle,draw]{$z$} ;& \node[align=right]{\texttt{;l.tail}};\\
   $y$ & \node(l_head)[red,rectangle,draw]{$x$}; & \node[align=right]{\texttt{;l.head}};\\
   };

   \matrix(m3) [matrix of nodes, text width=60pt] at (0,-5)
   {
   {$z+2$}  & \node(l2_next)[blue,rectangle,draw]{$NULL$}; & \node[align=right]{\texttt{;next}};\\
   {$z$} & \node(l2_val)[blue,rectangle,draw]{$17$}; & \node[align=right]{\texttt{;val}};\\
   };
 

   \draw[thick,red,->] (l_head.west) to [bend left] (l1_val.west);
   \draw[thick,red,->] (l_tail.west) to [bend right] (l2_val.west);
   \draw[thick,red,->] (l1_next.east) to [bend left=20] (l2_val.east);


.. _fig-liste-2:
.. tikz:: Une autre organisation possible de la liste contenant ``42`` suivi de ``17`` en mémoire


   \matrix(m1) [matrix of nodes, text width=60pt] at (0,0)
   {
   $x+12$ & \node(l1_next)[blue,rectangle,draw]{$x$}; & \node[align=right]{\texttt{;next}};\\
   $x+10$ & \node(l1_val)[blue,rectangle,draw]{$42$}; & \node[align=right]{\texttt{;val}};\\
   $x+8$  & \node(l_len)[red,rectangle,draw]{$2$}; & \node[align=right]{\texttt{;l.len}};\\
   $x+6$ & \node(l_tail)[red,rectangle,draw]{$x$} ;& \node[align=right]{\texttt{;l.tail}};\\
   $x+4$ & \node(l_head)[red,rectangle,draw]{$x+10$}; & \node[align=right]{\texttt{;l.head}};\\
   {$x+2$}  & \node(l2_next)[blue,rectangle,draw]{$NULL$}; & \node[align=right]{\texttt{;next}};\\
   {$x$} & \node(l2_val)[blue,rectangle,draw]{$17$}; & \node[align=right]{\texttt{;val}};\\
   };
 

   \draw[thick,red,->] (l_head.west) to [bend left=30] (l1_val.west);
   \draw[thick,red,->] (l_tail.west) to [bend right=30] (l2_val.west);
   \draw[thick,red,->] (l1_next.east) to [bend left=20] (l2_val.east);


Tout comme nous l'avons fait dans la section précédente pour tester notre implémentation
des fonctions de manipulation d'une pile, nous pouvons facilement construire en
mémoire une liste chaînée telle que celle représentée en :numref:`fig-liste-2`.

.. code-block:: nasm

		
   n1_val: DB 17
   n1_next: DB 0
   l_head: DB n2_val
   l_tail: DB n1_val
   l_len: DB 2		 
   n2_val: DB 42
   n2_next: DB n1_val


Nous utiliserons cette structure de liste pour implémenter plusieurs fonctions.
La première, baptisée ``add_head`` ajoute un nouvel entier en début de liste.
Cette fonction prend trois arguments :

 - l'adresse de la structure contenant la longueur de la liste et les deux pointeurs vers le début et la fin de la liste (dans le registre ``D``)
 - la valeur à ajouter (sur la pile, ``SP+4``)
 - l'adresse d'un nœud vide (sur la pile, ``SP+2``)  


La :numref:`fig-ajout-nœud` présente graphiquement l'ajout d'un nœud dans une
telle liste.


.. _fig-ajout-nœud:
.. tikz:: Ajout du nœud contenant la valeur ``9`` en tête de liste

      \matrix(m0) [matrix of nodes, text width=60pt] at (0,2)
      {
      $v+2$ & \node(l3_next)[blue,rectangle,draw]{$z$}; & \node[align=right]{\texttt{;next}};\\
      $v$ & \node(l3_val)[blue,rectangle,draw]{$9$}; & \node[align=right]{\texttt{;val}};\\
      };
  
      \matrix(m1) [matrix of nodes, text width=60pt] at (0,0)
      {
      $x+2$ & \node(l1_next)[blue,rectangle,draw]{$z$}; & \node[align=right]{\texttt{;next}};\\
      $x$ & \node(l1_val)[blue,rectangle,draw]{$42$}; & \node[align=right]{\texttt{;val}};\\
      };

      \matrix(m2) [matrix of nodes, text width=60pt] at (0, -2)
      {
      $y+4$  & \node(l_len)[red,rectangle,draw]{$2$}; & \node[align=right]{\texttt{;l.len}};\\
      $y+2$ & \node(l_tail)[red,rectangle,draw]{$z$} ;& \node[align=right]{\texttt{;l.tail}};\\
      $y$ & \node(l_head)[red,rectangle,draw]{$v$}; & \node[align=right]{\texttt{;l.head}};\\
      };

      \matrix(m3) [matrix of nodes, text width=60pt] at (0,-5)
      {
      {$z+2$}  & \node(l2_next)[blue,rectangle,draw]{$NULL$}; & \node[align=right]{\texttt{;next}};\\
      {$z$} & \node(l2_val)[blue,rectangle,draw]{$17$}; & \node[align=right]{\texttt{;val}};\\
      };
 

      \draw[thick,black,dashed,->] (l_head.west) to [bend left] (l3_val.west);
      \draw[thick,black,dashed,->] (l3_next.east) to [bend left] (l1_val.east);
      \draw[thick,red,->] (l_tail.west) to [bend right] (l2_val.west);
      \draw[thick,red,->] (l1_next.east) to [bend left=20] (l2_val.east);

   
.. code-block:: nasm

   ; Ajout d'un nouvel élément en tête de liste
   ; D: adresse du descripteur de liste
   ; [SP+4]: valeur à ajouter
   ; [SP+2]: adresse du nœud vide à utiliser
   ; retourne dans A l'adresse du nœud ajouté
   add_head:
      PUSH B ; sauvegarde
      PUSH C ; sauvegarde
      MOV A, [SP+6] ; adresse nœud à ajouter
      MOV C, [SP+8] ; valeur à ajouter
      MOV [A], C ; valeur placée dans le nœud à ajouter
      MOV B, [D] ; adresse du premier nœud de l'ancienne liste
      MOV C, [SP+6] ; adresse du nœud à ajouter
      ADD C, 2  ; C contient l'adresse de l'élément next du nouveau nœud
      MOV [C], B ; next pointe vers l'ancien premier nœud
      MOV  C, [SP+6] ; adresse du nouveau nœud
      MOV [D], C     ; descripteur head pointe vers le nouveau nœud
      MOV B, [D+4] ; adresse de len dans le descripteur
      INC B
      MOV [D+4], B ; sauvegarde en mémoire	
      POP C ; récupération
      POP B ; récupération
      RET


De la même façon, on pourra facilement écrire une fonction ``add_tail`` qui
ajoute un élément en fin de liste en utilisant le pointeur de fin de liste.
La :numref:`fig-ajout-nœud-fin` présente graphiquement l'ajout d'un
nœud en fin de liste.

.. _fig-ajout-nœud-fin:
.. tikz:: Ajout du nœud 77 en fin de liste

   \matrix(m0) [matrix of nodes, text width=60pt] at (0,2)
   {
   $v+2$ & \node(l3_next)[blue,rectangle,draw]{$NULL$}; & \node[align=right]{\texttt{;next}};\\
   $v$ & \node(l3_val)[blue,rectangle,draw]{$77$}; & \node[align=right]{\texttt{;val}};\\
   };
  
   \matrix(m1) [matrix of nodes, text width=60pt] at (0,0)
   {
   $x+2$ & \node(l1_next)[blue,rectangle,draw]{$z$}; & \node[align=right]{\texttt{;next}};\\
   $x$ & \node(l1_val)[blue,rectangle,draw]{$42$}; & \node[align=right]{\texttt{;val}};\\
   };

   \matrix(m2) [matrix of nodes, text width=60pt] at (0, -2)
   {
   $y+4$  & \node(l_len)[red,rectangle,draw]{$3$}; & \node[align=right]{\texttt{;l.len}};\\
   $y+2$ & \node(l_tail)[red,rectangle,draw]{$v$} ;& \node[align=right]{\texttt{;l.tail}};\\
   $y$ & \node(l_head)[red,rectangle,draw]{$x$}; & \node[align=right]{\texttt{;l.head}};\\
   };

   \matrix(m3) [matrix of nodes, text width=60pt] at (0,-5)
   {
   {$z+2$}  & \node(l2_next)[blue,rectangle,draw]{$v$}; & \node[align=right]{\texttt{;next}};\\
   {$z$} & \node(l2_val)[blue,rectangle,draw]{$17$}; & \node[align=right]{\texttt{;val}};\\
   };
 

   \draw[thick,black,dashed,->] (l_tail.west) to [bend left] (l3_val.west);
   \draw[thick,black,dashed,->] (l2_next.east) to [bend right] (l3_val.east);
   \draw[thick,red,->] (l_head.west) to [bend left] (l1_val.west);
   \draw[thick,red,->] (l1_next.east) to [bend left=20] (l2_val.east);


Regardons maintenant comment parcourir cette liste. Le parcours d'une liste est
une opération importante sur les listes. Comme exemple, considérons la
fonction ``sum`` qui calcule la somme de tous les éléments présents dans une liste.
Cette fonction prend un seul argument dans le registre ``D``, l'adresse du
descripteur de liste. Elle retourne la somme calculée dans le registre ``A``.

Cette fonction commence par vérifier si la liste est vide. Pour cela, elle regarde
si le pointeur ``head`` vaut zéro (adresse ``NULL``). Dans ce cas, elle retourne
la valeur zéro dans le registre ``A``. Ensuite, elle parcoure la liste est
bouclant tant que le pointeur ``next`` des éléments parcourus est différent
de ``NULL`` et accumule la somme des éléments dans le registre ``A``.

.. code-block:: nasm

   ; calcul de la somme des éléments d'une liste
   ; D: adresse du descripteur de liste
   sum:
      ; si la liste est vide, retourne 0
      MOV A, [D] ; D est l'adresse de head
      CMP A, 0
      JNE suite
      RET
   suite:
      PUSH B 
      MOV A, 0
      MOV B, [D] ; adresse du premier nœud
   boucle:
      ADD A, [B] ; valeur du premier nœud
      ADD B, 2 ; adresse du pointeur next
      MOV B, [B] ; pointeur next  
      CMP B, 0
      JNE boucle
      POP B
      RET
      


On peut bien entendu construire d'autres opérations sur de telles structures
chaînées. Plusieurs exemples vous serons présentés durant les travaux pratiques.
   
      
