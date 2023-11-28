


Le langage python permet de supporter différents types de structure de données dont
les piles, les queues et les listes. Il est intéresant de comprendre comment ces
différentes structures de données sont stockées en mémoire avant de les implémenter
en assembleur. Commençons par la pile qui joue un rôle majeur en informatique.

Une :index:`pile` est une structure de données qui permet de stocker des informations
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
de réserver un bloc de mémoire pour stocker la pile et de stocker le
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
c'est beaucoup plus difficile à réaliser.

C'est pour cette raison que la plupart des implémentations d'une pile utilisent
une :index:`structure chaînée`. Dans une pile, il est nécessaire de connaître à
tout moment l'élément qui se trouve au sommet de la pile. Cela se fait généralement
en stockant en mémoire l'adresse du bloc de mémoire qui contient cet élément.
Dans de nombreux langages de programmation on appelle cette adresse un
:index:`pointeur`. Lorsque l'on créée une pile, celle-ci est vide et le
pointeur du sommet de pile ne peut pas indiquer l'adresse d'un élément de la
pile. On utilise en général la valeur ``NULL`` pour indiquer un pointeur qui
ne pointe vers rien. En mémoire, ce pointeur ``NULL`` correspondra à l'adresse
``0``.

Pour stocker les éléments de notre pile de naturels, nous aurons besoin de
deux zones de mémoire. La première contiendra le naturel et la seconde un pointeur
(c'est-à-dire l'adresse) vers l'élément suivant sur la pile. Nous utiliserons une
notation pointée pour faire référence à ces deux parties d'un élément d'une pile.
Si ``e`` est notre élément, alors ``e.val`` sera la valeur du naturel de cet élément
et ``e.ptr`` sera l'adresse stockée dans le pointeur et donc l'adresse de l'élément
suivant sur la pile. Sur base de cette notation, nous pouvons reprendre
notre exemple en python et analyser comment les différents éléments sont
stockés en mémoire. La pile est initialisée en plaçant la valeur ``0``, correspondant
au pointeur ``NULL``, à l'adresse (:math:`p`) correspondant au pointeur de sommet
de pile. Ensuite, nous ajoutons ``7`` sur la pile avec l'opération
``p.append(7)``. L'élément correspond se trouve à l'adresse :math:`x` sur la
:numref:`

.. _fig-pile-chain-7:
.. tikz:: Stockage d'une pile dans une structure chaînée après exécution de ``pile.append(7)``

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


La :numref:`fig-pile-chain-9` représente l'état de la pile en mémoire après exécution
de l'opration ``p.append(9)`` en supposant que l'élément correspondant soit
stocké en mémoire à l'adresse :math:`z`.
	  
.. _fig-pile-chain-9:
.. tikz:: Stockage d'une pile dans une structure chaînée après exécution de ``pile.append(9)``
	  

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


Après avoir récupéré la valeur ``9`` du sommet de la pile, on y ajoute ensuite
deux éléments via les opérations ``pile.append(3)`` et ``pile.append(1)``.
A ce moment, la pile contient trois éléments comme représenté dans la
:numref:`fig-pile-chain-31`.

.. _fig-pile-chain-31:
.. tikz:: Stockage d'une pile dans une structure chaînée après exécution de ``pile.append(3)`` suivi de ``pile.append(1)``
	

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
stockées et un pointeur vers l'élément suivant sur la pile.

A titre d'exemple, considérons la pile de prénoms suivante en python:

.. code-block:: console

		
   >>> p=[]
   >>> p.append("Louise")
   >>> p.append("Claire")
   >>> p.append("Dominique")
   

Si la chaîne de caractères ``Louise`` est stockée à l'adresse :math:`l`, la chaîne
``Claire`` à`l'adresse :math:`c` et la chaîne ``Dominique`` à l'adresse :math:`d`,
alors en mémoire cette pile peut être organisée comme dans :numref:`fig-pile-chain-prenoms`. Pour ne pas alourdir la figure, seule la chaîne de caractères ``Louise`` est
représentée en mémoire avec son marqueur de fin.

.. _fig-pile-chain-prenoms:
.. tikz:: Stockage d'une pile dans une structure chaînée après exécution de ``pile.append(3)`` suivi de ``pile.append(1)``

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


	
conventions du C

- false est toujours 0, true est n'importe quelle valeur qui n'est pas zéro
- NULL pas d'adresse: 0

  

.. code-block:: nasm

   ; incomplet début de liste
   
   JMP start
   n: DB 2
   tab: DB 9
   DB 12
   DB 3
   DB 0xAA
   x:  ; simple list
   ; header
   DB 2
   DB x+2
   
   ; header node contains
   ; header.head : pointer to the head of the list
   ; header.tail : pointer to the tail of the list
   ; NULL (0) if there is no head/tail
   ; header.length : number of elements in the list
   
   ; list nodes
   ; node.val : value
   ; node.next : pointer to the next node in the list
   
   ; initialise a header node
   ; D: address of the node
   init_list:
   MOV [D], 0; init head pointer
   MOV [D+2], 0; init tail pointer
   MOV [D+4], 0; init length
   RET
   
   ; add a new node at the head
   ; D: address of list header node
   ; [SP+2]: value to be added
   ; [SP+4]: address of the new node 
   ; returns the address of the node added
   add_head:
   PUSH B
   PUSH C
   ; put value in place
   MOV B, [SP+6]
   MOV C, [SP+8]
   MOV [C], B ;
   ; retrieve address of first node
   MOV B, [D] ; head address in B
   ADD C, 2  ; C contains address of the next element
   MOV [C], B
   ; replace head with new address
   MOV  C, [SP+8]
   MOV [D], C 
   ; increment length of the list
   MOV B, [D+4]
   INC B
   MOV [D+4], B 
   POP C
   POP B
   RET
   start:




.. tikz:: Entête de la liste initialisée

   \matrix(m) [matrix of nodes]
   {
   $x+4$ \hspace{20pt} & \node(l_len)[red,rectangle,draw,text width=40pt]{$0$}; & \hspace{40pt}\texttt{;l.len}\\
   $x+2$ \hspace{20pt}& \node(l_tail)[red,rectangle,draw,text width=40pt]{$0$} ;& \hspace{40pt}\texttt{;l.tail}\\
   $x$ \hspace{20pt} & \node(l_head)[red,rectangle,draw,text width=40pt]{$0$}; & \hspace{40pt}\texttt{;l.head}\\
   };


   
.. tikz:: Elément de la liste contenant la valeur 17 et Entête de la liste initialisée

   \matrix(m) [matrix of nodes]
   {
   $y+2$ \hspace{20pt} & \node(l_tail)[blue,rectangle,draw,text width=40pt]{$NULL$} ;& \hspace{40pt}\texttt{;node.next}\\
   $y$ \hspace{20pt} & \node(l_head)[blue,rectangle,draw,text width=40pt]{$17$}; & \hspace{40pt}\texttt{;node.val}\\
   };


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



.. tikz:: Ajout du noeud contenant la valeur ``9`` en tête de liste

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
   

.. tikz:: Ajout du noeud 77 en find de liste

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
      
