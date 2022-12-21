.. include:: defs.rst

Systèmes de stockage de données
*******************************


Le dernier composant d'un ordinateur que nous analysons sont les dispositifs permettant de stocker des données et des programmes. De nombreuses technologies ont étés utilisées au fil des années pour stocker de l'information et des programmes de façon à ce que ces informations puissent être réutilisées après un redémarrage de l'ordinateur ou sur un autre ordinateur. Contrairement à la mémoire RAM, ces systèmes peuvent conserver l'information stockée même lorsque l'ordinateur est déconnecté du réseau électrique. Ces systèmes utilisent des technologies très variées pour stocker l'information. Une description détaillée de toutes ces technologies sort du cadre de ce syllabus.

Les plus anciennes technologies sont les cartes perforées. Ces cartes sont antérieures aux premiers ordinateurs puisqu'elles étaient initialement utilisées sur les métiers à tisser, les orgues de barbarie ou les pianos mécaniques. C'est en utilisant de telles cartes perforées que Charles Babbage a pu construire sa machine analytique qui est un ancêtre des ordinateurs.

Une carte perforée est une feuille de papier rigide sur laquelle on encode l'information en y faisant des trous. Ces cartes perforées sont lues par des dispositifs mécaniques ou optiques qui détectent les différents trous. Les cartes perforées courantes avaient 80 colonnes et douze lignes. Ces cartes ont servi jusque dans les années 1970s et 1980s pour soumettre des travaux et des données à des ordinateurs dans des centres de calcul. De nos jours, les cartes perforées ne sont plus utilisées.


.. https://fr.wikipedia.org/wiki/Carte_perforée

.. spelling:word-list::

   floppy
   disk
   disks
   hard
   

De nombreux systèmes de stockage utilisent les propriétés magnétiques ou optiques de la matière pour stocker de l'information. Parmi les systèmes utilisant les propriétés magnétiques, on peut citer :

 - les cassettes 
 - les lecteurs de bandes
 - les disques souples (floppy disks)
 - les disques durs (hard disks)

Parmi les systèmes utilisant les propriétés optiques de la matière, on peut noter :

 - les CDs
 - les DVDs

D'autres systèmes plus récents utilisent des dispositifs électroniques pour stocker de l'information. Parmi ces systèmes, on peut citer :

 - les cartes mémoires
 - les lecteurs SSD
 - les mémoires non-volatiles (NVM)

.. description lecteur de bandes

.. description floppy  https://en.wikipedia.org/wiki/Floppy_disk

.. description disque dur 

.. description CD  et DVD

.. description carte mémoires

.. description ssd https://en.wikipedia.org/wiki/Solid-state_drive   


Les informaticiens et informaticiennes interagissent rarement directement avec tous ces dispositifs de stockage. La plupart des programmes s'exécutent dans le cadre d'un système d'exploitation comme Linux, Windows, MacOS, ... Ce système d'exploitation est un logiciel spécialisé qui gère l'ensemble de ressources matérielles d'un ordinateur et offre aux programmes applicatifs des abstractions qui leur permettent d'utiliser de la même façon un disque SSD et un CD, même si ces deux dispositifs utilisent des technologies très différentes. Pour cela, les informaticiens et informaticiennes qui ont conçu ces systèmes d'exploitation ont développé des abstractions qui facilitent les opérations de lecture et d'écriture sur des dispositifs de stockage. Vous avez l'habitude d'utiliser des fichiers pour stocker vos données et programmes. Ces fichiers et programmes sont généralement organisés dans des répertoires pour faciliter leur accès et regrouper logiquement les fichiers qui font partie d'un même projet ou d'un même cours. Ces fichiers et ces répertoires sont des abstractions qui ont été introduites par les informaticiens et informaticiennes qui ont construit ces systèmes d'exploitation.


Les répertoires et fichiers sont regroupés dans ce que l'on appelle en informatique un système de fichiers. Un système de fichiers est un ensemble de répertoires et de fichiers qui sont stockés sur un ou plusieurs dispositifs de stockage. Un répertoire est un ensemble contenant zéro, un ou plusieurs autres répertoires, zéro, un ou plusieurs autres fichiers. Dans un système de fichiers, les répertoires sont organisés sous la forme d'un arbre. Cet arbre commence par un répertoire spécial appelé la racine. Cette racine contient un ou plusieurs autres répertoires et parfois des fichiers. Chacun de ces répertoires, et tous les autres répertoires du système de fichiers, a un répertoire parent. Le seul répertoire qui n'a pas de parent est le répertoire qui se trouve à la racine du système de fichiers et s'appelle le répertoire racine. 

Un fichier est simplement une séquence d'octets qui est identifié par un nom. Un fichier contient généralement un nombre positif d'octets, mais il est possible d'avoir des fichiers vides qui ne contiennent aucun octet. Un système d'exploitation associé généralement à un fichier des métadonnées comme sa date de création ou de dernière modification, des permissions, des informations sur le propriétaire, ... Les métadonnées associées à un fichier peuvent varier d'un système d'exploitation à l'autre.

.. exemple de système de fichiers

.. spelling:word-list::

   ième
   
Les systèmes d'exploitation permettent aux logiciels d'accéder aux données qui sont stockées dans les fichiers à l'intérieur des répertoires. Chaque système d'exploitation contient des fonctions qui permettent aux applications d'accéder simplement au contenu des fichiers. A titre d'exemple, python fournit différentes fonctions qui permettent de manipuler les fichiers et répertoires. Avant de pouvoir utiliser un fichier, un programme doit l'ouvrir en utilisant la fonction ``open()``. Lors de l'appel à cette fonction, le système d'exploitation vérifie notamment si le fichier existe et si le programme dispose des permissions nécessaires pour accéder au fichier. Les fonctions les plus connues pour accéder à un tel fichier sont ``read()`` et ``write()``. Ces deux fonctions accèdent au fichier de façon linéaire. Lorsque un programme ouvre un fichier, le système d'exploitation associe à ce fichier ouvert une "tête de lecture". Cette "tête de lecture" est un entier qui indique la position du fichier à laquelle la prochaine opération ``read()`` et ``write()`` sera réalisée. A l'ouverture du fichier, la "tête de lecture" indique le début du fichier (c'est-à-dire la position ``0``). Après avoir lu ``n`` octets, cette "tête de lecture" vaut ``n`` et référence donc le n+1 ième octet du fichier. Si le programme appelle la fonction ``write()`` à ce moment, les données seront écrites à partir du n+1 ième octet. Outre les fonctions ``read()`` et ``write()``, python supporte des fonctions qui permettent de modifier directement la tête de lecture associée à un fichier ouvert. C'est notamment le cas de la fonction ``seek()`` qui permet de déplacer la "tête de lecture" de façon absolue ou relative. Pour la lecture de fichiers contenant du texte, la fonction ``seek()`` est peu utilisée. Par contre, ``seek()`` est très importante pour des logiciels qui doivent manipuler des fichiers contenant des images, des sons ou même des bases de données. Un système de fichier doit pouvoir fournir un support efficace aux applications qui accèdent à des fichiers de façon séquentielle en utilisant ``read()``/``write()`` mais aussi d'autres applications qui combinent ces deux fonctions avec ``seek()`` pour un accès direct aux fichiers. En python, le module ``os`` fournit différentes fonctions qui permettent d'accéder directement aux répertoires comme ``os.scandir()`` par exemple.

.. todo exemples lseek dans un fichier donné

.. spelling:word-list::

   bin
   tmp
   lib
   rep
   sub

   
Les systèmes d'exploitation utilisent des abstractions qui représentent les caractéristiques des principaux dispositifs de stockage afin de pouvoir utiliser le même code pour manipuler de très nombreux dispositifs. Le logiciel est alors organisés en couches. La couche supérieure expose des structures de données et des fonctions qui correspondent à cette abstraction. L'implémentation de cette couche peut varier d'un dispositif à l'autre, mais l'avantage est que le code de gestion des fichiers et répertoire est le même quel que soit le dispositif de stockage. Nous utiliserons une telle abstraction dans le cadre de ce cours. Les dispositifs de stockage permettent d'écrire ou de lire des blocs d'octets de taille fixe. Un dispositif de stockage contient un nombre fixe de blocs et chaque bloc est identifié par un numéro unique. On pourrait représenter l'utilisation d'un dispositif de stockage par deux fonctions :

.. code-block:: python
   
  		
   def read_block(pos):
     # Lit le contenu du bloc numéro pos et retourne le bloc complet

   def write_block(bloc, pos):
     # Remplace le bloc numéro pos avec le bloc passé en argument


Les dispositifs de stockage utilisent différentes tailles de blocs. Plus la capacité de stockage est important, plus la taille des blocs est élevée. Sur un disque souple, les blocs de 512 octets étaient courants. Sur disque dur, les blocs de 4.096 octets sont très souvent utilisés. Dans le cadre de ce cours, nous représenteront un dispositif de stockage sous la forme d'une grille. Chaque cellule de la grille correspond à un bloc. Notre modèle de dispositif de stockage est illustré dans la figure ci-dessous. Chaque cellule correspond à un bloc et il contient le numéro du bloc.

.. source: https://tex.stackexchange.com/questions/274219/drawing-a-multicolored-grid-using-tikz

.. tikz:: Modèle d'un dispositif de stockage 

   \matrix[matrix of nodes, nodes={draw,text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M){
   |[fill=red](n0)| \small{0} & |[fill=red](n1)| \small{1}  &  \small{2}  & \small{3}  & \small{4} & \small{5}  & \small{6}  & \small{7}  & \small{8} & \small{9}  \\
   \small{10} & \small{11}  &  \small{12}  & \small{13}  & \small{14} & \small{15}  & \small{16}  & \small{17}  & \small{18} & \small{19}  \\
   \small{20} & \small{21}  &  \small{22}  & \small{23}  & \small{24} & \small{25}  & \small{26}  & \small{27}  & \small{28} & \small{29}  \\
   \small{30} & \small{31}  &  \small{32}  & \small{33}  & \small{34} & \small{35}  & \small{36}  & \small{37}  & \small{38} & \small{39}  \\
   };


Dans un  dispositif de stockage réel, seuls certains blocs sont utilisés pour stocker les fichiers et les répertoires. Les blocs du début du système de stockage sont généralement utilisés pour stocker des paramètres du système de fichier. Dans les exemples qui suivent, nous réserverons les dix premiers blocs à cette utilisation. En pratique, le nombre de ces blocs "spéciaux" varie d'un système de fichiers à l'autre. Généralement, le ou les premiers blocs d'un système de stockage sont utilisés pour placer le programme d'amorçage, c'est-à-dire le code qui est chargé automatiquement au lancement de l'ordinateur et qui charge généralement le système de stockage. Dans nos exemples, nous réservons les deux premiers blocs du système de stockage à cette utilisation. Ils seront représentés en rouge dans les figures.

Les systèmes de fichiers sont organisés sous la forme d'un arborescence comme illustré en :numref:`fig-arbre`. Les rectangles représentent des fichiers tandis que les rectangles arrondis sont les répertoires. Le premier répertoire est considéré comme la racine du système de fichiers. Il contient parfois quelques fichiers, mais souvent des répertoires. Chacun de ces répertoires peut lui-même contenir des fichiers et/ou des répertoires. Dans le cadre de ce chapitre, nous utiliserons une arborescence simple pour illustrer les différentes notions. Cette arborescence est reprise dans la figure ci-dessous avec pour chaque fichier l'indication de sa taille en octets.


.. _fig-arbre:
.. tikz:: Arborescence des répertoires et fichiers


   \node (racine) [draw, rounded corners, rectangle] {$racine$};
   \node (bin) [right =of racine, draw, rounded corners, rectangle] {bin};
   \node (lib) [below =of bin, draw, rounded corners, rectangle] {lib};
   \node (f1) [below =of lib, draw, rectangle] {f1 (600 octets)};	  
   \node (tmp) [below =of f1, draw, rounded corners, rectangle] {tmp};
   
   \node (sh) [below right= of bin, draw, rectangle] {sh (2400 octets)};
   \node (echo) [below = of sh, draw, rectangle] {echo (600 octets)};	  

   \node (tmpfile) [below right= of tmp, draw, rectangle] {file (0 octet)};
   \node (rep) [below =of tmpfile, draw, rounded corners, rectangle] {rep};

   \node (sub) [below right =of rep, draw, rounded corners, rectangle] {sub};

   \node (subfile) [below right=of sub, draw, rectangle] {file (123 octets)};

   \draw[->](racine) -- (bin);
   \draw[->](racine) -- (tmp);
   \draw[->](racine) -- (lib);
   \draw[->](racine) -- (f1);

   \draw[->](bin) -- (sh);
   
   \draw[->](bin) -- (echo);

   \draw[->](tmp) -- (tmpfile);

   \draw[->](tmp) -- (rep);

   \draw[->](rep) -- (sub);

   \draw[->](sub) -- (subfile);


Ce système de fichiers contient un fichier (``f1``) et trois répertoires (``bin``, ``tmp`` et ``lib``) dans le répertoire racine. Le sous-répertoire ``bin`` contient deux fichiers (``sh`` et ``echo``). Le sous-répertoire ``lib`` ne contient ni fichier si sous-répertoire. Le sous-répertoire ``tmp`` contient un fichier (``file``) et un répertoire (``rep``). Le sous-répertoire ``rep`` contient un sous-répertoire nommé ``sub`` qui contient lui-même un fichier nommé ``file``. Dans un système de fichiers, il est possible (et même fréquent) d'avoir différents fichiers et/ou répertoires qui ont le même nom mais se trouvent à des endroits différents de l'arborescence. C'est possible car pour le système de fichiers, le nom d'un fichier ou d'un répertoire est toujours son *nom complet* depuis la racine.

.. code-block:: console
   :caption: Noms complets des fichiers du système de fichiers d'exemple

   /  (répertoire racine)
   /bin (répertoire)
   /bin/sh (fichier, 2400 octets)
   /bin/echo (fichier, 600 octets)
   /tmp (répertoire)
   /tmp/file (fichier, 0 octet)
   /tmp/rep (répertoire)
   /tmp/rep/sub (répertoire)
   /tmp/rep/sub/file (fichier, 123 octets)
   /lib (répertoire)
   /f1 (fichier, 600 octets)
      

Dans l'exemple ci-dessus, nous avons utilisé le caractère ``/`` pour séparer les noms de sous-répertoire et de fichiers. C'est la convention qui est utilisée par les systèmes de fichiers dérivés du systèmes d'exploitation Unix. D'autres systèmes d'exploitation utilisent d'autres conventions. Par exemple, les systèmes d'exploitation produits par Microsoft utilisent plutôt le caractère ``\``. La convention utilisée importe peu, par contre elle implique que le caractère qui est utilisé comme séparateur ne peut pas se trouver à l'intérieur d'un nom de répertoire ou de fichier.
   
Il existe un très grand nombre de systèmes de fichiers. Une page `wikipedia dédiée aux systèmes de fichiers <https://en.wikipedia.org/wiki/List_of_file_systems>`_ en liste plusieurs dizaines. Nous nous concentrerons sur deux exemples importants :

 - le système de fichiers `FAT` utilisé par le système d'exploitation MSDOS
 - le système de fichiers `étendu` utilisé par le système d'exploitation Linux

Ces deux systèmes de fichiers ont une structure assez différente et ils ont tous les deux étés largement déployés. L'objectif principal de ces deux systèmes de fichiers est de stocker les fichiers, les répertoires mais aussi l'arborescence qui représente le système de fichiers sur un dispositif de stockage composé de blocs. 

.. spelling:word-list::

   sh
   echo
   noeud
   d'inodes
   
   

La partie la plus simple dans le design d'un système de fichiers est le stockage des fichiers. Dans notre exemple, nous avons cinq fichiers à stocker :

  - /bin/sh (fichier, 2400 octets)
  - /bin/echo (fichier, 600 octets)
  - /tmp/file (fichier, 0 octet)
  - /tmp/rep/sub/file (fichier, 123 octets)
  - /f1 (fichier, 600 octets)

Si l'on suppose que le système de fichiers utilise des blocs de 512 octets, le premier fichier, ``/bin/sh`` occupera 5 blocs, ``/bin/echo`` en occupera 2, ``/tmp/file`` n'en occupera aucun, ``/tmp/rep/sub/file`` utiliser 1 bloc et enfin les données de ``/f1`` nécessiteront deux blocs sur le système de fichiers. Pour simplifier la comparaison des deux systèmes de fichiers, nous supposerons que les dix blocs qui contiennent les données de ces fichiers seront stockés dans les blocs numérotés de 30 à 39. La :numref:`fig-blocs-fs-1` décrit une organisation possible des blocs contenant les données de ces fichiers. Chaque fichier est composé de blocs qui sont contigus, mais cette contrainte n'est imposée que sur les dispositifs de stockage tels que les CD-ROMs et DVDs où les données sont écrites une seule fois. Dans un système de stockage où des fichiers sont créés, modifiés et supprimés de façon dynamique, les blocs qui composent un fichier ne sont pas nécessairement contigus.
    

.. _fig-blocs-fs-1:
.. tikz:: Blocs contenant les données des fichiers

   \matrix[matrix of nodes, nodes={draw,text height=0.7cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M){
   |[fill=red](n0)| \small{0} & |[fill=red](n1)| \small{1}  &  \small{2}  & \small{3}  & \small{4} & \small{5}  & \small{6}  & \small{7}  & \small{8} & \small{9}  \\
   \small{10} & \small{11}  &  \small{12}  & \small{13}  & \small{14} & \small{15}  & \small{16}  & \small{17}  & \small{18} & \small{19}  \\
   \small{20} & \small{21}  &  \small{22}  & \small{23}  & \small{24} & \small{25}  & \small{26}  & \small{27}  & \small{28} & \small{29}  \\
   |[fill=cyan] (n30)| \small{/b} & |[fill=cyan](n31)| \small{i}  &  |[fill=cyan](n32)| \small{n}  & |[fill=cyan](n33)| \small{/s}  & |[fill=cyan](n34)| \small{h} & |[fill=orange](n35)| \small{/bin/e}  & |[fill=orange](n36)| \small{cho}  & |[fill=green](n37)| \small{/t\ldots{}le}  & |[fill=yellow](n38)| \small{f} & |[fill=yellow](n39)| \small{1}  \\
   };

.. _fig-blocs-fs-2:
.. tikz:: Autre organisation possible des blocs contenant les données des fichiers
	     
   \matrix[matrix of nodes, nodes={draw,text height=0.7cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M){
   |[fill=red](n0)| \small{0} & |[fill=red](n1)| \small{1}  &  \small{2}  & \small{3}  & \small{4} & \small{5}  & \small{6}  & \small{7}  & \small{8} & \small{9}  \\
   \small{10} & \small{11}  &  \small{12}  & \small{13}  & \small{14} & \small{15}  & \small{16}  & \small{17}  & \small{18} & \small{19}  \\
   \small{20} & \small{21}  &  \small{22}  & \small{23}  & \small{24} & \small{25}  & \small{26}  & \small{27}  & \small{28} & \small{29}  \\
   |[fill=yellow](n30)| \small{1} & |[fill=orange](n31)| \small{/bin/e}  &  |[fill=orange](n32)| \small{cho}  & |[fill=cyan](n33)| \small{/s}  & |[fill=yellow](n34)| \small{f} & |[fill=cyan](n35)| \small{i}  & |[fill=cyan](n36)| \small{n}  & |[fill=green](n37)| \small{/t\ldots{}le}  & |[fill=cyan](n38)| \small{h} & |[fill=cyan](n39)| \small{/b}  \\
   };

.. ajouter d'autres exemples ou questions inginious QCM pour voir si un schéma correspond bien à un FS

   
Sur base de ces exemples, on remarque aisément qu'un fichier correspondant à une séquence d'octets est en fait stocké sur le dispositif de stockage comme une liste de blocs. Ainsi, dans l'exemple de la :numref:`fig-blocs-fs-2`, le fichier ``/bin/sh`` est composé du bloc ``39`` suivi du bloc ``35`` puis du bloc ``36`` puis du bloc ``33`` et enfin du bloc ``38``. Le fichier ``/bin/echo`` correspond lui au bloc ``31`` suivi du bloc ``32``. Le fichier ``/f1`` débute lui par le bloc ``34`` et se termine par le bloc ``30``. La liste correspondant à chaque fichier évolue à chaque fois que l'on modifie les fichiers, notamment lors des créations, suppressions et des ajouts de données dans des fichiers. La figure :numref:`fig-blocs-fs-3` représente graphiquement les listes chaînées qui correspondent à ces différents fichiers.


.. _fig-blocs-fs-3:   
.. tikz:: Liste chaînée et autre organisation des blocs contenant les données des fichiers
	     
   \matrix[matrix of nodes, nodes={draw,text height=0.7cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M){
   |[fill=red](n0)| \small{0} & |[fill=red](n1)| \small{1}  &  \small{2}  & \small{3}  & \small{4} & \small{5}  & \small{6}  & \small{7}  & \small{8} & \small{9}  \\
   \small{10} & \small{11}  &  \small{12}  & \small{13}  & \small{14} & \small{15}  & \small{16}  & \small{17}  & \small{18} & \small{19}  \\
   \small{20} & \small{21}  &  \small{22}  & \small{23}  & \small{24} & \small{25}  & \small{26}  & \small{27}  & \small{28} & \small{29}  \\
   |[fill=yellow](n30)| \small{1} & |[fill=orange](n31)| \small{/bin/e}  &  |[fill=orange](n32)| \small{cho}  & |[fill=cyan](n33)| \small{/s}  & |[fill=yellow](n34)| \small{f} & |[fill=cyan](n35)| \small{i}  & |[fill=cyan](n36)| \small{n}  & |[fill=green](n37)| \small{/t\ldots{}le}  & |[fill=cyan](n38)| \small{h} & |[fill=cyan](n39)| \small{/b}  \\
   };
   \draw[*->, color=cyan] (n39.south) to [bend left=60]  (n35.250);
   \draw[->, color=cyan] (n35.290) to [bend right=60]  (n36.250);
   \draw[->, color=cyan] (n36.290) to [bend left=60]  (n33.250);
   \draw[->, color=cyan] (n33.290) to [bend right=60]  (n38.250);
   \draw[*->, color=orange] (n31.south) to [bend right=60]  (n32.south);
   \draw[*->, color=yellow] (n34.south) to [bend left=60]  (n30.south);




Le système de fichiers doit stocker les listes ordonnées correspondant à chacun de ces fichiers. Ces listes doivent se trouver sur le dispositif de stockage car elles doivent pouvoir être lues par l'ordinateur. Une première possibilité serait d'ajouter à l'intérieur de chaque bloc le numéro de son successeur dans la liste et ``-1`` en fin de fichier. Pour cela, il faudrait réserver une partie du bloc pour stocker le numéro du bloc suivant. Si les blocs ont une capacité de 512 octets, on pourrait par exemple réserver 4 octets pour encoder le numéro du bloc suivant. Une telle organisation est représentée dans :numref:`fig-blocs-fs-4`.



.. _fig-blocs-fs-4:   
.. tikz:: Ajout d'une référence vers le bloc suivant dans chaque bloc
	     
   \matrix[matrix of nodes, nodes={draw,text height=0.7cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M){
   |[fill=red](n0)| \small{0} & |[fill=red](n1)| \small{1}  &  \small{2}  & \small{3}  & \small{4} & \small{5}  & \small{6}  & \small{7}  & \small{8} & \small{9}  \\
   \small{10} & \small{11}  &  \small{12}  & \small{13}  & \small{14} & \small{15}  & \small{16}  & \small{17}  & \small{18} & \small{19}  \\
   \small{20} & \small{21}  &  \small{22}  & \small{23}  & \small{24} & \small{25}  & \small{26}  & \small{27}  & \small{28} & \small{29}  \\
   |[fill=yellow,text height=0.7cm, text width=1cm](n30)| {\small{1}\\-1} & |[fill=orange,text height=0.7cm, text width=1cm](n31)| {\small{/bin/e}\\32}  &  |[fill=orange,text height=0.7cm, text width=1cm](n32)| {\small{cho}\\-1} & |[fill=cyan,text height=0.7cm, text width=1cm](n33)| {\small{/s}\\38}  & |[fill=yellow,text height=0.7cm, text width=1cm](n34)| {\small{f}\\30} & |[fill=cyan,text height=0.7cm, text width=1cm](n35)| {\small{i}\\36}  & |[fill=cyan,text height=0.7cm, text width=1cm](n36)| {\small{n}\\33}  & |[fill=green,text height=0.7cm, text width=1cm](n37)| {\small{/t\ldots{}le}\\-1}  & |[fill=cyan,text height=0.7cm, text width=1cm](n38)| {\small{h}\\-1} & |[fill=cyan,text height=0.7cm, text width=1cm](n39)| {\small{/b}\\35}  \\
   };
   \draw[*->, color=cyan] (n39.south) to [bend left=45]  (n35.250);
   \draw[->, color=cyan] (n35.290) to [bend right=45]  (n36.250);
   \draw[->, color=cyan] (n36.290) to [bend left=45]  (n33.250);
   \draw[->, color=cyan] (n33.290) to [bend right=45]  (n38.250);
   \draw[*->, color=orange] (n31.south) to [bend right=60]  (n32.south);
   \draw[*->, color=yellow] (n34.south) to [bend left=45]  (n30.south);


Malheureusement, cette approche souffre de plusieurs problèmes. Tout d'abord, elle réduit la taille des blocs. Un bloc contient :math:`k` octets de moins où :math:`k` est le nombre d'octets nécessaire pour encoder un numéro de blocs (typiquement 4 pour un disque dur). De plus, en stockant la liste chaînée directement dans les blocs, on force le système de fichiers à lire tous les blocs qui composent un fichier pour pouvoir y faire des accès directs. Considérons un fichier qui est édité par l'utilisateur ou créé par un programme. Lorsque la taille de ce fichier grandit, le système de fichiers doit allouer un nouveau bloc au fichier et l'ajouter à la liste chaînée. Si le fichier rétrécit suite à une opération d'édition, le système de fichiers va devoir "remonter" la liste chaînée pour retrouver les blocs à retirer. Cela peut nécessiter de reparcourir tout le fichier depuis son premier bloc ce qui sera coûteux en nombre d'accès au dispositif de stockage. Sur des dispositifs lents comme des disques souples ou durs, cela peut avoir un impact très important au niveau des performances. Pour ces raisons, les systèmes de fichiers ont choisi d'autres astuces pour stocker les listes chaînées qui représentent les différents fichiers et répertoires.

La table d'allocation des fichiers
==================================

La table d'allocation des fichiers (File Allocation Table - FAT en anglais) est une table qui permet de stocker de façon compacte toutes les listes chaînées qui représentent tous les fichiers (et répertoires) du système de fichiers.

.. _fig-fs-fat:
.. tikz:: Les listes chaînées correspondant à des fichiers peuvent être stockées dans une table d'allocation

   \matrix(fs) [matrix of nodes, nodes={draw,text height=0.7cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M){
   |[fill=red](n0)| \small{0} & |[fill=red](n1)| \small{1}  &  \small{2}  & \small{3}  & \small{4} & \small{5}  & \small{6}  & \small{7}  & \small{8} & \small{9}  \\
   \small{10} & \small{11}  &  \small{12}  & \small{13}  & \small{14} & \small{15}  & \small{16}  & \small{17}  & \small{18} & \small{19}  \\
   \small{20} & \small{21}  &  \small{22}  & \small{23}  & \small{24} & \small{25}  & \small{26}  & \small{27}  & \small{28} & \small{29}  \\
   |[fill=yellow](n30a)| \small{1} & |[fill=orange](n31a)| \small{/bin/e}  &  |[fill=orange](n32a)| \small{cho}  & |[fill=cyan](n33a)| \small{/s}  & |[fill=yellow](n34a)| \small{f} & |[fill=cyan](n35a)| \small{i}  & |[fill=cyan](n36a)| \small{n}  & |[fill=green](n37a)| \small{/t\ldots{}le}  & |[fill=cyan](n38a)| \small{h} & |[fill=cyan](n39)| \small{/b}  \\
   };

   \matrix(fat) [below =of n30a, matrix of nodes, nodes={text height=0.7cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M){
   \textbf{index} & \textbf{next bloc} \\
   ... & \\
   \tiny{$30$} & |[draw](n30)| \small{-1} \\
   \tiny{$31$} & |[draw](n31)| \small{32} \\
   \tiny{$32$} & |[draw](n32)| \small{-1} \\
   \tiny{$33$} & |[draw](n33)| \small{38} \\
   \tiny{$34$} & |[draw](n34)| \small{30} \\
   \tiny{$35$} & |[draw](n35)| \small{36} \\
   \tiny{$36$} & |[draw](n36)| \small{33} \\
   \tiny{$37$} & |[draw](n37)| \small{-1} \\
   \tiny{$38$} & |[draw](n38)| \small{-1} \\
   \tiny{$39$} & |[draw](n39)| \small{35} \\
   };
   \draw[*->, color=cyan] (n39.east) to [bend right=45]  (n35.20);
   \draw[->, color=cyan] (n35.340) to [bend left=45]  (n36.20);
   \draw[->, color=cyan] (n36.340) to [bend right=45]  (n33.20);
   \draw[->, color=cyan] (n33.340) to [bend left=45]  (n38.20);
   \draw[*->, color=orange] (n31.east) to [bend left=60]  (n32.east);
   \draw[*->, color=yellow] (n34.east) to [bend right=45]  (n30.east);

   
Cette table d'allocation représente de façon compacte l'ensemble des listes chaînées qui correspondent à nos quatre fichiers. La :numref:`fig-fs-fat` représente à la fois l'index des lignes de la table et le numéro du bloc stocké à chaque ligne. Cette table indique pour le bloc d'index ``i`` le numéro du bloc qui le suit dans le fichier auquel il appartient. La valeur de ``-1`` est réservée pour indiquer qu'un bloc est le dernier bloc d'un fichier. On pourrait aussi réserver d'autres valeurs comme par exemple ``-2`` pour indiquer que le bloc n'est actuellement pas utilisé pour stocker des données ou un répertoire ou ``-3`` pour indiquer que le bloc a été marqué comme invalide par le dispositif de stockage et qu'il ne doit donc jamais être utilisé.

Dans la :numref:`fig-fs-fat`, le fichier ``/f1`` commence par le bloc ``34`` et se termine au bloc ``30``. Le fichier ``/bin/echo`` commence lui au bloc ``31`` et se termine au bloc ``32``. Le fichier ``/tmp/rep/sub/file`` n'utilise que le bloc ``37``. Enfin, le fichier ``/bin/sh`` commence au bloc ``39`` et utilise ensuite les blocs ``35``,  ``36`` et ``33`` pour se terminer au bloc ``38``.

La table d'allocation contient toutes les informations concernant les fichiers. Elle est critique pour pouvoir accéder aux données stockées sur le disque. Elle est stockée directement sur le dispositif de stockage dans une suite de blocs qui sont contigus. Le nombre de blocs nécessaire pour stocker la table d'allocation des fichiers dépend de deux paramètres : la taille du dispositif de stockage (en blocs) et le nombre d'octets utilisés pour encoder les numéros de blocs. La première version du système d'exploitation MS-DOS de Microsoft utilisait 1.5 octets (12 bits) pour identifier chaque bloc. Les dernières versions du système de fichier FAT utilisaient 4 octets (32 bits) pour encoder les numéros de blocs. Dans un bloc de 512 octets, on pouvait donc stocker une table d'allocation des fichiers pour un dispositif comprenant 128 blocs. Dans nos exemples, nous supposerons que l'on utilise cette version du système de fichiers FAT et que la table d'allocation contient 1024 entrées. Si chaque bloc a une capacité de 512 octets, cette table d'allocation peut donc gérer des dispositifs de stockage d'une capacité de 512 Ko. La table d'allocation nécessite 8 blocs consécutifs. Elle est généralement placée dans des blocs dont le numéro est bien connu. Dans notre système de fichier d'exemple, nous avons choisi de la placer dans les blocs ``2`` à ``9``. 

La table d'allocation est consultée par le système d'exploitation lors de chaque accès à un fichier. Si chaque accès à un fichier devait nécessiter aussi des accès aux blocs qui contiennent la table d'allocation, les performances seraient fortement réduites. En pratique, les systèmes d'exploitation qui utilisent une table d'allocation des fichiers chargent en mémoire une copie de la table d'allocation des fichiers au démarrage. Tous les accès en lecture à la table d'allocation se font directement en mémoire qui est nettement plus rapide que le dispositif de stockage. Par contre, lors des opérations qui modifient la table d'allocation des fichiers, comme la création ou l'édition d'un fichier, cette modification est d'abord effectuée en mémoire et ensuite copiée sur le dispositif de stockage. Cette écriture sur le dispositif de stockage est nécessaire pour pouvoir récupérer le dernier état du système de fichiers si l'ordinateur s'arrêtait à cet instant en raison par exemple d'une panne d'électricité.

.. note:: La table d'allocation ne peut pas être perdue

   La table d'allocation contient toutes les informations concernant les fichiers. Une erreur de lecture dans un des blocs contenant la table d'allocation rendrait inaccessible tous les fichiers affectés par cette erreur. Pour cette raison, les systèmes de fichiers qui utilisent une table d'allocation maintiennent généralement deux copies de cette table de façon à pouvoir parer à toute erreur de lecture. Cela complexifie le système de fichiers puisqu'il faut s'assurer de toujours stocker les mêmes informations dans les deux copies de la table, mais c'est une assurance très utile pour éviter de perdre des données.	  

Grâce à la table d'allocation des fichiers, nous pouvons stocker sur un dispositif de stockage des fichiers de taille quelconque, mais nous n'avons pas pas encore défini comment stocker les répertoires. Dans un système de fichiers, un répertoire est simplement un fichier ayant un format particulier. Un répertoire peut être vu comme un tableau qui contient plusieurs entrées. Chaque entrée a une structure particulière. A titre d'exemple, considérons le format des répertoires utilisés par MS-DOS version 2.0. Ce système de fichiers utilisait des entrées de répertoires qui sont encodées sur 32 octets. 16 de ces entrées pouvaient donc se trouver dans un bloc de 512 octets. La :numref:`fig-fat-dir` présente le format de cette entrée de répertoire.


.. _fig-fat-dir:
.. tikz:: Une entrée d'un répertoire MS-DOS

   \node (A) at (0,0)  {
   \begin{bytefield}{32}
   \bitheader{0-31}\\
   \bitbox{32}{Name} \\
   \bitbox{32}{Name} \\
   \bitbox{24}{Ext.} & \bitbox{8}{Attr} \\
   \bitbox{8}{} & \bitbox{24}{Zeros} \\
   \bitbox{32}{Zeros} \\
   \bitbox{16}{Zeros} & \bitbox{16}{Time} \\
   \bitbox{16}{Date} & \bitbox{16}{FAT} \\
   \bitbox{32}{Length} \\
   \end{bytefield}
   };

.. spelling:word-list::

   Word
   Attr
   Time
   Name
   Length
   
Chaque entrée de répertoire comprend plusieurs informations. Les 8 premiers caractères contiennent le nom du fichier. Ils sont suivis de trois caractères qui contiennent l'extension du nom de fichier. Sous MS-DOS, les trois caractères de l'extension sont utilisés pour indiquer le type de fichier. Ainsi, l'extension ``.EXE`` correspond à un programme exécutable, ``.BAT`` un script batch, ``.DOC`` un document pour le traitement de textes Word. Il faut noter que le caractère ``.`` qui sépare le nom de l'extension ne se trouve pas explicitement dans l'entrée d'un répertoire. L'octet `Attr` (Attribut)  contient des bits qui indiquent si l'entrée correspond à un répertoire ou un fichier, si il est accessible en lecture ou en écriture, ... Les champs `Time` et `Date` indiquent de quand date le fichier. Les deux derniers champs d'un répertoire sont très importants. Le premier, ``FAT`` indique le numéro du premier bloc contenant le fichier. Sur base de ce numéro de bloc, le système d'exploitation peut utiliser la table d'allocation des fichiers pour accéder aux autres blocs qui le composent. Le dernier champ est la longueur totale du fichier en octets. Ce champ est nécessaire pour indiquer où le fichier se termine dans le dernier bloc stocké sur le disque comme les fichiers ont rarement une longueur qui est un multiple de la taille des blocs.

Nous pouvons maintenant construire le répertoire racine de notre système de fichiers et voir comment il aurait été stocké en MS-DOS. Celui-ci contient les fichiers et répertoires suivants:

.. code-block:: console

   /bin (répertoire)
   /tmp (répertoire)
   /lib (répertoire)
   /f1 (fichier, 600 octets)

Nous devons donc stocker 4 entrées dans ce répertoire. Les trois premières correspondent aux répertoires ``/bin``, ``/tmp`` et ``/lib``. La dernière correspond au fichier ``/f1``. L'entrée du répertoire correspondant au fichier ``f1`` aura comme champ ``FAT`` le numéro de bloc ``34``. Nous devons aussi stocker sur le dispositif de stockage le répertoire racine et les trois sous-répertoires ``/bin``, ``/tmp`` et ``/lib``. Chaque répertoire est un fichier contenant des entrées de répertoire. Le répertoire racine est un peu particulier car il doit pouvoir être lu au démarrage du système de fichiers. Il est placé par convention dans un bloc dont le numéro est bien connu. Dans notre système de fichiers d'exemple, nous supposons que le répertoire racine commence toujours au bloc ``10``. Certains systèmes de fichiers de type ``FAT`` utilisent un répertoire racine de taille fixe, ce qui limite le nombre de fichiers dans le répertoire racine. D'autres systèmes de fichiers supportent un répertoire racine de taille variable.

Chacun des sous-répertoires du répertoire racine est stocké sous la forme d'un fichier spécial contenant des entrées de répertoire. Le répertoire racine contient donc les champs suivants :

 - Name: ``bin``, Attr: répertoire, FAT: ``11``, Length: 64
 - Name: ``tmp``, Attr: répertoire, FAT: ``12``, Length: 64
 - Name: ``lib``, Attr: répertoire, FAT: ``13``, Length: 0
 - Name: ``f1``, Attr: fichier, FAT: ``34``, Length: 600


Le répertoire ``/bin`` ne contient que deux fichiers. Il contient les champs suivants :   

 - Name: ``sh``, Attr: fichier, FAT: ``39``, Length: 2400
 - Name: ``echo``, Attr: fichier, FAT: ``31``, Length: 600

Le répertoire ``lib`` est vide. Le répertoire ``tmp`` contient un fichier et un sous-répertoire, c'est-à-dire :

 - Name: ``file``, Attr: fichier, FAT: 0, Length: 0
 - Name: ``rep``, Attr: répertoire, FAT: ``14``, Length: 0

Le sous-répertoire ``rep`` contient le sous-répertoire ``sub`` :

  - Name: ``sub``, Attr: répertoire, FAT: ``15``, Length: 32

Le dernier répertoire est le répertoire ``sub`` qui contient le fichier ``file`` de 123 octets :

  - Name: ``file``, Attr: fichier, FAT: ``37``, Length: 123

Nos répertoires sont donc stockés dans les blocs ``10`` à ``15``. En pratique, il est fréquent qu'une zone du système de stockage soit réservée aux blocs qui contiennent les répertoires. Cela permet notamment de précharger certains répertoires en mémoire afin d'accélérer les accès aux fichiers ultérieurement. Cela facilite aussi la récupération d'erreurs lorsque l'ordinateur est arrêté avant que le système d'exploitation n'aie pu écrire les dernières modifications au système de fichiers sur le dispositif de stockage.
    

Grâce aux champs ``FAT`` qui se trouvent dans les répertoires, nous avons construit une arborescence de fichiers et de répertoire. Il y a quatre branches qui partent de la racine. Les trois premières correspondent aux répertoires ``bin``, ``tmp`` et ``lib``. La quatrième branche est celle du fichier ``f1``. Cette arborescence est illustrée dans la :numref:`fig-fat-dir` avec le numéro du premier bloc de chaque fichier ou répertoire. 

.. _fig-fat-arbre:
.. tikz:: Arborescence des répertoires et fichiers


   \node (racine) [draw, rounded corners, rectangle] {\textbf{10}:/};
   \node (bin) [right =of racine, draw, rounded corners, rectangle] {\textbf{11}:bin};
   \node (lib) [below =of bin, draw, rounded corners, rectangle] {\textbf{13}:lib};
   \node (f1) [below =of lib, draw, rectangle] {\textbf{34}:f1};	  
   \node (tmp) [below =of f1, draw, rounded corners, rectangle] {\textbf{12}:tmp};
   
   \node (sh) [below right= of bin, draw, rectangle] {\textbf{39}:sh};
   \node (echo) [below = of sh, draw, rectangle] {\textbf{31}:echo};	  

   \node (tmpfile) [below right= of tmp, draw, rectangle] {\textbf{11}:file};
   \node (rep) [below =of tmpfile, draw, rounded corners, rectangle] {\textbf{14}:rep};

   \node (sub) [below right =of rep, draw, rounded corners, rectangle] {\textbf{15}:sub};

   \node (subfile) [below right=of sub, draw, rectangle] {\textbf{37}:file};

   \draw[->](racine) -- (bin);
   \draw[->](racine) -- (tmp);
   \draw[->](racine) -- (lib);
   \draw[->](racine) -- (f1);

   \draw[->](bin) -- (sh);
   
   \draw[->](bin) -- (echo);

   \draw[->](tmp) -- (tmpfile);

   \draw[->](tmp) -- (rep);

   \draw[->](rep) -- (sub);

   \draw[->](sub) -- (subfile);

   

.. tikz:: Le système de fichiers complet et sa table d'allocation des fichiers. La FAT occupe les blocs 2 à 9. Les répertoires sont dans les blocs 10 à 15. Les fichiers occupent les blocs 30 à 39.


   \matrix(fs) [matrix of nodes, nodes={draw,text height=0.7cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M){
   |[fill=red](n0)| \small{0} & |[fill=red](n1)| \small{1}  &  |[fill=magenta](n2)|\small{2}  & |[fill=magenta](n3)| \small{3}  & |[fill=magenta](n4)| \small{4} & |[fill=magenta](n5)| \small{5}  & |[fill=magenta](n6)| \small{6}  & |[fill=magenta](n7)| \small{7}  & |[fill=magenta](n8)| \small{8} & |[fill=magenta](n9)| \small{9}  \\
   |[fill=gray]| \small{10} & |[fill=gray]|\small{11}  &  |[fill=gray]|\small{12}  & |[fill=gray]| \small{13}  & |[fill=gray]| \small{14} & |[fill=gray]| \small{15}  & \small{16}  & \small{17}  & \small{18} & \small{19}  \\
   \small{20} & \small{21}  &  \small{22}  & \small{23}  & \small{24} & \small{25}  & \small{26}  & \small{27}  & \small{28} & \small{29}  \\
   |[fill=yellow](n30a)| \small{1} & |[fill=orange](n31a)| \small{/bin/e}  &  |[fill=orange](n32a)| \small{cho}  & |[fill=cyan](n33a)| \small{/s}  & |[fill=yellow](n34a)| \small{f} & |[fill=cyan](n35a)| \small{i}  & |[fill=cyan](n36a)| \small{n}  & |[fill=green](n37a)| \small{/t\ldots{}le}  & |[fill=cyan](n38a)| \small{h} & |[fill=cyan](n39a)| \small{/b}  \\
   };

   \matrix(fat1) [below =of n30a, matrix of nodes, nodes={text height=0.7cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M){
   \textbf{index} & \textbf{next bloc} \\
   ... & \\
   \tiny{$10$} & |[draw](n10)| \small{-1} \\
   \tiny{$11$} & |[draw](n11)| \small{-1} \\
   \tiny{$12$} & |[draw](n12)| \small{-1} \\
   \tiny{$13$} & |[draw](n13)| \small{-1} \\
   \tiny{$14$} & |[draw](n14)| \small{-1} \\
   \tiny{$15$} & |[draw](n15)| \small{-1} \\
   \tiny{$16$} & |[draw](n16)| \small{-1} \\
   \tiny{$17$} & |[draw](n17)| \small{-1} \\
   \tiny{$18$} & |[draw](n18)| \small{-1} \\
   \tiny{$19$} & |[draw](n19)| \small{-1} \\
   };
   \matrix(fat2) [below =of n33a, matrix of nodes, nodes={text height=0.7cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M){
   \tiny{$20$} & |[draw](n20)| \small{-1} \\
   \tiny{$21$} & |[draw](n21)| \small{-1} \\
   \tiny{$22$} & |[draw](n22)| \small{-1} \\
   \tiny{$23$} & |[draw](n23)| \small{-1} \\
   \tiny{$24$} & |[draw](n24)| \small{-1} \\
   \tiny{$25$} & |[draw](n25)| \small{-1} \\
   \tiny{$26$} & |[draw](n26)| \small{-1} \\
   \tiny{$27$} & |[draw](n27)| \small{-1} \\
   \tiny{$28$} & |[draw](n28)| \small{-1} \\
   \tiny{$29$} & |[draw](n29)| \small{-1} \\
   };
   \matrix(fat3) [below =of n35a, matrix of nodes, nodes={text height=0.7cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M){
   \tiny{$30$} & |[draw](n30)| \small{-1} \\
   \tiny{$31$} & |[draw](n31)| \small{32} \\
   \tiny{$32$} & |[draw](n32)| \small{-1} \\
   \tiny{$33$} & |[draw](n33)| \small{38} \\
   \tiny{$34$} & |[draw](n34)| \small{30} \\
   \tiny{$35$} & |[draw](n35)| \small{36} \\
   \tiny{$36$} & |[draw](n36)| \small{33} \\
   \tiny{$37$} & |[draw](n37)| \small{-1} \\
   \tiny{$38$} & |[draw](n38)| \small{-1} \\
   \tiny{$39$} & |[draw](n39)| \small{35} \\
   };
   \draw[*->, color=cyan] (n39.east) to [bend right=45]  (n35.20);
   \draw[->, color=cyan] (n35.340) to [bend left=45]  (n36.20);
   \draw[->, color=cyan] (n36.340) to [bend right=45]  (n33.340);
   \draw[->, color=cyan] (n33.20) to [bend left=45]  (n38.east);
   \draw[*->, color=orange] (n31.east) to [bend left=60]  (n32.east);
   \draw[*->, color=yellow] (n34.east) to [bend right=45]  (n30.east);


.. note:: Vérification d'un système de fichiers corrompu


   Durant son utilisation, un système de fichiers doit pouvoir gérer les lectures et écritures classiques de fichiers et de répertoires et toutes les modifications de blocs qui y sont associées. Il doit aussi pouvoir faire face à des événements inattendus tout en préservant le plus possible les données se trouvant sur le dispositif de stockage. Pour un système de fichiers utilisant une table d'allocation des fichiers, les problèmes les plus pénalisants sont les erreurs de lecture qui rendent un bloc inutilisable et les pannes de courant.

.. spelling:word-list::

   CRC
   FAT
   l'inode
   timestamp
   timestamps
   

   
   Pour faire face aux erreurs de lecture, les dispositifs de stockage utilisent une somme de contrôle (généralement un CRC) qui est associé à chaque bloc et stocké avec le bloc. Cette somme de contrôle est une opération mathématique qui prend en compte toutes les données du bloc et retourne généralement 4 octets. Elle est conçue de façon à pouvoir facilement permettre la détection des erreurs de lecture. Lors de l'écriture d'un bloc, le dispositif de stockage calcule automatiquement le CRC associé à ce bloc. Lors d'un lecture, le CRC est recalculé sur base des données lues dans le bloc. Si la valeur calculée est égale à celle stockée sur le disque, le bloc est considéré comme correct. Sinon, le dispositif de stockage essaye de relire le bloc quelque fois pour résoudre l'erreur. Si il n'y parvient pas, le bloc est marqué comme erroné. Un tel bloc erroné peut se trouver dans le répertoire racine, dans la FAT, dans un répertoire quelconque ou dans un fichier de données. Ces quatre types d'erreurs peuvent avoir différentes conséquences. Une erreur de lecture dans la table d'allocation des fichiers sera résolue en utilisant la seconde copie de cette table. Dans ce cas, le système d'exploitation pourrait informer l'utilisateur de la fragilité du système de fichiers ou recopier la deuxième copie de la table d'allocation dans une autre partie du disque. Si l'erreur affecte un fichier, celui-ci sera proabablement tronqué et la table d'allocation des fichiers sera mise à jour. Si une erreur affecte un répertoire, ce répertoire (et tous ses descendants) deviennent inaccessibles. Si l'erreur porte sur le répertoire racine, le problème est encore plus grave.

   Les erreurs dues à une panne de courant sont plus sournoises. Le plus gros problème est lorsqu'une modification au système de fichiers nécessite l'écriture de plusieurs blocs sur le système de stockage. A titre d'exemple, considérons l'ajout d'un fichier contenant un bloc dans un répertoire. Lors de cette modification, il faut non seulement écrire le bloc correspondant au nouveau fichier, mais aussi mettre à jour le répertoire ainsi que les deux copies de la table d'allocation des fichiers. Si la panne d'électricité survient au milieu de cette séquence d'opérations le système de fichiers ne sera pas complet. On pourrait par exemple avoir le bloc du fichier mis à jour ainsi que le répertoire, mais pas la table d'allocation. Dans ce cas, le système de fichiers sera incohérent. Le fichier concerné sera listé dans le répertoire, mais il ne sera pas entièrement accessible via la table d'allocation des fichiers.
   
   En pratique, les systèmes d'exploitation fournissent des logiciels qui aident à récupérer les systèmes de fichiers endommagés. Ce logiciels doivent lire tous les blocs du système de fichiers contenant les tables d'allocations ainsi que les répertoires. Sur base des données lues dans les blocs contenant les répertoires, ils peuvent notamment vérifier que la taille indiquée pour chaque fichier correspond bien au nombre de blocs référencés dans la table d'allocation, qu'il n'y a pas de blocs qui sont repris dans la taille d'allocation mais n'appartiennent à aucun fichier ou répertoire ou qu'un fichier n'est pas référencé dans deux répertoires différents. Certains utilitaires peuvent aussi valider la structure de l'arborescence des répertoires et vérifier qu'elle ne contient pas de boucle.
   
   
.. voir https://patersontech.com/Dos/Byte/InsideDos.htm

Les inodes
==========

.. spelling:word-list::

   ext2
   bitmap
   ext
   block
   superblock


La table d'allocation est une des techniques qui permet de construire un système de fichiers, mais c'est loin d'être la seule. Depuis les années 1970s les systèmes d'exploitation dérivés de Unix (dont Linux, MacOS et Android notamment) utilisent une technique basée sur les `inodes`. L'origine du nom `inode` n'est pas clairement établie. Il semble que ce sera la contraction des mots `index` et `node` (noeud en français). L'idée intuitive de l'inode est d'y stocker la liste des numéros des blocs qui composent un fichier. On pourrait intuitivement voir l'inode comme une sorte de table des matières des blocs qui composent un fichier. 


Un `inode` est une zone du dispositif de stockage qui contient la liste des blocs qui composent un fichier. A titre d'exemple, considérons le même système de fichiers que celui de la section précédente et supposons que les fichiers sont stockés dans les mêmes blocs. Le fichier ``/bin/sh`` est composé des blocs ``39``, ``35``, ``36``, ``38`` et ``33``. Ces cinq blocs sont listés dans cet ordre dans l'inode correspondant à ce fichier. Grâce à cet `inode`, on connaît la position exacte de tous les blocs qui composent le fichier. Il en va de même pour les fichiers ``f1``, ``/bin/echo`` et ``/tmp/rep/sub/file`` comme illustré dans la :numref:`fig-inode-basic`.


.. _fig-inode-basic:
.. tikz:: Les inodes stockent les listes chaînées correspondant à chaque fichier 

   \matrix(fs) [matrix of nodes, nodes={draw,text height=0.7cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M){
   |[fill=red](n0)| \small{0} & |[fill=red](n1)| \small{1}  &  \small{2}  & \small{3}  & \small{4} & \small{5}  & \small{6}  & \small{7}  & \small{8} & \small{9}  \\
   \small{10} & \small{11}  &  \small{12}  & \small{13}  & \small{14} & \small{15}  & \small{16}  & \small{17}  & \small{18} & \small{19}  \\
   \small{20} & \small{21}  &  \small{22}  & \small{23}  & \small{24} & \small{25}  & \small{26}  & \small{27}  & \small{28} & \small{29}  \\
   |[fill=yellow](n30a)| \small{1} & |[fill=orange](n31a)| \small{/bin/e}  &  |[fill=orange](n32a)| \small{cho}  & |[fill=cyan](n33a)| \small{/s}  & |[fill=yellow](n34a)| \small{f}\
   & |[fill=cyan](n35a)| \small{i}  & |[fill=cyan](n36a)| \small{n}  & |[fill=green](n37a)| \small{/t\ldots{}le}  & |[fill=cyan](n38a)| \small{h} & |[fill=cyan](n39a)| \small{/b}  \\
   };

   \matrix(inode1) [below =of n30a, matrix of nodes, nodes={text height=0.7cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M){
   \textbf{f1} \\
   |[draw](inode11)| \small{34} \\
   |[draw](inode12)| \small{30} \\
    };   

   \matrix(inode2) [below =of n32a, matrix of nodes, nodes={text height=0.7cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M){
   \textbf{/bin/echo} \\
  |[draw](inode21)| \small{31} \\
  |[draw](inode22)| \small{32} \\
    };  
    
  \matrix(inode3) [below =of n34a, matrix of nodes, nodes={text height=0.7cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M){
  \textbf{/bin/sh}\\
  |[draw](inode31)| \small{39} \\
  |[draw](inode32)| \small{35} \\
  |[draw](inode33)| \small{36} \\
  |[draw](inode34)| \small{33} \\
  |[draw](inode35)| \small{38} \\
    };  
  \matrix(inode4) [below =of n36a, matrix of nodes, nodes={text height=0.7cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M){
  \textbf{/tmp/rep/sub/file} \\
  |[draw](inode41)| \small{37} \\
    };
    

  \draw[->, color=cyan] (inode31.east) to [bend right=45]  (n39a.south);
  \draw[->, color=cyan] (inode32.east) to [bend left=45]  (n35a.south);
  \draw[->, color=cyan] (inode33.east) to [bend right=45]  (n36a.south);
  \draw[->, color=cyan] (inode34.east) to [bend left=45]  (n33a.south);
  \draw[->, color=cyan] (inode35.east) to [bend right=45]  (n38a.south);

   
  \draw[->, color=orange] (inode21.west) to [bend left=60]  (n31a.south);
  \draw[->, color=orange] (inode22.east) to [bend left=60]  (n32a.south);

  \draw[->, color=yellow] (inode11.east) to [bend right=45]  (n34a.south);
  \draw[->, color=yellow] (inode12.west) to [bend left=45]  (n30a.south);  
  
  \draw[->, color=green] (inode41) to [bend right=45]  (n37a.south);  


A titre d'illustration sur l'utilisation des inodes, considérons le système de fichiers `ext2 <https://web.mit.edu/tytso/www/linux/ext2intro.html>`_ utilisé dans les premières versions du système d'exploitation Linux. Ce système de fichiers est inspiré des systèmes de fichiers Unix.

Un système de fichiers `ext2` est composé d'une suite de blocs. Les premiers blocs sont des blocs de contrôle qui contiennent de l'information sur le système de fichiers et sa structure. La plupart des blocs sont les blocs qui contiennent les données relatives aux fichiers et aux répertoires. Les premiers blocs d'un système de fichiers `ext2` contiennent les paramètres principaux du système de fichiers comme la taille des blocs, le nombre d'inodes, ... Une description détaillée du contenu du `Super Block` et des `FS descriptors` sort du cadre de ce cours. Après ces blocs de contrôle, un système de fichiers `ext2` contient deux bitmaps: le bitmap des block et le bitmap des inodes. Ensuite on retrouve la table des inodes. Cette table contient tous les inodes du système de fichiers. Tous les blocs de contrôle sont initialisés lors de la réaction (le formatage) du système de fichiers. La taille des bitmaps, des blocs et de la table des inodes sont fixées à ce moment. Ces tailles ne changeront jamais durant la vie du système de fichiers.

.. _fig-ext2-controle:
.. tikz:: Un système de fichiers `ext2` contient un superblock, un FS descriptor, un bitmap des blocks, un bitmap des inodes, une table des inodes et des blocs de données

   \matrix(fs) [matrix of nodes, nodes={draw,text height=0.7cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M){
   |[fill=red](n0)| \small{Super} & |[fill=red](n1)| \small{FS}  &  |[fill=red](n2)|\small{Block}  & |[fill=red](n3)|\small{Bitmap}  & |[fill=red](n4)|\small{Inode} & |[fill=red](n5)|\small{Bitmap}  & |[fill=red](n6)|\small{Inode}  & |[fill=red](n7)|\small{Table}  & \small{8} & \small{9}  \\
   \small{10} & \small{11}  &  \small{12}  & \small{13}  & \small{14} & \small{15}  & \small{16}  & \small{17}  & \small{18} & \small{19}  \\
   \small{20} & \small{21}  &  \small{22}  & \small{23}  & \small{24} & \small{25}  & \small{26}  & \small{27}  & \small{28} & \small{29}  \\
   \small{30} & \small{31}  &  \small{32}  & \small{33}  & \small{34} & \small{35}  & \small{36}  & \small{37}  & \small{38} & \small{39}  \\
   };


   
Tout comme pour le système de fichiers utilisant une table d'allocation, commençons par analyser comment les répertoires sont encodés. Nous verrons ensuite plus en détails le contenu des inodes et terminerons par le rôle des deux bitmaps.

Dans le système de fichiers `ext2`, les entrées d'un répertoire ont une longueur variable. Chaque entrée d'un répertoire comprend quatre informations:

 - le numéro de l'inode correspondant au fichier/répertoire sur 32 bits
 - un entier sur 16 bits indiquant la longueur en octets de cette entrée du répertoire
 - un entier sur 16 bits indiquant la longueur du nom de fichier/répertoire
 - une chaîne de caractère contenant le nom du fichier/répertoire


Cette organisation des répertoires permet de supporter les fichiers et répertoires dont le nom contient un nombre quelconque de caractères. Contrairement au système de fichiers MS-DOS le répertoire ne contient pas d'attributs ni d'information sur la longueur des fichiers/répertoires. Dans le système de fichiers `ext2`, toutes ces informations sont stockées dans les inodes. La :numref:`fig-ext2-arbre` représente cette arborescence avec en gras les `inodes` associés à chaque fichier/répertoire.


.. _fig-ext2-arbre:
.. tikz:: Arborescence des répertoires et fichiers de notre système `ext2`


   \node (racine) [draw, rounded corners, rectangle] {\textbf{0}:/};
   \node (bin) [right =of racine, draw, rounded corners, rectangle] {\textbf{1}:bin};
   \node (lib) [below =of bin, draw, rounded corners, rectangle] {\textbf{2}:lib};
   \node (f1) [below =of lib, draw, rectangle] {\textbf{3}:f1};	  
   \node (tmp) [below =of f1, draw, rounded corners, rectangle] {\textbf{4}:tmp};
   
   \node (sh) [below right= of bin, draw, rectangle] {\textbf{5}:sh};
   \node (echo) [below = of sh, draw, rectangle] {\textbf{6}:echo};	  

   \node (tmpfile) [below right= of tmp, draw, rectangle] {\textbf{7}:file};
   \node (rep) [below =of tmpfile, draw, rounded corners, rectangle] {\textbf{8}:rep};

   \node (sub) [below right =of rep, draw, rounded corners, rectangle] {\textbf{9}:sub};

   \node (subfile) [below right=of sub, draw, rectangle] {\textbf{10}:file};

   \draw[->](racine) -- (bin);
   \draw[->](racine) -- (tmp);
   \draw[->](racine) -- (lib);
   \draw[->](racine) -- (f1);

   \draw[->](bin) -- (sh);
   
   \draw[->](bin) -- (echo);
   \draw[->](tmp) -- (tmpfile);

   \draw[->](tmp) -- (rep);

   \draw[->](rep) -- (sub);

   \draw[->](sub) -- (subfile);


Pour comprendre comment cette arborescence est stockée en utilisant le système de fichiers `ext2`, nous devons décrire plus en profondeur le contenu d'un inode. Dans un système de fichiers `ext2`, un `inode` contient différentes informations. Les plus importantes sont les suivantes : 

 - le mode du fichier/répertoire
 - l'identifiant du propriétaire du fichier
 - l'identifiant du groupe propriétaire du fichier
 - la longueur du fichier (en octets)
 - les dates de création, de dernier accès et de dernière modification du fichier
 - le nombre de blocs du fichier
 - le nombre de liens vers le fichier
 - la liste des blocs qui composent le fichier


L'inode ne contient donc pas le nom du fichier. Celui-ci est uniquement spécifié dans le répertoire qui le contient. Le `mode` indique si il s'agit d'un fichier ou d'un répertoire. Ce champ contient également les attributs telles que les permissions de lecture, d'écriture et d'exécution sur le fichier. Comme Unix et Linux sont des systèmes d'exploitation multi-utilisateurs, l'inode comprend également les identifiants de l'utilisateur et du groupe qui sont propriétaires du fichier. Le système d'exploitation vérifie ces informations pour autoriser ou non une opération de lecture ou d'écriture sur le fichier en fonction des permissions de l'utilisateur qui exécute le programme. La longueur du fichier est spécifiée en nombre de blocs et en octets. La longueur en blocs est utile pour accéder facilement à la liste des blocs tandis que la longueur en octets est nécessaire lorsque le dernier bloc d'un fichier/répertoire est lu. Les dates sont encodées sous la forme d'un entiers de 32 bits qui contient le nombre de secondes depuis le premier janvier 1970. Le champ le plus important de l'inode est la liste des blocs. 

.. note:: Le deuxième bug de l'an 2000

   Les premières versions du système d'exploitation Unix datent du début des années 1970s. Quand les concepteurs de Unix ont réfléchi à une technique efficace pour encoder les dates de création des fichiers, ils ont opté pour un entier de 32 bits qui représente le nombre de secondes entre la date courante et une date de référence qu'ils ont arbitrairement fixé au premier janvier 1970. Sur un entier 32 bits, on peut stocker au maximum 4294967296 valeur différentes. En utilisant le premier janvier 1970 comme référence, la date la plus ancienne que l'on peut encoder est le 13 décembre 1901. Malheureusement la date la plus avancé que l'on pourra encoder est le mardi 19 janvier 2038. Les 32 bits du timestamp Unix ne permettent pas d'encoder de date postérieure à cette date. Ce problème est connu par les informaticiens comme étant le `problème de l'année 2038 <https://en.wikipedia.org/wiki/Year_2038_problem>`_. Il fait suite au problème de l'an 2000 où de nombreuses applications informatiques qui encodaient les années sur deux chiffres ont du être adaptées suite au passage du millénaire. Pour résoudre le problème de l'année 2038, il faut éviter d'encoder les timestamps sur 32 bits et préférer un encodage sur 64 bits. Plusieurs systèmes d'exploitation ont déjà fait le pas et mis à jour leurs systèmes de fichiers et autres structures de données. 


Les concepteurs des systèmes de fichiers qui utilisent des inodes sont confrontés à une difficulté. D'un côté, il est important que chaque inode soit encodé en utilisant un nombre fixe d'octets pour faciliter l'accès direct à chaque inode sur le système de stockage. D'un autre côté, l'inode doit contenir la liste des blocs qui composent le fichier/répertoire. Une première approche serait de dire qu'un `inode` doit pouvoir contenir la liste des tous les blocs du fichier de taille maximale. Sur un système de stockage de 1 TBytes utilisant des blocs de 1024 octets, le plus grand fichier peut contenir un milliard de blocs. Si chaque bloc est identifié par un entier de 32 bits, cela signifierait qu'il faudrait réserver 4 milliards d'octets dans chaque `inode` au cas où cet `inode` correspondrait à un fichier gigantesque, alors que la quasi totalité des fichiers sont assez petits. Les systèmes de fichiers utilisant les inodes résolvent ce problème en utilisant un inode de petite taille, par exemple 128 octets. Cette taille permet de stocker 4 inodes directement dans un bloc de 512 octets. Elle permet aussi de stocker directement dans l'inode les numéros des premiers blocs du fichier. Pour des petits fichiers, qui ne contiennent quelque milliers d'octets, le système de fichiers peut récupérer les identifiants de blocs directement de l'inode. Pour les plus gros fichiers, il faut cependant utiliser un mécanisme plus complexe. En pratique, l'inode contient `n` entrées qui pointent directement vers des numéros de blocs. Ces entrées sont généralement appelées les pointeurs directs. L'entrée suivante (`n+1`) pointe elle vers un bloc qui contient des numéros de blocs. Cette entrée est généralement appelée pointeur avec une indirection simple. Si les numéros de blocs sont encodés sur 32 bits et qu'un bloc contient 512 octets, alors en utilisant l'inode plus ce premier bloc on peut encoder :math:`n+128` numéros de blocs. La :numref:`fig-inode-indirect` illustre l'utilisation de ce type de pointeur. L'entrée suivante de l'inode est le pointeur avec une indirection double. Ce pointeur contient le numéro d'un bloc qui contient des numéros de blocs indirects. Via cette entrée, on peut donc référencer :math:`128^2` blocs du fichier. Pour les très longs fichiers, il reste le pointeur d'indirection triple. Ce pointeur contient le numéro d'un bloc qui contient des pointeurs d'indirection double. Via ce dernier pointeur, il est possible d'encoder :math:`128^3` blocs. La figure ci-dessous illustre comment, grâce à un pointeur indirect, un inode peut référencer un fichier composé de 16 blocs, même si il ne contient que douze pointeurs directs.

	  
.. _fig-inode-indirect:
.. tikz:: Un inode référençant un fichier de 16 blocs via un bloc indirect
   
   \matrix(fs) [matrix of nodes, nodes={draw,text height=0.7cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M) at (3,3){
   |[fill=red](n0)| \small{Super} & |[fill=red](n1)| \small{FS}  &  |[fill=red](n2)|\small{Block}  & |[fill=red](n3)|\small{Bitmap}  & |[fill=red](n4)|\small{Inode} & |[fill=red](n5)|\small{Bitmap}  & |[fill=red](n6)|\small{Inode}  & |[fill=red](n7)|\small{Table}  & \small{8} & \small{9}  \\
   |(n10)| \small{10} & |(n11)| \small{11}  & |(n12)| \small{12}  & |(n13)| \small{13}  & |(n14)| \small{14} & |(n15)| \small{15}  & |(n16)| \small{16}  & |(n17)| \small{17}  & |(n18)| \small{18} & |(n19)| \small{19}  \\
   |(n20)| \small{20} & |[fill=pink](n21)| \small{21}  & |[fill=pink](n22)| \small{22}  & |[fill=pink](n23)| \small{23}  & |[fill=pink](n24)| \small{24} & |[fill=pink](n25)| \small{25}  & |[fill=pink](n26)| \small{26}  & |[fill=pink](n27)| \small{27}  & |[fill=pink](n28)| \small{28} & |[fill=pink](n29)| \small{29}  \\
   |[fill=pink](n30)| \small{30} & |[fill=pink](n31)| \small{31}  & |[fill=pink](n32)| \small{32}  & |[fill=pink](n33)| \small{33}  & |[fill=pink](n34)|\small{34} & |[fill=pink](n35)|\small{35}  & |[fill=pink](n36)|\small{36}  & \small{37}  & \small{38} & \small{39}  \\
   };


   \node [matrix of nodes, nodes={draw,text height=0.4cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M) at (-6,0) {
   \small{\textbf{inode}} \\
   |(mode)| \small{mode}\\
   |(user)| \small{user}\\
   |(length)|\small{length}\\
   |(etc)| \small{\ldots} \\
   |(ptr0)| \small{ptr0} \\
   |(ptr1)| \small{ptr1} \\
   |(etcptr)| \small{\ldots} \\
   |(ptr11)| \small{ptr11} \\
   |(ptr12)| \small{Ind. ptr} \\
   |(ptr13)| \small{Doubly ind. ptr} \\
   |(ptr14)| \small{Triply ind. ptr} \\
   };

   \node[matrix of nodes, nodes={draw,text width=0.1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M2) at (0,-4) {
   |(n0a)| & |(n1a)| & |(n2a)| & |(n3a)| &  |(n4a)| & |(n5a)| & |(n6a)| & |(n7a)| \\
   |(n0b)| & |(n1b)| & |(n2b)| & |(n3b)| &  |(n4b)| & |(n5b)| & |(n6b)| & |(n7b)| \\
   |(n0c)| & |(n1c)| & |(n2c)| & |(n3c)| &  |(n4c)| & |(n5c)| & |(n6c)| & |(n7c)| \\
   |(n0d)| & |(n1d)| & |(n2d)| & |(n3d)| &  |(n4d)| & |(n5d)| & |(n6d)| & |(n7d)| \\   
   };

   
   \draw[->,color=red](ptr0.east) -- (n21);
   \draw[->,color=red](ptr1.east) -- (n22);
   \draw[->,color=red](ptr11.east) -- (n32);
   \draw[->,dashed,color=red](ptr12.east) -- (n10);
   \draw[->,dashed,color=red](n10) -- (n0a.north east);
   
   \draw[->,color=red](n0a) -- (n33);
   \draw[->,color=red](n1a) -- (n34);
   \draw[->,color=red](n2a) -- (n35);
   \draw[->,color=red](n3a) -- (n36);
   

Nous pouvons maintenant revenir à notre système de fichiers d'exemple. Celui-ci utilise dix inodes qui sont stockés dans la table des inodes. Il est représenté dans la :numref:`fig-ext2-full`.


.. _fig-ext2-full:
.. tikz:: Notre système de fichiers d'exemple en format `ext2`

   \matrix(fs) [matrix of nodes, nodes={draw,text height=0.7cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M) at (3,3) {
   |[fill=red](n0)| \small{Super} & |[fill=red](n1)| \small{FS}  &  |[fill=red](n2)|\small{Block}  & |[fill=red](n3)|\small{Bitmap}  & |[fill=red](n4)|\small{Inode} & |[fill=red](n5)|\small{Bitmap}  & |[fill=red](n6)|\small{Inode}  & |[fill=red](n7)|\small{Table}  & |[fill=gray](n8)| \small{8} & |[fill=gray](n9)| \small{9}  \\
   |[fill=gray](n10)| \small{10} & |[fill=gray](n11)|\small{11}  & |[fill=gray](n12)| \small{12}  & |[fill=gray](n13)|\small{13}  & |(n14)|\small{14} & |(n15)| \small{15}  & |(n16)|\small{16}  & |(n17)|\small{17}  & |(n18)|\small{18} & |(n19)| \small{19}  \\
   |(n20)| \small{20} & |(n21)|\small{21}  & |(n22)| \small{22}  & |(n23)|\small{23}  & |(n24)|\small{24} & |(n25)| \small{25}  & |(n26)|\small{26}  & |(n27)|\small{27}  & |(n28)|\small{28} & |(n29)| \small{29}  \\
   |[fill=yellow](n30)| \small{1} & |[fill=orange](n31)| \small{/bin/e}  &  |[fill=orange](n32)| \small{cho}  & |[fill=cyan](n33)| \small{/s}  & |[fill=yellow](n34)| \small{f}\
   & |[fill=cyan](n35)| \small{i}  & |[fill=cyan](n36)| \small{n}  & |[fill=green](n37)| \small{/t\ldots{}le}  & |[fill=cyan](n38)| \small{h} & |[fill=cyan](n39)| \small{/b}  \\
   };

   \node [matrix of nodes, nodes={draw,text height=0.4cm, text width=2.1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M) at (-6.5,0) {
   |(itable)|\small{\textbf{inode table}} \\
   |(i0)| \small{0:}\textcolor{red}{8}\\
   |(i1)| \small{1:}\textcolor{red}{9}\\
   |(i2)|\small{2:}\textcolor{red}{10}\\
   |(i3)| \small{3:}\textcolor{yellow}{34,30}\\
   |(i4)| \small{4:}\textcolor{red}{11} \\
   |(i5)| \small{5:}\textcolor{cyan}{39,35,36,33,38}\\
   |(i6)| \small{6:}\textcolor{orange}{31,32}\\
   |(i7)| \small{7:}\textcolor{red}{-1}\\
   |(i8)| \small{8:}\textcolor{red}{12}\\
   |(i9)| \small{9:}\textcolor{red}{13}\\
   |(i10)| \small{10:}\textcolor{green}{37} \\
   };


   \node[draw, rounded corners, rectangle, text width=1.5cm] (root) at (-4,-2)
	  {\textbf{1}: bin\\
	  \textbf{2}: lib\\
	  \textbf{3}: f1\\
	  \textbf{4}: tmp\\
   };

   \node[draw, rounded corners, rectangle, text width=1.5cm] (bin) at (-2,-2)
	  {\textbf{5}: sh\\
	  \textbf{6}: echo\\
   };

   \node[draw, rounded corners, rectangle, text width=1cm] (tmp) at (0,-2)
	  {\textbf{7}: file\\
	  \textbf{8}: rep\\
   };

   \node[draw, rounded corners, rectangle, text width=1cm] (rep) at (2,-2)
	  {\textbf{9}: sub\\
   };

   \node[draw, rounded corners, rectangle, text width=1.5cm] (sub) at (4,-2)
	  {\textbf{10}: file\\
   };

   \node[draw, rounded corners, rectangle, text width=1cm] (lib) at (6,-2)
	  { };

   
   
   \draw[->,color=red](n6) to [bend right=45] (itable.north);


   \draw[->,dashed,color=black] (n8.south) -- (root.north);


   \draw[->,dashed,color=black] (n9.south) -- (bin.north);


   \draw[->,dashed,color=black] (n10.south) -- (lib.north);


   \draw[->,dashed,color=black] (n11.south) -- (tmp.north);



   \draw[->,dashed,color=black] (n12.south) -- (rep.north);



   \draw[->,dashed,color=black] (n13.south) -- (sub.north);

   

Il nous reste maintenant à expliquer le rôle des deux blocs qui contiennent les bitmaps. Dans un système de fichiers de type `ext2`, il est nécessaire de savoir si un bloc de données est utilisé par un fichier/répertoire ou libre. Il en va de même pour les inodes. Une première solution pour conserver cette information serait de maintenir une liste chaînée avec les numéros des blocs de données libres ou occupés. Malheureusement, une telle liste prendrait de la place sur le dispositif de stockage et pourrait être difficile à manipuler. Une solution plus efficace pour conserver cette information est d'utiliser un `bitmap`. Le bitmap des inodes est une structure de données simple qui utilise un bit pour indiquer si un inode est libre ou occupé. La structure contient autant de bits qu'il n'y a d'inodes dans le système de fichiers. Dans notre système de fichiers d'exemple, nous avons une dizaine d'inodes et 32 blocs. Si l'on s'en réfère à la :numref:`fig-ext2-full`, le bitmap des inodes contiendrait la chaîne de bits suivante, en supposant que ``1`` corresponde à un inode occupé et que le bit de poids fort corresponde à l'inode ``0`` :

.. code-block:: console
   :caption: Bitmap des inodes
	     
   11111111 11000000		
    

Pour le bitmap des blocs on procède de la même façon. Le bit correspondant à un bloc est mis à ``1`` lorsqu'il est occupé par un fichier/répertoire et ``0`` sinon. Dans notre système de fichiers d'exemple, le bitmap des blocs serait :

.. code-block::
   :caption: Bitmap des blocs
   
   11111100 00000000 00000011 11111111

   

.. source: https://github.com/torvalds/linux/blob/master/fs/ext2/ext2.h
  
.. voir https://web.mit.edu/tytso/www/linux/ext2intro.html


Maintenant que nous avons décrit les principaux éléments du système de fichiers `ext2`, il est intéressant de voir plus en détails toutes les opérations qui doivent être réalisées sur le système de fichiers pour lire des données, écrire des données et créer un fichier.


Commençons par la lecture des données dans un fichier. Pour accéder aux données d'un fichier, le système de fichier doit d'abord accéder à l'inode qui le décrit. Cet inode est référencé dans l'entrée du répertoire qui correspond au fichier. Avant de lire le fichier, il faut vérifier qu'il s'agit bien d'un fichier et que l'utilisateur dispose des permissions de lecture sur ce fichier. Cette information est présente dans le champ ``mode`` de l'inode. Ensuite, le système de fichiers va parcourir la liste des pointeurs directs et indirects pour pouvoir accéder aux différents blocs de données qui composent le fichier. Grâce au  champ ``length`` de l'inode, le système de fichiers pourra arrêter la lecture des données au dernier octet utile du fichier. Il faut aussi mettre à jour la date de dernier accès au fichier dans l'inode.

Les opérations d'écriture dans un fichier sont assez similaires sauf lorsqu'il faut ajouter un nouveau bloc à un fichier existant. Dans ce cas, le système de fichier va d'abord consulter le bitmap des blocs pour trouver un bloc libre. Pour améliorer les performances du système de fichiers, il est généralement utile de placer les blocs d'un fichier dans des zones contiguës, mais si les blocs qui suivent ceux utilisés par le fichier sont déjà occupés, rien n'empêche le système de fichiers de choisir un bloc dans une autre partie du dispositif de stockage. Une fois ce bloc choisi, il faut le référencer dans l'inode du fichier et mettre à jour la longueur du fichier (en blocs et en octets). Si il reste un pointeur direct de libre dans l'inode, il suffit de le modifier pour référencer le nouveau bloc. Sinon, il peut être nécessaire d'obtenir un nouveau bloc pour stocker un pointeur indirect, doublement indirect ou triplement indirect. Dans les trois cas, cela nécessite de trouver un nouveau bloc via le bitmap des blocs, mettre à jour ce bitmap et référencer ce bloc correctement. Il faut aussi mettre à jour les dates de dernière modification et d'accès au fichier dans l'inode. 

Les opérations de création de fichier sont les plus complexes. Pour créer un nouveau fichier et y stocker des données, il faut d'abord trouver un inode de libre. Cela se fait en consultant le bitmap des inodes. On peut ensuite commencer à remplir l'inode avec les informations relatives au propriétaire du fichier, ... Ce fichier peut maintenant être référencé dans un répertoire. Si le bloc qui contient le répertoire est incomplet, il suffit d'ajouter l'entrée au répertoire. Si le bloc est complet, il faut consulter le bitmap des blocs pour trouver un nouveau bloc de libre, le marquer comme occupé, et l'ajouter dans l'inode du répertoire. Ensuite, il faut trouver dans le bitmap des blocs les blocs libres nécessaires au nouveau fichier et les référencer dans l'inode de ce nouveau fichier.


.. note:: Un même fichier peut se retrouver dans plusieurs répertoires

   Les systèmes de fichiers utilisant les inodes ont une caractéristique que nous n'avons pas encore analysé. Comme une entrée de répertoire contient un nom de fichier/répertoire et le numéro de l'inode correspondant, il est possible qu'un même fichier soit accessible depuis plusieurs répertoires différents. Ce n'est pas une erreur, mais une optimisation introduite par les concepteurs de Unix. Sous Unix/Linux, c'est la commande `ln <https://www.man7.org/linux/man-pages/man1/ln.1.html>`_ qui permet de créer des liens vers des fichiers. Si l'on reprend l'exemple de la :numref:`fig-ext2-full` et que l'on crée un lien vers le fichier ``echo`` dans les répertoires ``/tmp`` et ``lib``, on obtiendra l'arborescence reprise en :numref:`fig-ext2-arbre-ln` et le système de fichiers sera modifié comme décrit dans la :numref:`fig-ext2-full-bis`. Dans ce système de fichier, les noms ``/bin/echo``, ``/tmp/echo`` et ``/lib/echo`` correspondent tous les trois au fichier qui est référencé par l'inode ``6``. 
   
    .. _fig-ext2-arbre-ln:
    .. tikz:: Arborescence des répertoires et fichiers de notre système `ext2`


	      \node (racine) [draw, rounded corners, rectangle] {\textbf{0}:/};
	      \node (bin) [right =of racine, draw, rounded corners, rectangle] {\textbf{1}:bin};
	      \node (lib) [below =of bin, draw, rounded corners, rectangle] {\textbf{2}:lib};
	      \node (f1) [below =of lib, draw, rectangle] {\textbf{3}:f1};	  
	      \node (tmp) [below =of f1, draw, rounded corners, rectangle] {\textbf{4}:tmp};
   
	      \node (sh) [below right= of bin, draw, rectangle] {\textbf{5}:sh};
	      \node (echo) [below = of sh, draw, rectangle] {\textbf{6}:echo};	  

	      \node (tmpfile) [below right= of tmp, draw, rectangle] {\textbf{7}:file};
	      \node (rep) [below =of tmpfile, draw, rounded corners, rectangle] {\textbf{8}:rep};

	      \node (sub) [below right =of rep, draw, rounded corners, rectangle] {\textbf{9}:sub};

	      \node (subfile) [below right=of sub, draw, rectangle] {\textbf{10}:file};

	      \draw[->](racine) -- (bin);
	      \draw[->](racine) -- (tmp);
	      \draw[->](racine) -- (lib);
	      \draw[->](racine) -- (f1);
       
	      \draw[->](bin) -- (sh);
   
	      \draw[->,color=red](bin) -- (echo);
	      \draw[->,color=red](lib) -- (echo);
	      \draw[->,color=red](tmp) -- (echo);
	      
	      \draw[->](tmp) -- (tmpfile);

	      \draw[->](tmp) -- (rep);
	      
	      \draw[->](rep) -- (sub);

	      \draw[->](sub) -- (subfile);


	      
   Pour pouvoir gérer ces liens, le système de fichiers utilise le champ `nombre de liens vers le fichier` qui se trouve dans l'inode. Quand un fichier est créé, ce champ est initialisé à la valeur ``1``. Cette valeur indique qu'il existe un seul lien vers le fichier qui est représenté par cet inode. Si un deuxième répertoire fait référence à cet inode, alors ce champ passera à la valeur ``2``. Ce champ est important lors des opérations de suppression des fichiers. Quand un fichier est effacé d'un répertoire, le système de fichiers décrémente d'abord le champ contenant le nombre de liens vers le fichier. Si celui-ci passe à zéro, alors l'inode et les blocs utilisés par le fichier sont marqués comme libres et les bitmaps sont mis à jour. Sinon, cela signifie que le fichier est encore référencé dans au moins un autre répertoire. Il est important de noter que lorsque plusieurs liens existent vers le même fichier, tout accès en écriture à ce fichier est directement visible depuis tous les répertoires qui y font référence. 
   

    

  .. _fig-ext2-full-bis:
  .. tikz:: Notre système de fichiers d'exemple en format `ext2` avec deux liens pour le fichier ``echo``

     \matrix(fs) [matrix of nodes, nodes={draw,text height=0.7cm, text width=1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M) at (3,3) {
     |[fill=red](n0)| \small{Super} & |[fill=red](n1)| \small{FS}  &  |[fill=red](n2)|\small{Block}  & |[fill=red](n3)|\small{Bitmap}  & |[fill=red](n4)|\small{Inode} & |[fill=red](n5)|\small{Bitmap}  & |[fill=red](n6)|\small{Inode}  & |[fill=red](n7)|\small{Table}  & |[fill=gray](n8)| \small{8} & |[fill=gray](n9)| \small{9}  \\
     |[fill=gray](n10)| \small{10} & |[fill=gray](n11)|\small{11}  & |[fill=gray](n12)| \small{12}  & |[fill=gray](n13)|\small{13}  & |(n14)|\small{14} & |(n15)| \small{15}  & |(n16)|\small{16}  & |(n17)|\small{17}  & |(n18)|\small{18} & |(n19)| \small{19}  \\
     |(n20)| \small{20} & |(n21)|\small{21}  & |(n22)| \small{22}  & |(n23)|\small{23}  & |(n24)|\small{24} & |(n25)| \small{25}  & |(n26)|\small{26}  & |(n27)|\small{27}  & |(n28)|\small{28} & |(n29)| \small{29}  \\
     |[fill=yellow](n30)| \small{1} & |[fill=orange](n31)| \small{/bin/e}  &  |[fill=orange](n32)| \small{cho}  & |[fill=cyan](n33)| \small{/s}  & |[fill=yellow](n34)| \small{f}\
     & |[fill=cyan](n35)| \small{i}  & |[fill=cyan](n36)| \small{n}  & |[fill=green](n37)| \small{/t\ldots{}le}  & |[fill=cyan](n38)| \small{h} & |[fill=cyan](n39)| \small{/b}  \\
     };

     \node [matrix of nodes, nodes={draw,text height=0.4cm, text width=2.1cm}, nodes in empty cells,column sep=-\pgflinewidth,row sep=-\pgflinewidth](M) at (-6.5,0) {
     |(itable)|\small{\textbf{inode table}} \\
     |(i0)| \small{0:}\textcolor{red}{8}\\
     |(i1)| \small{1:}\textcolor{red}{9}\\
     |(i2)|\small{2:}\textcolor{red}{10}\\
     |(i3)| \small{3:}\textcolor{yellow}{34,30}\\
     |(i4)| \small{4:}\textcolor{red}{11} \\
     |(i5)| \small{5:}\textcolor{cyan}{39,35,36,33,38}\\
     |(i6)| \small{6\textbf{[ln=3]}:}\textcolor{orange}{31,32}\\
     |(i7)| \small{7:}\textcolor{red}{-1}\\
     |(i8)| \small{8:}\textcolor{red}{12}\\
     |(i9)| \small{9:}\textcolor{red}{13}\\
     |(i10)| \small{10:}\textcolor{green}{37} \\
     };


     \node[draw, rounded corners, rectangle, text width=1.5cm] (root) at (-4,-2)
	  {\textbf{1}: bin\\
	  \textbf{2}: lib\\
	  \textbf{3}: f1\\
	  \textbf{4}: tmp\\
     };

     \node[draw, rounded corners, rectangle, text width=1.5cm] (bin) at (-2,-2)
	  {\textbf{5}: sh\\
	  \textbf{6}: echo\\
     };
	  
     \node[draw, rounded corners, rectangle, text width=1.5cm] (tmp) at (0,-2)
	  {\textbf{7}: file\\
	  \textbf{8}: rep\\
	  \textbf{6}: echo\\
     };

     \node[draw, rounded corners, rectangle, text width=1cm] (rep) at (2,-2)
	  {\textbf{9}: sub\\
     };

     \node[draw, rounded corners, rectangle, text width=1.5cm] (sub) at (4,-2)
	  {\textbf{10}: file\\
     };

     \node[draw, rounded corners, rectangle, text width=1.5cm] (lib) at (6,-2)
	  {
	  \textbf{6}: echo\\
     };
   
     \draw[->,color=red](n6) to [bend right=45] (itable.north);
     \draw[->,dashed,color=black] (n8.south) -- (root.north);
     \draw[->,dashed,color=black] (n9.south) -- (bin.north);
     \draw[->,dashed,color=black] (n10.south) -- (lib.north);
     \draw[->,dashed,color=black] (n11.south) -- (tmp.north);
     \draw[->,dashed,color=black] (n12.south) -- (rep.north);
     \draw[->,dashed,color=black] (n13.south) -- (sub.north);



Tout comme pour le système de fichiers utilisant une table d'allocation, un système utilisant des inodes doit pouvoir survivre à plusieurs types de perturbations. Les premiers problèmes à considérer sont la perte d'un bloc. Si un bloc du système de fichiers devient illisible, quel impact cela peut-il avoir sur le système de fichiers. La seconde classe de problèmes est un système de fichiers qui se trouve dans un état incohérent car l'ordinateur qui le gérait a été arrêté brusquement alors qu'il était en train d'écrire sur le dispositif de stockage les modifications de blocs relatives à une opération. Tous ces problèmes ajoutent une couche importante de complexité aux systèmes de fichiers et à leur implémentation dans les systèmes d'exploitation. Chaque système d'exploitation contient des utilitaires spécialisés pour récupérer partiellement ou totalement un système de fichiers incohérent. C'est le cas notamment de `fsck <https://www.man7.org/linux/man-pages/man8/fsck.8.html>`_ sous Linux ou de `chkdsk <https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/chkdsk?tabs=event-viewer>`_ sous Windows.

.. spelling:word-list::

   FS
   Block
   descriptor
   blocks
   
Commençons par analyser l'impact de la perte d'un bloc. Les deux premiers blocs, le Super Block et le FS descriptor, sont critiques car ils contiennent les paramètres du système de fichiers. Ils définissent notamment le nombre de blocs sur le dispositif de stockage, le nombre d'inodes et la taille de chaque bloc. Si ces blocs deviennent inutilisables, le système de fichiers l'est aussi. Pour faire face à ce risque, la solution la plus fréquente est de stocker une copie de ces deux blocs dans une autre partie du disque. Cette copie doit évidemment être mise à jour à chaque modification des blocs primaires.

Les bitmaps jouent un rôle important dans le fonctionnement du système de fichiers. Si une partie du bitmap des blocs devenait inaccessible, alors le système de fichiers ne saurait plus quels blocs sont libres. Un utilitaire spécialisé pourrait récupérer cette panne en parcourant les blocs contenant les inodes pour voir quels inodes sont utilisés. Cela suppose que lorsqu'un fichier est effacé son inode est marqué comme étant libre sur le disque et dans le bitmap des inodes. Cela peut se faire par exemple en mettant certains champs de l'inode à une valeur de référence comme 0.

Si le bitmap des blocs est affecté par une erreur, la situation est un peu différente. Il faudra dans ce cas parcourir tous les inodes pour voir quels sont les blocs du dispositif de stockage qui sont référencés et reconstruire le bitmap des blocs. Ce bitmap peut ensuite être recopié dans une autre partie du dispositif de stockage. Si un bloc contenant un répertoire est devenu illisible, les fichiers et les sous-répertoires de ce répertoire ne seront plus accessibles. Il faudra faire appel à un utilitaire spécialisé pour les récupérer. Si un bloc contenant des données est illisible, le fichier correspondant devient malheureusement aussi illisible.

Les incohérences du système de fichier sont plus complexes. Elles dépendent de l'ordre dans lequel les opérations de modification au système de fichiers sont réalisées et également du moment auquel l'ordinateur est arrêté. Pour récupérer ces incohérences, les logiciels spécialisés procèdent généralement en deux phases. Tout d'abord, ils doivent lire tous les blocs de contrôle (Super Block, FS descriptor, Inode Bitmap, Block Bitmap et Inode Table) du système de fichiers. Ensuite, il faut vérifier la cohérence entre d'abord le bitmap des inodes et l'information lue dans la table des inodes. En cas d'incohérence, ce sont les inodes qui seront considérés comme valides. L'étape suivante est de comparer le bitmap des blocs avec les blocs référencés dans les inodes. La troisième étape sera d'analyser l'arborescence des répertoires et fichiers. Cette structure doit être un arbre et non un graphe contenant des cycles. Si un cycle est détecté, il devra être supprimé généralement avec l'aide de l'utilisateur. En comparant la liste des inodes et les inodes référencés dans les répertoires, il est possible que l'on trouve un ou des inodes qui ne sont pas repris dans l'arborescence. Ces fichiers et répertoires seront recréés avec un nom générique et placé dans le répertoire ``/lost+found``. L'administrateur du système de fichiers pourra consulter le contenu de ces fichiers pour déterminer si ils doivent être conservés ou peuvent être effacés du système de fichiers.

.. spelling:word-list::

   inode
   inodes
   Inode
   L'inode
   d'inode
