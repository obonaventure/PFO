.. -*- coding: utf-8 -*-
.. LSINC1102 documentation master file, created by
   sphinx-quickstart on Tue Jan 28 18:06:33 2020.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.


Le minuscule ordinateur
=======================

Nous avons maintenant tous les composants qui sont nécessaires pour construire notre minuscule ordinateur. Celui-ci sera composé de :

 - un minuscule processeur supportant le langage d'assemblage décrit dans les chapitres précédents
 - une mémoire RAM qui contiendra les données manipulées par le minuscule processeur
 - une mémoire ROM qui contiendra les programmes exécutés par le minuscule processeur
 - un clavier qui nous servira d'exemple de dispositif d'entrée
 - un écran qui nous servira d'exemple de dispositif de sortie  

Ces différents composants interagissent entre eux lors de l'exécution de programmes. Le minuscule processeur lit des données en mémoire RAM ainsi que des instructions en mémoire ROM. Il est aussi capable de lire le code ASCII d'une touche poussée sur le clavier. Le minuscule processeur est aussi capable d'écrire de l'information en mémoire RAM et d'afficher des pixels à l'écran.

Pour que les différents composants de notre minuscule ordinateur puissent interagir entre eux, il est nécessaire qu'ils soient reliés par des fils électriques permettant d'échanger des données et des adresses. Même si notre minuscule ordinateur ne dispose que d'une mémoire, d'un écran et d'un clavier, connecter directement le minuscule CPU à chacun de ces dispositifs nécessiterait un trop grand nombre de pins sur le minuscule CPU. Ce problème a été résolu par l'industrie informatique en utilisant ce que l'on appelle un :term:`bus`. Un :term:`bus` est un ensemble de lignes de communications qui facilite l'échange d'information entre dispositifs se trouvant dans un ordinateur donné ou qui sont connectés à cet ordinateur. Au fil des années, l'industrie a développé de nombreux types de bus standardisés qui permettent à des vendeurs différents de produire des composants et cartes d'extension qui peuvent être connectés à des microprocesseurs différents. Parmi les bus de communication les plus connus, on peut citer :

 - le bus `ISA <https://en.wikipedia.org/wiki/Industry_Standard_Architecture>`_ utilisé sur les premiers IBM PCs
 - le bus `PCI <https://en.wikipedia.org/wiki/Peripheral_Component_Interconnect>`_ utilisé par de nombreux PC
 - le bus `SCSI <https://en.wikipedia.org/wiki/SCSI>`_ souvent utilisé pour connecter des dispositifs de stockage et d'entrées/sorties
 - le bus `SATA <https://en.wikipedia.org/wiki/Serial_ATA>`_ utilisé pour connecter de nombreux dispositifs de stockage comme des disques durs ou des lecteurs SSD

Un tel bus de communication permet de connecter plusieurs composants sur le même canal de communication. Comme plusieurs composants sont connectés sur ce canal de communication, il est possible que plusieurs d'entre eux cherchent à envoyer de l'information simultanément. Le spécification du bus définit comment ces conflits sont gérés, mais cela sort du cadre de ce cours introductif. Le point important est qu'un tel bus permet à plusieurs composants de communiquer efficacement en minimisant le nombre de pins utilisées sur chacun de ces composants. Chacun de ces bus définit précisément les différents types de signaux qui peuvent être échangés à travers lui. En pratique, ces signaux sont généralement de trois types :

 - des données brutes
 - des adresses
 - des informations de contrôle comme un signal d'horloge, un signal indiquant une opération d'écriture ou de lecture, etc.
   
Chaque bus permet l'échange de ces trois types d'information entre tous les composants qui y sont connectés. La :numref:`fig-arch` décrit l'organisation générale d'un tel bus. 

.. _fig-arch:
.. tikz:: Architecture du minuscule ordinateur
   :libs: positioning 

   [comp/.style={rectangle,rounded corners=5pt,minimum height=2cm,node distance=1.5cm,draw},
    bus/.style={rectangle,fill=gray, minimum width=13cm,align=left, minimum height=0.3cm,draw},
   ]

   \node[comp] (ROM) {ROM};
   \node[comp] (CPU) [right=of ROM] {CPU};
   \node[comp] (RAM) [right=of CPU] {RAM};
   \node[comp] (Ecran) [right=of RAM] {Ecran};
   \node[comp] (clavier) [right=of Ecran] {clavier};

   \node[bus] (bus-data) [below= of RAM] {Bus [données]};
   \node[bus] (bus-addr) [below= of bus-data] {Bus [adresses]};
   \node[bus] (bus-ctrl) [below= of bus-addr] {Bus [contrôle]};

   \coordinate (CPU1) at ($(CPU.south)+(-0.3,0)$);
   \coordinate (CPU2) at ($(CPU.south)+(0.3,0)$);
   \draw[thick,<->,color=blue] (CPU1) -- ($(CPU1) + (0,-1)$); 
   \draw[thick,<-,color=red] (CPU.south) -- ($(CPU.south)+(0,-2.8)$);
   \draw[thick,<->,color=green] ($(CPU.south)+(0.3,0)$) -- ($(CPU.south)+(0.3,-4.4)$) ;

   
   \draw[thick,<->,color=blue] ($(RAM.south)+(-0.3,0)$) -- ($(-0.3,0)+(bus-data.north)$);
   \draw[thick,<-,color=red] (RAM.south) -- (bus-addr.north);
   \draw[thick,<->,color=green] ($(RAM.south)+(0.3,0)$) -- ($(0.3,0)+(bus-ctrl.north)$);
   
   \draw[thick,<-,color=blue] ($(Ecran.south)+(-0.3,0)$) -- ($(Ecran.south)+(-0.3,-1)$);
   \draw[thick,<-,color=red] (Ecran.south) -- ($(Ecran.south)+(0,-2.8)$);
   \draw[thick,<->,color=green] ($(Ecran.south)+(0.3,0)$) -- ($(Ecran.south)+(0.3,-4.4)$) ;

   \draw[thick,->,color=blue] ($(clavier.south)+(-0.3,0)$) -- ($(clavier.south)+(-0.3,-1)$);
   \draw[thick,<-,color=red] (clavier.south) -- ($(clavier.south)+(0,-2.8)$);
   \draw[thick,<->,color=green] ($(clavier.south)+(0.3,0)$) -- ($(clavier.south)+(0.3,-4.4)$) ;
   

   \draw[thick,->] (CPU.180) -- (ROM.east) node[midway, below] {addr};;
   \draw[thick,<-] (CPU.160) -- (ROM.20) node[midway, above] {data};;


.. note::

   Le livre de référence a choisi, pour simplifier la réalisation des circuits électroniques, une :term:`architecture Harvard` dans laquelle le microprocesseur est connecté à deux mémoires distinctes :

     - une mémoire de type ROM contenant les instructions
     - une mémoire de type RAM contenant les données

   Ce choix simplifie la réalisation du minuscule ordinateur, mais poserait plusieurs problèmes à un microprocesseur actuel. Premièrement, en stockant le programme à exécuter dans une ROM, on force l'exécution du même programme, cela limite fortement la flexibilité de l'ordinateur. On pourrait bien entendu remplacer cette mémoire ROM par une mémoire de type RAM. Si l'on faisait cette modification, il faudrait également que l'on modifie le microprocesseur pour lui ajouter des instructions qui lui permettent d'écrire dans la mémoire contenant les instructions. Ce n'est pas le cas actuellement. Une autre problème lié à l'utilisation de deux mémoires séparées est qu'il est nécessaire de placer sur le microprocesseur des connexions d'adresse et de données pour la mémoire de données et la mémoire d'instruction. Cela double le nombre de connexions qui doivent être installées sur le microprocesseur. Si l'on veut construire le minuscule processeur sous la forme d'une puce électronique, il faudrait prévoir 16 fils pour recevoir l'instruction, 15 fils pour l'adresse en mémoire ROM mais aussi 16 fils pour l'adresse en mémoire RAM et 16 fils pour la donnée venant de cette mémoire. En combinant les mémoires de données et d'instruction, on divise par deux le nombre de fils qui doivent être connectés au microprocesseur. C'est très important au niveau de leur construction.

   Les ordinateurs actuels utilisent l':term:`architecture de von Neumann` dans laquelle les programmes et les données sont stockées dans la même mémoire. Cette architecture avait été proposée par John von Neumann en 1945.


   

Le minuscule CPU
----------------



Pour pouvoir construire notre minuscule CPU il est important de bien identifier les différents signaux d'entrée qu'il va devoir traiter ainsi que les valeurs de sortie qu'il va produire. Ces signaux sont naturellement liés aux instructions que notre CPU va exécuter.

Le premier signal d'entrée de notre CPU sera un mot de 16 bits contenant l'instruction à exécuter en binaire (le livre utilise `instruction` comme nom pour cet ensemble de 16 bits). Cette entrée sera lue à chaque cycle d'horloge par notre CPU pour décoder l'instruction courante. Cela nous permettra d'exécuter une instruction de type ``A`` ou une instruction telle que ``D=D+1``. Ce n'est cependant pas suffisant car certaines instructions font référence à un mot de 16 bits se trouvant à l'adresse contenue dans le registre ``A``. C'est le cas d'une instruction telle que ``D=M-1``. Pour supporter ces instructions, notre minuscule CPU devra, durant certains cycles d'horloge, lire le contenu d'un mot en mémoire à l'adresse se trouvant dans le registre ``A``. Le livre utilise `inM` comme nom pour cet ensemble de 16 bits.

Nous pouvons maintenant réfléchir aux sorties du minuscule CPU. La valeur calculée par son ALU peut être stockée en mémoire. C'est le cas lors de l'exécution d'instructions telles que ``M=D+1``  ou ``M=M+D``. Cela nécessite un ensemble de seize lignes de sortie que le livre nomme `outM`. Outre la valeur calculée par l'ALU, notre CPU doit aussi pouvoir spécifier une adresse mémoire à laquelle la donnée doit être écrite. Cela nécessite quinze bits puisque la mémoire RAM ne contient que :math:`2^{15}` mots de 16 bits. Le livre utilise le nom `addressM` pour cette sortie. Ces deux sorties sont connectées à la mémoire RAM, mais elles ne sont pas suffisantes. Il nous reste un petit détail à régler. Lors de l'exécution d'une instruction telle que ``M=D-1``, la valeur émise sur les signaux `outM` doit être stockée à l'adresse correspondant à la sortie `addressM`. Par contre, lors de l'exécution de l'instruction `D=A+1`, aucune information ne doit être stockée en mémoire RAM, même si une valeur (éventuellement `0`) est émise sur les signaux `outM` et `addressM`. Pour éviter tout risque de confusion au niveau de la mémoire, notre minuscule CPU définit un signal de contrôle baptisé `writeM` qui est mis à `1` lorsque la valeur se trouvant sur `outM` doit être écrite en mémoire à l'adresse `addressM` et `0` sinon.

Les interactions entre le minuscule CPU et le reste de l'ordinateur sont maintenant presque complètes. Il nous reste à gérer le chargement des instructions depuis la mémoire ROM. Comme celle-ci contient :math:`2^{15}` mots, nous avons besoin de 15 bits de sortie, baptisées `PC` sur notre minuscule CPU. Cette sortie sera naturellement connectée à la mémoire ROM qui retourne l'instruction lue sur les lignes `instruction` de notre CPU. La sortie `PC` sera directement connectée au registre ``PC`` de notre CPU. Il nous reste un dernier détail à régler. En cas de problème comme une boucle infinie ou un comportement bizarre, il est utile d'équiper notre minuscule ordinateur d'un signal `reset`. Sur une machine réelle, celui-ci serait par exemple relié à un bouton poussoir qui est connecté au minuscule CPU. Lorsque ce signal d'entrée passe à `1`, le minuscule CPU doit automatiquement arrêter l'exécution du programme en cours et redémarrer à l'instruction se trouvant à l'adresse ``0``. Il nous suffira pour cela de forcer une initialisation à `0` du registre `PC` lorsque le signal d'entrée `reset` est mis à `1`.

La :numref:`fig-cpu` résume les signaux d'entrée et de sortie du minuscule CPU.

.. _fig-cpu:
.. tikz:: Minuscule CPU
   :libs: positioning 

   \fill[gray] (0,0) -- (0,-6) -- (2, -5) -- (2,-1) -- cycle;
   \node at (1,-3) (CPU) {\textbf{CPU}};   
   \node at (-2,-1) (inM) {inM};
   \node at (-2,-2) (instruction) {instruction};
   \node at (-2,-4) (reset) {reset};

   \node at (4,-1.5) (outM) {outM};
   \node at (4,-2.5) (writeM) {writeM};
   \node at (4,-3.5) (addressM) {addressM};
   \node at (4,-4.5) (pc) {pc};


   \node at (0,-1) (inMCPU) {};
   \node at (0,-2) (instructionCPU) {};
   \node at (0,-4) (resetCPU) {};

   \node at (2,-1.5) (outMCPU) {};
   \node at (2,-2.5) (writeMCPU) {};
   \node at (2,-3.5) (addressMCPU) {};
   \node at (2,-4.5) (pcCPU) {};

 

      
   \draw[->, color=blue] (inM) -- (inMCPU.east) node[midway, below] {16};
   \draw[->, color=green] (instruction) -- (instructionCPU.east) node[midway, below] {16};
   \draw[->, color=red] (reset) -- (resetCPU.east) node[midway, below] {1};
   \draw[->, color=blue] (outMCPU.west) -- (outM) node[midway, below] {16};
   \draw[->, color=blue] (writeMCPU.west) -- (writeM) node[midway, below] {1};
   \draw[->,color=blue] (addressMCPU.west) -- (addressM) node[midway, below] {15};
   \draw[->,color=green] (pcCPU.west) -- (pc) node[midway, below] {15};


Nous avions précédemment construit la mémoire RAM que nous pouvons connecter à notre minuscule CPU. Notre mémoire avait une capacité de 16K mots de 16 bits. Elle utilise 14 bits d'adresse (entrée `address`). Elle dispose aussi d'une entrée sur 16 bits (`in`). Le mot de 16 bits présent sur cette entrée est écrit en mémoire RAM lorsque le signal de contrôle `loadRAM` est mis à `1`. Enfin, la mémoire dispose d'une sortie (`out`) sur seize bits également.

Nous pouvons maintenant connecter la mémoire RAM avec le minuscule CPU. Il suffit pour cela de relier la sortie `addressM` du CPU à l'entrée `address` de notre mémoire RAM. De même, la sortie `outM` du CPU doit être connectée à  l'entrée `in` de la mémoire RAM. La sortie de la mémoire RAM doit elle être reliée à l'entrée `inM` du minuscule CPU. Il nous reste enfin à relier la sortie `writeM` du minuscule CPU à l'entrée `loadRAM` de notre RAM. Cette interconnexion est représentée en :numref:`fig-cpu-ram`. Il nous faudra ensuite ajouter l'écran et le clavier pour compléter notre ordinateur.

.. _fig-cpu-ram:
.. tikz:: Connexions entre le minuscule CPU et la RAM
   :libs: positioning 

   \fill[gray] (0,0) -- (0,-6) -- (2, -5) -- (2,-1) -- cycle;
   \node at (-2,-1) (inM) {};
   \node at (-2,-2) (instruction) {instruction};
   \node at (-2,-4) (reset) {reset};
   \node at (1,-3) (CPU) {\textbf{CPU}};   
   \node at (4,-1.5) (outM) {};
   \node at (4,-2.5) (writeM) {};
   \node at (4,-3.5) (addressM) {};
   \node at (4,-4.5) (pc) {pc};


   \node at (0,-1) (inMCPU) {};
   \node at (0,-2) (instructionCPU) {};
   \node at (0,-4) (resetCPU) {};

   \node at (2,-1.5) (outMCPU) {};
   \node at (2,-2.5) (writeMCPU) {};
   \node at (2,-3.5) (addressMCPU) {};
   \node at (2,-4.5) (pcCPU) {};

   \fill[lightgray] (5,0) -- (5,-6) -- (7, -6) -- (7,0) -- (5,0) -- cycle;
   \node at (6,-3) (RAM) {\textbf{RAM}};
   \node at (5,-1.5) (in) {};
   \node at (5,-2.5) (loadRAM) {};
   \node at (5,-3.5) (address) {};
   \node at (7,-3) (out) {};
      
   \draw[->, color=blue] (out) -| (8,2) -| (inM) |- (inMCPU.east) node[midway, below] {16};
   \draw[->, color=green] (instruction) -- (instructionCPU.east) node[midway, below] {16};
   \draw[->, color=red] (reset) -- (resetCPU.east) node[midway, below] {1};
   \draw[->, color=blue] (outMCPU.west) -- (in) node[midway, below] {16};
   \draw[->, color=blue] (writeMCPU.west) -- (loadRAM) node[midway, below] {1};
   \draw[->,color=blue] (addressMCPU.west) -- (address) node[midway, below] {15};
   \draw[->,color=green] (pcCPU.west) -- (pc) node[midway, below] {15};

   
Il ne nous reste plus qu'à relier le minuscule CPU à la mémoire ROM. Pour cela, il suffit de relier la sortie de la ROM à l'entrée `instruction` du CPU et la sortie `pc` du CPU à l'entrée `address` de cette ROM. Les interconnexions entre le minuscule CPU et les mémoires sont représentées en :numref:`fig-cpu-ram-rom`.

.. _fig-cpu-ram-rom:
.. tikz:: Connexions entre le minuscule CPU et les mémoires
   :libs: positioning 

   \fill[gray] (0,0) -- (0,-6) -- (2, -5) -- (2,-1) -- cycle;
   \node at (-2,-1) (inM) {};
   \node at (-2,-2) (instruction) {};
   \node at (-2,-4) (reset) {reset};
   \node at (1,-3) (CPU) {\textbf{CPU}};   
   \node at (4,-1.5) (outM) {};
   \node at (4,-2.5) (writeM) {};
   \node at (4,-3.5) (addressM) {};
   \node at (4,-4.5) (pc) {};


   \node at (0,-1) (inMCPU) {};
   \node at (0,-2) (instructionCPU) {};
   \node at (0,-4) (resetCPU) {};

   \node at (2,-1.5) (outMCPU) {};
   \node at (2,-2.5) (writeMCPU) {};
   \node at (2,-3.5) (addressMCPU) {};
   \node at (2,-4.5) (pcCPU) {};

   \fill[lightgray] (5,0) -- (5,-6) -- (7, -6) -- (7,0) -- (5,0) -- cycle;
   \node at (6,-3) (RAM) {\textbf{RAM}};
   \node at (5,-1.5) (in) {};
   \node at (5,-2.5) (loadRAM) {};
   \node at (5,-3.5) (address) {};
   \node at (7,-3) (out) {};
      
   \draw[->, color=blue] (out) -|  node[midway, below] {16} (8,2) -| (inM) |- (inMCPU.east);

   \draw[->, color=red] (reset) -- (resetCPU.east) node[midway, below] {1};
   \draw[->, color=blue] (outMCPU.west) -- (in) node[midway, below] {16};
   \draw[->, color=blue] (writeMCPU.west) -- (loadRAM) node[midway, below] {1};
   \draw[->,color=blue] (addressMCPU.west) -- (address) node[midway, below] {15};


   \fill[lightgray] (-4,0) -- (-4,-6) -- (-6, -6) -- (-6,0) -- (-4,0) -- cycle;
   \node at (-5,-3) (ROM) {\textbf{ROM}};
   \node at (-6,-3) (addrROM) {};
   \node at (-4,-3) (outROM) {};

   \draw[->, color=green] (pcCPU.west) -| (3,-6.5) -- node[midway, below] {15} (-6.5,-6.5) |- (addrROM) ;
   \draw[->, color=green] (outROM) -- (instructionCPU.east) node[midway, below] {16};


Construction du minuscule CPU
-----------------------------

Avant de commencer à construire le minuscule CPU, nous devons d'abord réfléchir à la façon dont celui-ci va exécuter les instructions qui se trouvent en mémoire ROM. Notre objectif est de pouvoir exécuter une instruction se trouvant en mémoire ROM durant chaque cycle d'horloge. Durant chacun de ces cycles d'horloge, notre minuscule processeur devra procéder comme représenté sur la :numref:`fig-fetch-decode-execute`. Premièrement, le minuscule processeur doit charger (`fetch` en anglais) l'instruction à exécuter à l'adresse contenue dans le registre ``PC``. Ensuite, il faut décoder cette instruction. Enfin, il faut exécuter cette exécution et par exemple charger ou sauver un mot en mémoire. 


.. _fig-fetch-decode-execute:

.. tikz:: Le cycle Fetch-Decode-Execute
   :libs: positioning 

   [comp/.style={rectangle,rounded corners=5pt,draw}
   ]

   \node[comp] (Fetch) {Fetch};
   \node[comp] (Decode) [below=of Fetch] {Decode};
   \node[comp] (Execute) [below=of Decode] {Execute};

   \draw[->] (Fetch.south) -- (Decode.north);
   \draw[->] (Decode.south) -- (Execute.north);
   \draw[->] (Execute.south) |- ($(-0.7,-0.5)+(Execute.south)$) |- ($(Fetch.north)+(0,0.5)$) -- (Fetch.north) ;
   


Nous pouvons maintenant commencer la construction du minuscule CPU. Pour cela, nous pouvons réutiliser les circuits construits dans les précédents chapitres :

 - une ALU
 - un registre ``A``
 - un registre ``D``
 - un registre pour stocker la valeur du ``PC``   
   

Chacun de ces éléments de base pourra être utilisé lors de l'exécution d'une instruction particulière. Pour rappel notre ALU dispose de huit entrées et trois sorties. Les entrées sont :

 - le premier mot de seize bits (`x`)
 - le second mot de seize bits (`y`)
 - le signal de contrôle `zx` qui indique si l'entrée `x` doit être mise à zéro
 - le signal de contrôle `zy` qui indique si l'entrée `y` doit être mise à zéro  - le signal de contrôle `nx` qui indique si l'entrée `x` doit être inversée
 - le signal de contrôle `ny` qui indique si l'entrée `y` doit être inversée
 - le signal de contrôle `f` qui permet de choisir entre le résultat de l'additionneur et celui de la porte `AND` comme sortie de l'ALU
 - le signal de contrôle `no` qui détermine si la sortie doit être inversée ou non

Les trois sorties de l'ALU sont :

 - le mot de seize bits qui est le résultat du calcul
 - le signal de contrôle `zr` qui est mis à `1` si le résultat du calcul est égal à zéro
 - le signal de contrôle `ng` qui est mis à `1` si le résultat du calcul est négatif  
   

Il ne nous reste plus qu'à connecter ces différents composants ensemble de façon à pouvoir supporter toutes les instructions que nous avons présenté dans les chapitres précédents. La :numref:`fig-cpu-blocs` présente un schéma bloc de notre minuscule CPU que nous allons compléter petit à petit.
   
.. _fig-cpu-blocs:
.. tikz:: Composition du minuscule CPU
   :libs: positioning 

   [reg/.style={rectangle,rounded corners=5pt,minimum width=1.5cm,draw}]

   % ALU	  
   \fill[gray] (7,-1) -- (7,-2.5) -- (7.5,-3) -- (7,-3.5) -- (7,-5) -- (9,-3.5) -- (9,-2.5) -- (7,-1) -- cycle;
   \node at (8,-3) (ALU) {\textbf{ALU}};

   %A
   \node (A) at (2.5,-2.5) [reg,align=flush center] {A};
   \node (D) at (5,-1.5) [reg,align=flush center] {D};
   \node (PC) at (5,-7) [reg,align=flush center] {PC};

   % CPU
   \draw [dashed] (0,0) -- (0,-8) -- (10,-8) -- (10,0) -- cycle;
   \node at (-1,-2.5) (instruction) {instruction};
   \node at (-1,-4.5) (inM) {inM};
   \node at (-1,-6) (reset) {reset};

   \node at (11,-2.5) (outM) {outM};
   \node at (11,-5.2) (writeM) {writeM};
   \node at (11,-6) (addressM) {addressM};
   \node at (11,-7) (outPC) {pc};


Les deux registres ``A`` et ``D`` permettent de stocker un mot de seize bits. Ils ont chacun deux entrées et une sortie :
 - une entrée `in` sur 16 bits
 - une sortie `out` sur 16 bits
 - un signal de contrôle `load` qui doit être mis à `1` pour que le registre mémorise l'information présente sur son entrée `in`

Le registre ``PC`` est lui plus complexe. Dans le troisième projet, nous avons vu que ce registre avait quatre entrées :

  - un mot de 16 bits contenant une nouvelle valeur à stocker (`in`)
  - un signal de contrôle `inc` qui détermine si le contenu du ``PC`` doit être incrémenté
  - un signal de contrôle `reset` qui initialise son contenu à ``0``
  - un signal de contrôle `load` qui force le chargement de la valeur se trouvant sur l'entrée `in`

Ce registre a une sortie sur 16 bits baptisée `out`. Dans un premier temps, considérons uniquement l'incrémentation et la réinitialisation de ce registre. Pour cela, il nous suffit de connecter la valeur `1` à l'entrée `inc` du `PC` et son signal de contrôle `reset` au signal extérieur. Nous verrons ultérieurement comment utiliser les autres signaux de contrôle de ce registre, mais nous avons déjà un registre ``PC`` qui s'incrémente à la fin de l'exécution de chaque instruction.    

.. _fig-cpu-blocs-pc:
.. tikz:: Un registre PC de base
   :libs: positioning 

   [reg/.style={rectangle,rounded corners=5pt,minimum width=1.5cm,draw}]

   % ALU	  
   \fill[gray] (7,-1) -- (7,-2.5) -- (7.5,-3) -- (7,-3.5) -- (7,-5) -- (9,-3.5) -- (9,-2.5) -- (7,-1) -- cycle;
   \node at (8,-3) (ALU) {\textbf{ALU}};

   %A
   \node (A) at (2.5,-2.5) [reg,align=flush center] {A};
   \node (D) at (5,-1.5) [reg,align=flush center] {D};
   \node (PC) at (5,-7) [reg,align=flush center] {PC};

   % CPU
   \draw [dashed] (0,0) -- (0,-8) -- (10,-8) -- (10,0) -- cycle;
   \node at (-1,-2.5) (instruction) {instruction};
   \node at (-1,-4.5) (inM) {inM};
   \node at (-1,-6) (reset) {reset};

   \node at (11,-2.5) (outM) {outM};
   \node at (11,-5.2) (writeM) {writeM};
   \node at (11,-6) (addressM) {addressM};
   \node at (11,-7) (outPC) {pc};

   \draw [->,color=red] (reset) -| (PC.135);
   \node[color=red] at ($(PC.60)+(0,0.5)$) (1) {1};
   \draw [->, color=red] (1) -- (PC.60);
   
Les instructions
________________


Pour poursuivre la construction de notre CPU, nous devons maintenant analyser plus en détails les différentes instructions qu'il doit exécuter.
Chaque instruction de notre minuscule CPU est encodée sous la forme d'un mot de 16 bits. Comme indiqué précédemment, ce CPU supporte deux types d'instructions :

 - les instructions de type ``A`` qui permettent de charger la valeur se trouvant dans les quinze bits de poids faible de l'instruction dans le registre ``A``
 - les instructions de type ``C`` qui comprennent toutes les autres instructions

Notre minuscule CPU utilise le bit de poids fort de l'instruction pour déterminer si il s'agit d'une instruction de type ``A`` (bit de poids fort mis à `0`) ou de type ``C`` (bit de poids fort mis à `1`).   
   
Commençons par analyser les instructions de type ``A``. Une de ces instructions permet de charger dans le registre ``A`` la valeur correspondant aux quinze bits de poids faible du mot de seize bits contenant l'instruction. Pour supporter cette instruction, nous devons donc :

 - mettre le signal de contrôle `in` du registre ``A`` à `1` lorsque le bit de poids faible de l'instruction lue en mémoire ROM a bien la valeur `0` 
 - connecter les quinze bits de poids faible de l'instruction lue en mémoire ROM sur l'entrée `in` du registre ``A``

Pour mettre à `1` le signal de contrôle de registre ``A`` lorsque le bit de poids de l'instruction vaut `0`, il suffit de faire passer ce bit dans un inverseur avant de le connecter à l'entrée `load` du registre ``A``.
   
.. _fig-cpu-blocs-pc-a:
.. tikz:: Support de l'instruction de type A
   :libs: positioning 

   [reg/.style={rectangle,rounded corners=5pt,minimum width=1.5cm,draw}]

   % ALU	  
   \fill[gray] (7,-1) -- (7,-2.5) -- (7.5,-3) -- (7,-3.5) -- (7,-5) -- (9,-3.5) -- (9,-2.5) -- (7,-1) -- cycle;
   \node at (8,-3) (ALU) {\textbf{ALU}};

   %A
   \node (A) at (2.5,-2.5) [reg,align=flush center] {A};
   \node (D) at (5,-1.5) [reg,align=flush center] {D};
   \node (PC) at (5,-7) [reg,align=flush center] {PC};

   % CPU
   \draw [dashed] (0,0) -- (0,-8) -- (10,-8) -- (10,0) -- cycle;
   \node at (-1,-2.5) (instruction) {$i_{15}\underbrace{i_{14}...i_{2}i_{1}i_{0}}$};
   \node at (-1,-4.5) (inM) {inM};
   \node at (-1,-6) (reset) {reset};

   \node at (11,-2.5) (outM) {outM};
   \node at (11,-5.2) (writeM) {writeM};
   \node at (11,-6) (addressM) {addressM};
   \node at (11,-7) (outPC) {pc};

   \draw [->,color=red] (reset) -| (PC.135);
   \node[color=red] at ($(PC.60)+(0,0.5)$) (1) {1};

   \draw [->] (instruction.280) -- ($(instruction.280)+(0,-0.3)$) -- ($(instruction.280)+(1,-0.3)$) -| ($(A.west)+(-0.5,0)$) -- (A.west);
   \node[not gate US, draw, scale=0.75] at ($(instruction.25)+(0.5,0.3)$) (nota) {}; 
   \draw [->] (instruction.155) |- (nota);
   \draw [->] (nota) -| (A.north);


Pour supporter les instructions de type ``C``, il est nécessaire de s'intéresser plus en détails à la façon dont elles sont encodées en binaire. Le format de ces instructions est repris ci-dessous.

:math:`1 1 1 \overbrace{a c_{1} c_{2} c_{3} c_{4} c_{5} c_{6}}^{calcul}\overbrace{d_{1} d_{2} d_{3}}^{destination}\overbrace{j_{1} j_{2} j_{3}}^{saut}`

Les seize bits de cette instruction sont découpés en trois parties :

 - les sept bits `calcul` spécifient le type de calcul à réaliser
 - les trois bits `destination` spécifient l'endroit où le résultat du calcul doit être stocké
 - les trois bits de poids faible sont utilisés pour les instructions de saut

Parmi les bits de `calcul`, le bit `a` joue un rôle particulier. Lorsqu'il vaut `1`, le calcul fait par l'ALU utilise une donnée lue en mémoire RAM à l'adresse contenue dans le registre ``A``. Sinon, l'ALU réalise son calcul sur base des constantes `0` et `1` ainsi que du contenu des registres ``A`` et/ou ``D``. Nous devons donc prévoir la possibilité d'amener une donnée lue en mémoire à l'une des entrées de la minuscule ALU. En pratique, le livre a choisi de connecter la sortie du registre ``D`` à l'entrée `x` de l'ALU et de connecter la sortie du registre ``A`` ou la donnée lue en mémoire à l'adresse contenue dans le registre ``A`` à l'entrée `y`. Pour réaliser cette lecture en mémoire, nous devons donc connecter la sortie du registre ``A`` à la sortie `addressM` du minuscule `CPU`. La seconde entrée de la minuscule ALU doit elle être la donnée lue en mémoire lorsque le bit `a` de l'instruction vaut `1` et sinon ce doit être le contenu du registre ``A``. Pour implémenter ce choix, il suffit d'utiliser un multiplexeur qui est commandé par le bit `a` de l'instruction de type ``C``. Ces connexions sont illustrées en :numref:`fig-cpu-blocs-c-a`.


.. _fig-cpu-blocs-c-a:
.. tikz:: Utilisation du bit a des instructions de type C
   :libs: positioning 

   [reg/.style={rectangle,rounded corners=5pt,minimum width=1.5cm,draw}]

   % ALU	  
   \fill[gray] (7,-1) -- (7,-2.5) -- (7.5,-3) -- (7,-3.5) -- (7,-5) -- (9,-3.5) -- (9,-2.5) -- (7,-1) -- cycle;
   \node at (8,-3) (ALU) {\textbf{ALU}};

   %A
   \node (A) at (2.5,-2.5) [reg,align=flush center] {A};
   \node (D) at (5,-1.5) [reg,align=flush center] {D};
   \node (PC) at (5,-7) [reg,align=flush center] {PC};

   % CPU
   \draw [dashed] (0,0) -- (0,-8) -- (10,-8) -- (10,0) -- cycle;
   \node at (-2.5,-2.5) (instruction) {$111\overbrace{ac_{1}c_{2}c_{3}c_{4}c_{5}c_{6}}^{calcul}\overbrace{d_{1}d_{2}d_{3}}^{destination}\overbrace{j_{1}j_{2}j_{3}}^{saut}$};
   \node at (-1,-4.5) (inM) {inM};
   \node at (-1,-6) (reset) {reset};

   \node at (11,-2.5) (outM) {outM};
   \node at (11,-5.2) (writeM) {writeM};
   \node at (11,-6) (addressM) {addressM};
   \node at (11,-7) (outPC) {pc};

   % mux
   \coordinate (muxOut) at (6,-4.25);
   \coordinate (muxIn1) at ($(muxOut)+(-1,0.37)$);
   \coordinate (muxIn2) at ($(muxOut)+(-1,-0.37)$);
   \draw (muxOut) -- ($(muxOut)+(-1,-0.75)$) -- ($(muxOut)+(-1,0.75)$) -- cycle;

   
   % \draw [->,color=red] (reset) -| (PC.135);
   % \node[color=red] at ($(PC.60)+(0,0.5)$) (1) {1};

   %   \draw [->] (instruction.280) -- ($(instruction.280)+(0,-0.3)$) -- ($(instruction.280)+(1,-0.3)$) -| ($(A.west)+(-0.5,0)$) -- (A.west);
   %   \node[not gate US, draw, scale=0.75] at ($(instruction.25)+(0.5,0.3)$) (nota) {}; 
   %   \draw [->] (instruction.155) |- (nota);
   %   \draw [->] (nota) -| (A.north);
   
   \draw[thick,->] (A.east) -- ($(A.east)+(0.5,0)$) |- (addressM);
   \draw[thick,->] ($(A.east)+(0.5,0)$)  |- (muxIn1);
   \draw[thick,->] ($(instruction.164)+(0,-0.2)$) -- ($(instruction.164)+(0,0.07)$) -| (5.5,-3.8) ; 
   \draw[thick, ->] (inM) -- (muxIn2);
   \draw[thick, ->] (muxOut) -- (7,-4.25);


   
Nous pouvons maintenant analyser plus en détails les différentes instructions de type ``C`` pour voir comment les implémenter. Pour chacune de ces instructions, la procédure à suivre est la suivante. Tout d'abord, il faut extraire des bits :math:`c_{1}c_{2}c_{3}c_{4}c_{5}c_{6}` les informations qui permettent de choisir les bonnes valeurs pour les entrées et les signaux de contrôle de l'ALU. Ensuite, il faudra faire de même pour la destination du résultat du calcul réalisé par la minuscule ALU en utilisant les bits :math:`d_{1}d_{2}d_{3}`. Pour cela, nous devons analyser en détails les valeurs de ces différents bits dans les instructions qui nous intéressent. Dans le minuscule CPU, les formats de ces bits ont été choisies de façon à faciliter la réalisation des circuits qui permettent de décoder chaque instruction. Le :numref:`table-calcul-a0`, extrait du livre de référence, présente l'encodage des bits :math:`c_{i}` pour les instructions de type ``C`` lorsque le bit `a` est mis à 0.

.. _table-calcul-a0:

.. table:: Valeurs des bits calcul des instructions de type C lorsque le bit a est à 0
   :align: center

   ====== =========== =========== =========== =========== =========== ===========
   Calcul :math:`c_1` :math:`c_2` :math:`c_3` :math:`c_4` :math:`c_5` :math:`c_6`
   ------ ----------- ----------- ----------- ----------- ----------- -----------
   0      1           0           1           0           1           0
   1      1           1           1           1           1           1
   -1     1           1           1           0           1           0
   D      0           0           1           1           0           0
   A      1           1           0           0           0           0 
   !D     0           0           1           1           0           1
   !A     1           1           0           0           0           1 
   -D     0           0           1           1           1           1
   -A     1           1           0           0           1           1  
   D+1    0           1           1           1           1           1
   A+1    1           1           0           1           1           1
   D-1    0           0           1           1           1           0    
   A-1    1           1           0           0           1           0
   D+A    0           0           0           0           1           0 
   D-A    0           1           0           0           1           1
   A-D    0           0           0           1           1           1
   D&A    0           0           0           0           0           0  
   D|A    0           1           0           1           0           1
   ====== =========== =========== =========== =========== =========== ===========


Lorsque le bit `a` est mis à `1`, la seconde entrée de la minuscule ALU est la donnée lue en mémoire. Dans ce cas, seules les instructions du :numref:`table-calcul-a1` sont valides. 

.. _table-calcul-a1:

.. table:: Valeurs des bits calcul des instructions de type C lorsque le bit a est à 1
   :align: center	   

   ====== =========== =========== =========== =========== =========== ===========
   Calcul :math:`c_1` :math:`c_2` :math:`c_3` :math:`c_4` :math:`c_5` :math:`c_6`
   ------ ----------- ----------- ----------- ----------- ----------- -----------
   M      1           1           0           0           0           0 
   !M     1           1           0           0           0           1 
   -M     1           1           0           0           1           1  
   M+1    1           1           0           1           1           1
   M-1    1           1           0           0           1           0
   D+M    0           0           0           0           1           0 
   D-M    0           1           0           0           1           1
   M-D    0           0           0           1           1           1
   D&M    0           0           0           0           0           0  
   D|M    0           1           0           1           0           1
   ====== =========== =========== =========== =========== =========== ===========


Pour compléter la description des instructions de type ``C``, le :numref:`table-calcul-dest` présente les valeurs des bits :math:`d_{1}d_{2}d_{3}` qui encodent la destination du calcul réalisé par la minuscule ALU.

.. _table-calcul-dest:

.. table:: Valeurs des bits destination des instructions de type C

   =========== =========== =========== =========== 
   Destination :math:`d_1` :math:`d_2` :math:`d_3` 
   ----------- ----------- ----------- -----------
   aucune      0           0           0
   M           0           0           1
   D	       0           1           0
   MD	       0           1           1
   A	       1           0           0
   AM	       1           0           1
   AD	       1           1           0
   AMD	       1           1           1
   =========== =========== =========== =========== 


En observant cette table, on remarque aisément que :
 - le résultat du calcul de l'ALU est stocké dans le registre ``A`` lorsque le bit :math:`d_1` vaut `1`
 - le résultat du calcul de l'ALU est stocké dans le registre ``D`` lorsque le bit :math:`d_2` vaut `1`
 - le résultat du calcul de l'ALU est stocké en mémoire RAM lorsque le bit :math:`d_3` vaut `1`
   

Nous devons donc relier la sortie de la minuscule ALU à la sortie `outM`, mais aussi aux entrées de registres ``D`` et ``A``. Pour le registre ``D``, cette connexion ne posera pas de problème. Par contre, pour le registre ``A``, nous devons nous rappeler que nous y avons déjà connecté les quinze bits de poids faible de l'instruction lue en mémoire ROM pour supporter les instructions de type ``A``. Comme nous avons deux entrées possibles pour le registre ``A``, il nous suffit des les connecter à un multiplexeur qui est placé devant l'entrée de ce registre. Ce multiplexeur sera commandé par le bit de poids fort de l'instruction. Lorsque ce bit vaut `0` (instruction de type ``A``), il doit sélectionner son entrée avec les 15 bits de poids faible de l'instruction. Sinon, il sélectionne l'entrée provenant de la sortie de l'ALU. Pour simplifier les schémas, nous présentons maintenant les bits de contrôle de façon symbolique. Le registre ``A`` doit charger la valeur en entrée dans deux cas :

 - on exécute une instruction de type ``A`` et donc le bit :math:`i_{15}` est à `0` comme expliqué précédemment
 - on exécute une instruction de type ``C`` dont le bit :math:`d_{1}` vaut `1`
   
Il nous suffit donc d'utiliser le signal :math:`OR(d_{1},NOT(i_{15}))` pour contrôler le registre ``A`` et :math:`NOT(i_{15})` pour le multiplexeur se trouvant en amont du registre ``A``. Le registre ``D`` lui devra sauvegarder son entrée lorsque le bit :math:`d_{2}` vaut `1`. Le dernier cas est celui d'une sauvegarde du résultat de l'ALU en mémoire. Dans ce cas, il faut que signal `writeM` du minuscule CPU soit mis à `1`. Il suffit pour cela de simplement relier le bit :math:`d_3` de l'instruction directement à cette sortie. La :numref:`fig-cpu-blocs-dest` décrit cette partie du minuscule CPU.
   
.. _fig-cpu-blocs-dest:

.. tikz:: Choix de la destination du calcul de l'ALU
   :libs: positioning 

   [reg/.style={rectangle,rounded corners=5pt,minimum width=1cm,draw},
   connection/.style={draw,circle,fill=black,inner sep=1.5pt}]

   % ALU
   \coordinate (OutALU) at (9,-3);   
   \fill[gray] (7,-1) -- (7,-2.5) -- (7.5,-3) -- (7,-3.5) -- (7,-5) -- (9,-3.5) -- (9,-2.5) -- (7,-1) -- cycle;
   \node at (8,-3) (ALU) {\textbf{ALU}};

   %A
   \node (A) at (2.5,-2.5) [reg,align=flush center] {A};
   \node (D) at (5,-1.5) [reg,align=flush center] {D};
   \node (PC) at (5,-7) [reg,align=flush center] {PC};

   % CPU
   \draw [dashed] (0,0) -- (0,-8) -- (10,-8) -- (10,0) -- cycle;
   %\node at (-3,-2.5) (instruction) {$111\overbrace{ac_{1}c_{2}c_{3}c_{4}c_{5}c_{6}}^{calcul}\overbrace{d_{1}d_{2}d_{3}}^{destination}\overbrace{j_{1}j_{2}j_{3}}^{saut}$};
   \node at (-1.5,-2.5) (instruction) {instruction};
   \node at (-1,-4.5) (inM) {inM};
   \node at (-1,-6) (reset) {reset};

   \node at (11,-3) (outM) {outM};
   \node at (11,-5.2) (writeM) {writeM};
   \node at (11,-6) (addressM) {addressM};
   \node at (11,-7) (outPC) {pc};

   % mux ALU
   \coordinate (muxOut) at (6,-4.25);
   \coordinate (muxIn1) at ($(muxOut)+(-1,0.37)$);
   \coordinate (muxIn2) at ($(muxOut)+(-1,-0.37)$);
   \draw (muxOut) -- ($(muxOut)+(-1,-0.75)$) -- ($(muxOut)+(-1,0.75)$) -- cycle;

   % mux A
   \coordinate (muxAOut) at ($(A)+(-0.9,0)$);
   \coordinate (muxAIn1) at ($(muxAOut)+(-1,0.37)$);
   \coordinate (muxAIn2) at ($(muxAOut)+(-1,-0.37)$);
   \draw (muxAOut) -- ($(muxAOut)+(-1,-0.75)$) -- ($(muxAOut)+(-1,0.75)$) -- cycle;

   
   % \draw [->,color=red] (reset) -| (PC.135);
   % \node[color=red] at ($(PC.60)+(0,0.5)$) (1) {1};

   %   \draw [->] (instruction.280) -- ($(instruction.280)+(0,-0.3)$) -- ($(instruction.280)+(1,-0.3)$) -| ($(A.west)+(-0.5,0)$) -- (A.west);
   %   \node[not gate US, draw, scale=0.75] at ($(instruction.25)+(0.5,0.3)$) (nota) {}; 
   %   \draw [->] (instruction.155) |- (nota);
   %   \draw [->] (nota) -| (A.north);

   % instructions c debut
   %\draw[thick,->] (A.east) -- ($(A.east)+(0.5,0)$) |- (addressM);
   %\draw[thick,->] ($(A.east)+(0.5,0)$)  |- (muxIn1);
   %\draw[thick,->] ($(instruction.164)+(0,-0.2)$) -- ($(instruction.164)+(0,0.07)$) -| (5.5,-3.8) ; 
   %\draw[thick, ->] (inM) -- (muxIn2);
   %\draw[thick, ->] (muxOut) -- (7,-4.25);


   \node[connection] at ($(OutALU)+(0.5,0)$) (OutALU2) {}; 
   \draw[thick, ->] (OutALU) -- (OutALU2);
   \draw[thick, ->] (OutALU2) -- (outM);

   \node[connection] at ($(D.west)+(-0.5,1)$) (midD) {};
   \draw[->,thick] (OutALU2) |- (midD);
   \draw[->,thick] (midD) |- (D.west);

   \draw [->,thick] (midD) --($(muxAIn1)+(-0.3,1.6)$) |- (muxAIn1);
   \draw [->,thick] (instruction.south) |- (muxAIn2);

   \draw [->,thick] (muxAOut) -- (A.west);
   
   \node[color=red] at ($(D.north)+(0,0.5)$) (fD) {$d_{2}$};
   
   \node[color=red] at ($(A.north)+(0,1.2)$) (fA) {$OR(d_{1},NOT(i_{15}))$};
   \node[color=red] at ($(muxAOut)+(-0.5,1)$) (fmuxA) {$NOT(i_{15})$};
   \draw[color=red,thick,->] (fA) -- (A.north);
   \draw[color=red,thick,->] (fD) -- (D.north);
   \draw[color=red,thick,->] (fmuxA) -- ($(fmuxA)+(0,-0.7)$); 

   \node[color=red] at ($(writeM.west)+(-2,0)$) (d3) {$d_{3}$};
   \draw[color=red,thick, ->] (d3) -- (writeM);
   

Nous pouvons maintenant nous concentrer sur la partie calcul des instructions de type ``C``. Nous nous limiterons à illustrer comment quelques unes de ces instructions peuvent être implémentées. Les étudiants sont invités à construire le minuscule CPU entièrement comme exercice.

Commençons par utiliser l'ALU pour calculer la constante `0`. Lorsque nous avons construit la minuscule ALU, cette valeur était obtenue en utilisant les signaux de contrôle suivants :

 - `zx=1`
 - `nx=0`
 - `zy=1`
 - `ny=0`
 - `f=1`
 - `no=0`

La minuscule ALU doit réaliser cette opération pour l'instruction suivante : 

 - :math:`c_{1}=1`
 - :math:`c_{2}=0`
 - :math:`c_{3}=1`
 - :math:`c_{4}=0`
 - :math:`c_{5}=1`
 - :math:`c_{5}=0`
   
Pour supporter cette instruction, il nous suffit donc de relier le bit :math:`c_{1}` à l'entrée `zx` de la minuscule ALU, le bit :math:`c_{2}` à l'entrée `zy`, ...

Analysons maintenant comment calculer la somme entre le registre ``D`` et le registre ``A`` ou la valeur lue en mémoire. Pour réaliser cette opération d'addition, nous devons fixer les valeurs suivants aux signaux de contrôle de la minuscule ALU :

 - `zx=0`
 - `nx=0`
 - `zy=0`
 - `ny=0`
 - `f=1`
 - `no=0`

Notre minuscule ALU doit réaliser cette opération pour l'instruction suivante :    
 - :math:`c_{1}=0`
 - :math:`c_{2}=0`
 - :math:`c_{3}=0`
 - :math:`c_{4}=0`
 - :math:`c_{5}=1`
 - :math:`c_{5}=0`

En continuant l'analyse, on remarque aisément que les bits :math:`c_{1}` à :math:`c_{6}` extraits de l'instruction correspondent exactement aux bits de contrôle de la minuscule ALU. Il suffit donc d'extraire les valeurs de ces bits de l'instruction lue en mémoire et des les connecter sur les entrées de la minuscule ALU.   


.. _fig-cpu-blocs-alu:

.. tikz:: Connexion des bits de calcul de l'instruction à la minuscule ALU
   :libs: positioning 

   [reg/.style={rectangle,rounded corners=5pt,minimum width=1cm,draw},
   connection/.style={draw,circle,fill=black,inner sep=1.5pt}]

   % ALU
   \coordinate (OutALU) at (9,-3);   
   \fill[gray] (7,-1) -- (7,-2.5) -- (7.5,-3) -- (7,-3.5) -- (7,-5) -- (9,-3.5) -- (9,-2.5) -- (7,-1) -- cycle;
   \node at (8,-3) (ALU) {\textbf{ALU}};

   %A
   \node (A) at (2.5,-2.5) [reg,align=flush center] {A};
   \node (D) at (5,-1.5) [reg,align=flush center] {D};
   \node (PC) at (5,-7) [reg,align=flush center] {PC};

   % CPU
   \draw [dashed] (0,0) -- (0,-8) -- (10,-8) -- (10,0) -- cycle;
   %\node at (-3,-2.5) (instruction) {$111\overbrace{ac_{1}c_{2}c_{3}c_{4}c_{5}c_{6}}^{calcul}\overbrace{d_{1}d_{2}d_{3}}^{destination}\overbrace{j_{1}j_{2}j_{3}}^{saut}$};
   \node at (-3,-2.5) (instruction) {instruction};
   \node at (-1,-4.5) (inM) {inM};
   \node at (-1,-6) (reset) {reset};

   \node at (11,-3) (outM) {outM};
   \node at (11,-5.2) (writeM) {writeM};
   \node at (11,-6) (addressM) {addressM};
   \node at (11,-7) (outPC) {pc};

   % mux ALU
   \coordinate (muxOut) at (6,-4.25);
   \coordinate (muxIn1) at ($(muxOut)+(-1,0.37)$);
   \coordinate (muxIn2) at ($(muxOut)+(-1,-0.37)$);
   \draw (muxOut) -- ($(muxOut)+(-1,-0.75)$) -- ($(muxOut)+(-1,0.75)$) -- cycle;

   % mux A
   \coordinate (muxAOut) at ($(A)+(-0.9,0)$);
   \coordinate (muxAIn1) at ($(muxAOut)+(-1,0.37)$);
   \coordinate (muxAIn2) at ($(muxAOut)+(-1,-0.37)$);
   \draw (muxAOut) -- ($(muxAOut)+(-1,-0.75)$) -- ($(muxAOut)+(-1,0.75)$) -- cycle;

   
   % \draw [->,color=red] (reset) -| (PC.135);
   % \node[color=red] at ($(PC.60)+(0,0.5)$) (1) {1};

   %   \draw [->] (instruction.280) -- ($(instruction.280)+(0,-0.3)$) -- ($(instruction.280)+(1,-0.3)$) -| ($(A.west)+(-0.5,0)$) -- (A.west);
   %   \node[not gate US, draw, scale=0.75] at ($(instruction.25)+(0.5,0.3)$) (nota) {}; 
   %   \draw [->] (instruction.155) |- (nota);
   %   \draw [->] (nota) -| (A.north);

   % instructions c debut
   %\draw[thick,->] (A.east) -- ($(A.east)+(0.5,0)$) |- (addressM);
   %\draw[thick,->] ($(A.east)+(0.5,0)$)  |- (muxIn1);
   %\draw[thick,->] ($(instruction.164)+(0,-0.2)$) -- ($(instruction.164)+(0,0.07)$) -| (5.5,-3.8) ; 
   %\draw[thick, ->] (inM) -- (muxIn2);
   %\draw[thick, ->] (muxOut) -- (7,-4.25);


   % destination
   %\node[connection] at ($(OutALU)+(0.5,0)$) (OutALU2) {}; 
   %\draw[thick, ->] (OutALU) -- (OutALU2);
   %\draw[thick, ->] (OutALU2) -- (outM);

   %\node[connection] at ($(D.west)+(-0.5,1)$) (midD) {};
   %\draw[->,thick] (OutALU2) |- (midD);
   %\draw[->,thick] (midD) |- (D.west);

   %\draw [->,thick] (midD) --($(muxAIn1)+(-0.3,1.6)$) |- (muxAIn1);
   %\draw [->,thick] (instruction.south) |- (muxAIn2);

   %\draw [->,thick] (muxAOut) -- (A.west);
   
   %\node[color=red] at ($(D.north)+(0,0.5)$) (fD) {$d_{2}$};
   
   %\node[color=red] at ($(A.north)+(0,1.2)$) (fA) {$OR(d_{1},NOT(i_{15}))$};
   %\node[color=red] at ($(muxAOut)+(-0.5,1)$) (fmuxA) {$NOT(i_{15})$};
   %\draw[color=red,thick,->] (fA) -- (A.north);
   %\draw[color=red,thick,->] (fD) -- (D.north);
   %\draw[color=red,thick,->] (fmuxA) -- ($(fmuxA)+(0,-0.7)$);

   \node[color=red] at ($(ALU)+(0,2.5)$) (cALU) {$c_{1}c_{2}c_{3}c_{4}c_{5}c_{6}$};
   \draw[color=red,->] (cALU.south) -- ($(cALU.south)+(0,-1)$);


Pour supporter toutes les instructions du minuscule CPU, il nous reste à analyser les instructions de saut qui permettent de modifier le contenu du registre ``PC``. Le type de saut est encodé dans les trois bits de poids faible de l'instruction. Nous pouvons distinguer trois types de sauts:

 - pas de saut à réaliser lorsque les trois bits de poids faible de l'instruction valent `000`
 - saut inconditionnel à l'adresse se trouvant dans le registre ``A`` lorsque les trois bits de poids faible de l'instruction valent `111`
 - saut conditionnel pour les autres valeurs des bits de poids faible


Le :numref:`table-c-j-bits` présente les différents types de sauts qui sont supportés par le minuscule CPU. 
   
   
   
.. _table-c-j-bits:

.. table:: Valeurs des bits de poids faible des instructions de type C

   =========== =========== =========== =========== 
   Saut        :math:`j_1` :math:`j_2` :math:`j_3` 
   ----------- ----------- ----------- -----------
   -           0           0           0
   JGT         0           0           1
   JEQ	       0           1           0
   JGE	       0           1           1
   JLT	       1           0           0
   JNE	       1           0           1
   JLE	       1           1           0
   JMP	       1           1           1
   =========== =========== =========== ===========


  
Nous avons précédemment expliqué comment le registre ``PC`` pouvait être mis à jour en l'absence de saut. Nous devons maintenant repartir de ce premier circuit et analyser comment il doit être modifié pour prendre en compte les différentes instructions de saut. Tout d'abord, il faut remarquer que le contenu du registre ``PC`` doit être incrémenté, c'est-à-dire que son entrée `inc` doit être à `1` et son entrée `load` à zéro lorsque l'on exécute une instruction de type ``A`` (bit de poids fort du mot contenant l'instruction mis à `0`) ou une instruction de type ``C`` (bit de poids fort mis à `1`) qui n'est pas un saut (bits :math:`j_1j_2j_3` à `0`). L'entrée `inc` de notre registre ``PC`` doit donc être :math:`OR(i_{15},AND(NOT(j_1),NOT(j_2),NOT(j_3)`.

Nous devons maintenant analyser les conditions dans lesquelles le registre ``PC`` doit charger la valeur venant du registre ``A``. Ces conditions dépendent à la fois de l'instruction en cours d'exécution et du résultat de la minuscule ALU et plus particulièrement des valeurs de drapeaux `zr` et `ng`. Pour rappel, `zr` est mis à `1` lorsque le résultat de l'ALU est nul. Le drapeau `ng` indique un résultat négatif de l'ALU. Nous sommes en fait face à la construction d'un circuit logique qui a cinq entrées :

 - le bit :math:`j_1`
 - le bit :math:`j_2`
 - le bit :math:`j_3`
 - le drapeau `zr`
 - le drapeau `ng` 


Ce circuit logique va avoir comme sortie la valeur su signal de contrôle `load` du registre ``PC``. Pour construire le circuit logique correspondant, il suffit de construire sa table de vérité (:numref:`table-verite-jump`). Cette table de vérité aura donc 32 lignes. Pour construire cette table de vérité, il faut se souvenir du fonctionnement des différents instructions de saut et les conditions qui doivent être remplies pour que le contenu du ``PC`` prenne la valeur du registre ``A``.

Le premier cas correspond aux instructions dont les trois bits de poids faible sont à zéro. Dans ce cas, `load` est toujours à zéro quelles que soient les valeurs de `zr` et `ng`.

Le deuxième cas correspond à l'instruction inconditionnelle ``JMP`` (bits de poids faible à `1`). Dans ce cas, `load` est toujours mis à `1`, quelles que soient les valeurs de `zr` et `ng`.

Le troisième cas est celui de l'instruction ``JGT``. Lors de l'exécution de cette instruction, le bit de contrôle `load` doit être mis à `1` lorsque `zr=0` et `ng=0`. Sinon, il est mis à `0`.

Le quatrième cas correspond à l'instruction ``JEQ``. Dans ce cas, le bit `load` doit être mis à `1` lorsque `zr=1` et `ng=0`. Sinon, il est mis à `0`.

Le cinquième cas est celui de l'instruction ``JGE``. Pour cette instruction, le bit `load` doit être mis à `1` lorsque `ng` vaut `0`, quelle que soit la valeur de `zr`

Le sixième cas est celui de l'instruction ``JLT``. Lors de l'exécution de cette instruction, le bit de contrôle `load` doit être mis à `1` lorsque `zr=0` et `ng=1`. Sinon, il est mis à `0`.

La septième instruction est ``JNE``. Pour cette instruction, le bit de contrôle `load` doit valoir `1` pour autant que `zr` soit mis à `0`.

Le dernier cas est celui de l'instruction ``JLE``. Lors de l'exécution de cette instruction, le bit de contrôle `load` doit être mis à `1` lorsque `ng=0`, quelle que soit la valeur de `zr`.


.. _table-verite-jump:

.. table:: Table de vérité du calcul du signal de contrôle 

   =========== ==== ==== =========== =========== =========== ====== 
   Saut        `zr` `ng` :math:`j_1` :math:`j_2` :math:`j_3` `load`
   ----------- ---- ---- ----------- ----------- ----------- ------
   -            0   0    0           0           0           0
   JGT          0   0    0           0           1           1
   JEQ	        0   0    0           1           0           0
   JGE	        0   0    0           1           1           1
   JLT	        0   0    1           0           0           0
   JNE	        0   0    1           0           1           1
   JLE	        0   0    1           1           0           1
   JMP	        0   0    1           1           1           1
   -            0   1    0           0           0           0
   JGT          0   1    0           0           1           0
   JEQ	        0   1    0           1           0           0
   JGE	        0   1    0           1           1           0
   JLT	        0   1    1           0           0           1
   JNE	        0   1    1           0           1           1
   JLE	        0   1    1           1           0           0
   JMP	        0   1    1           1           1           1
   -            1   0    0           0           0           0
   JGT          1   0    0           0           1           0
   JEQ	        1   0    0           1           0           1
   JGE	        1   0    0           1           1           1
   JLT	        1   0    1           0           0           0
   JNE	        1   0    1           0           1           0
   JLE	        1   0    1           1           0           1
   JMP	        1   0    1           1           1           1
   -            1   1    0           0           0           0
   JGT          1   1    0           0           1           0
   JEQ	        1   1    0           1           0           0
   JGE	        1   1    0           1           1           0
   JLT	        1   1    1           0           0           0 
   JNE	        1   1    1           0           1           0
   JLE	        1   1    1           1           0           0
   JMP	        1   1    1           1           1           1
   =========== ==== ==== =========== =========== =========== ====== 


Le :numref:`table-verite-jump` contient la table de vérité complète du circuit permettant de calculer le signal de contrôle nécessaire pour supporter les instructions de saut. Il suffit maintenant de transformer cette table de vérité en un circuit logique. Cette transformation est laissée aux étudiants à titre d'exercice. Il est possible de réaliser ce circuit en utilisant peu de fonctions logiques.


Ordinateurs actuels
===================

Le livre de référence et les chapitres précédents nous ont permis de voir les éléments principaux du fonctionnement d'une ordinateur qui est capable d'exécuter des programmes simples écrits en langage d'assemblage. Le minuscule ordinateur est complètement fonctionnel et le livre de référence l'utilise pour développer des logiciels qui permettent de l'exploiter pleinement.

L'approche choisie par le livre de référence est pédagogique. L'ordinateur construit fonctionne mais il est loin d'être équivalent aux ordinateurs et aux microprocesseurs qui existent de nos jours. En une septa ntaine d'années environ, les ordinateurs et les microprocesseurs ont fait d'immenses progrès. Il est impossible de les lister tous dans ce cours introductif. Vous aurez plus tard l'occasion d'analyser ces techniques avancées plus en détails notamment dans les cours de Master. Cependant, il y a certaines contraintes technologiques auxquelles il est intéressant que vous soyez déjà sensibilisé.

La complexité d'un microprocesseur se mesure d'abord grâce au nombre de transistors qui le composent. En fonction de la technologie utilisée, il faut compter que quelques transistors sont nécessaires pour construire une porte logique de type NAND ou NOR. A partir de ces portes logiques, il est possible de construire un ordinateur complet comme nous l'avons vu. La :numref:`fig-transistors` présente l'évolution du nombre de transistors que contiennent les microprocesseurs commerciaux depuis l'intel 4004 jusqu'au récent Apple M1. En cinquante ans, on est passé d'un microprocesseur comprenant 2300 transistors à une puce qui en comprend plus de 16 milliards. La capacité de l'industrie électronique de concentrer de plus en plus de transistors sur de petites surfaces est une des raisons de son succès. En 1965, Gordon Moore, un des cofondateurs du fabricant de circuits électroniques intel, avait prédit que le nombre de composants que l'on peut intégrer dans un circuit électronique allait doubler chaque année durant la prochaine décennie. En 1975, il a revu ses prévisions et ramené cette croissance à un doublement tous les deux ans. Depuis, cette prévision est connue sous le nom de la :term:`loi de Moore`.

.. _fig-transistors:
.. tikz:: Evolution du nombre de transistors contenus dans les processeurs commerciaux
   
   \pgfplotstableread[row sep=\\,col sep=&]{
    an & t & mhz \\
    1971  & 2300 & 0.1\\ % 4004
    1974  & 6000 & 2 \\ % 8080
    1978  & 29000 & 10 \\ %8086
    1982  & 134000 & 12 \\ % 80286
    1988  & 275000 & 33 \\ % 80386SX
    1989  & 1200000 & 50 \\ % 486DX
    1993  & 3100000 & 66 \\ % pentium
    1997  & 4500000 & 233 \\ %pentium MMX
    1999  & 28000000 & 1000 \\ %pentium III Xeon
    2004  & 125000000 & 3400 \\ %pentium 4 HT
    2007  & 582000000 & 2930 \\ %xeon X7350
    2009  & 904000000 &  0 \\ % amd 6 core opteron
    2012  & 1200000000 & 0 \\ % intel quad core i7
    2015  & 2000000000 & 0 \\ % apple A9
    2017  & 5300000000 & 0 \\ % qualcomm snap dragon
    2020  & 16000000000 & 0 \\ %% apple M1
    }\mydata


    \begin{semilogyaxis}[            
            xmin=1970,
	    xmax=2020,
            %nodes near coords,
            %nodes near coords align={vertical},
            ymin=0,ymax=50000000000,
            ylabel={Transistors},
	    legend pos= south east,
	    x tick label style={
		/pgf/number format/1000 sep=},
        ]
        \addplot table[x=an,y=t]{\mydata};
        \legend{Nombre de transistors}
    \end{semilogyaxis}


.. voir aussi https://en.wikipedia.org/wiki/Transistor_count

Sur base de la loi de Moore, on pourrait penser que l'industrie informatique continue son évolution sans difficultés depuis les début des années 1970s et qu'il en sera toujours de même. Ce n'est pas tout à fait correct. Il y a certaines contraintes technologiques qui ont un impact sur l'architecture des ordinateurs et l'évolution de leurs performances. L'analyse de cette évolution et des techniques qui permettent d'améliorer les performances des ordinateurs sort du cadre de ce cours introductif. Il y a cependant certains points sur lesquels il est important que vous soyez déjà conscientisés.


.. spelling::

   von
   Neumann
   Harvard
   Pentium
   

Le minuscule processeur utilise une horloge pour rythmer son fonctionnement. Toutes les instructions qu'il supporte doivent s'exécuter durant un cycle d'horloge, que ce soit l'instruction ``M=A+M`` qui nécessite une lecture en mémoire, une écriture en mémoire et une addition ou l'instruction ``D=0`` qui est nettement plus simple. Cette hypothèse facilite grandement la réalisation du minuscule ordinateur, mais les microprocesseurs réels ont des instructions qui ne prennent pas toutes le même temps. Certaines s'exécutent en un seul cycle d'horloge, comme une addition entre deux registres. D'autres utilisent plusieurs cycles d'horloge voire des dizaines de cycles d'horloge comme des opérations de division ou de multiplication ou des opérations de calcul avec des réels représentés en virgule flottante.

La vitesse de l'horloge d'un ordinateur a souvent été présentée, notamment dans des actions de marketing, comme la métrique la plus importante au niveau des performances. De ce point de vue, il est intéressant de suivre l'évolution des microprocesseurs du fabricant intel qui publie de nombreuses données historiques sur son site web. La :numref:`fig-mhz-intel` présente l'évolution du cycle d'horloge des processeurs intel durant les cinq dernières décennies. 

.. https://www.intel.com/pressroom/kits/quickreffam.htm


.. _fig-mhz-intel:
.. tikz:: Evolution de la fréquence d'horloge des processeurs intel
   
   \pgfplotstableread[row sep=\\,col sep=&]{
    an & t & mhz \\
    1971  & 2300 & 0.1\\ % 4004
    1974  & 6000 & 2 \\ % 8080
    1978  & 29000 & 10 \\ %8086
    1982  & 134000 & 12 \\ % 80286
    1988  & 275000 & 33 \\ % 80386SX
    1989  & 1200000 & 50 \\ % 486DX
    1993  & 3100000 & 66 \\ % pentium
    1997  & 4500000 & 233 \\ %pentium MMX
    1999  & 28000000 & 1000 \\ %pentium III Xeon
    2004  & 125000000 & 3400 \\ %pentium 4 HT
    2007  & 582000000 & 2930 \\ %xeon X7350
    2008  & 781000000 & 3600 \\ % core i7
    2011  & 995000000 & 3400 \\ % core i5
    2016  & 0 & 3900 \\ % i7
    2017  & 0 & 4700 \\ % i7 8700
    2020  & 0 & 5300 \\ % i9 10900
    }\mydata


    \begin{semilogyaxis}[            
            xmin=1970,
	    ymax=2020,
            %nodes near coords,
            %nodes near coords align={vertical},
            ymin=0,ymax=10000,
            ylabel={MHz},
	    legend pos= south east,
	    x tick label style={
		/pgf/number format/1000 sep=},
        ]
        \addplot table[x=an,y=mhz]{\mydata};
        \legend{Fréquence d'horloge}
    \end{semilogyaxis}

    
.. spelling::

   intel
   hyperthreading
   
Jusqu'aux environs de l'année 2000, la fréquence d'horloge des microprocesseurs a régulièrement augmenté. Les premiers processeurs fonctionnaient à des fréquences de quelques centaines de kHz. En 1978, le 8086 atteignait les 10 MHz. En 1999, l'intel Pentium atteignait 1 GHz. Depuis, la plupart des processeurs sont restés aux alentours de 2 à 5 GHz. Les contraintes technologiques font qu'il est difficile aujourd'hui de construire des microprocesseurs qui supportent des fréquences d'horloge supérieures à 4-5 GHz. Face à cette limitation technologique, les fabricants de processeurs ont dû trouver des solutions pour exécuter plus d'instructions sans augmenter la fréquence d'horloge des microprocesseurs.

Les deux principales technologies sont l'hyperthreading et l'utilisation de plusieurs coeurs sur un même processeur. L'hyperthreading a été introduit au début des années 2000. Cette technologie permet à un :term:`système d'exploitation` d'exécuter deux programme simultanément sur le même processeur. Ces deux programmes ont chacun accès à des registres qui leurs sont propres et leurs accès en mémoire sont entrelacés. La deuxième technique est d'installer sur un processeur unique plusieurs coeurs, c'est-à-dire plusieurs unités de calcul qui sont chacune capables d'interagir avec la mémoire et d'exécuter des programmes. Chacun de ces coeurs dispose d'un ensemble de registres qui lui est propre. Il peut donc exécuter un programme différent. Il est aussi possible d'écrire les programmes de façon à ce que plusieurs parties de chaque programme puissent s'exécuter en parallèle sur le même coeur ou sur des coeurs différents. Cette technique de programmation sort du cadre de ce cours. Elle sera abordée en deuxième bachelier en utilisant les langages de programmation Java et C.

La plupart des microprocesseurs actuels utilisent plusieurs coeurs. En voici quelques exemples :

 - l'`intel core 2 duo <https://en.wikipedia.org/wiki/Core_2_Duo>`_, introduit en 2006, comprenait deux coeurs
 - l'`AMD K10 <https://en.wikipedia.org/wiki/AMD_K10>`_, introduit en 2007, comprenait coeurs
 - l'`intel Xeon 7400 <https://en.wikipedia.org/wiki/Xeon>`_, introduit en 2008, était composé de six coeurs
 - le `Sparc T3 <https://en.wikipedia.org/wiki/SPARC_T3>`_, introduit en 2010, était composé de 16 coeurs
 - l '`intel Xeon Westmere <https://en.wikipedia.org/wiki/Westmere-EX>`_, introduit en 2011, comprenait 10 coeurs
 - l'`intel Xeon Phi <https://en.wikipedia.org/wiki/Xeon_Phi>`_, introduit en 2012, comprend 61 coeurs
 - le SPARC M7, introduit en 2015, comprend 32 coeurs
 - le `Qualcomm Snapdragon 850 <https://en.wikipedia.org/wiki/Qualcomm_Snapdragon>`_, qui équipe de nombreux smartphones, contient huit coeurs
 - l'`AMD Epyc <https://en.wikipedia.org/wiki/Epyc>`_ supporte 32 coeurs
 - l'`Apple A14 Bionic <https://en.wikipedia.org/wiki/Apple_A14>`_, qui équipe les iPhones 12, contient six coeurs de calcul

.. spelling::

   AMD
   SPARC
   Xeon
   Westmere
   Phi
   Qualcomm
   Snapdragon
   Apple
   Epyc

.. probablement mieux expliquer les GPUs un jour https://en.wikipedia.org/wiki/Graphics_processing_unit
   
A côté du microprocesseur principal, les ordinateurs actuels utilisent des microprocesseurs spécialisés pour certaines opérations. En termes de performances, les applications les plus demandeuses sont souvent les applications graphiques. Les premières cartes graphiques permettaient d'afficher des pixels individuels à l'écran comme nous l'avons fait avec le minuscule ordinateur. Au fil des années, les besoins ont augmenté et les cartes graphiques ont commencé à supporter des instructions qui permettent d'afficher des lignes, des caractères puis des objets 3-D etc. Aujourd'hui les cartes graphiques performantes sont équipées de :term:`GPU` ou Graphics Processing Units. Un GPU peut être vu comme un petit ordinateur spécialisée dans les calculs nécessaires pour afficher des informations à l'écran. Ces GPUs contiennent des dizaines ou des centaines de coeurs qui supportent en langage d'assemblage spécialisé. Ils contiennent parfois autant de mémoire RAM que l'ordinateur dans lequel ils sont installés.


.. spelling::

   Graphics
   Processing
   Units
   Unit
   iPhone
   iPhones
   hyperthreading
   Randal
   Bryant
   O'Hallaron
   nsec
   
   
Si l'arrivée de l'hyperthreading et des processeurs multicoeurs a permis de continuer à augmenter les performances sans augmenter les fréquences d'horloge des microprocesseurs, il y a un autre problème auquel les fabricants de microprocesseurs doivent encore faire face. Un microprocesseur doit en permanence interagir avec la mémoire, pour charger les instructions à exécuter mais aussi pour lire et écrire les données qu'il manipule. Dans les années 1970s, le CPU était plus lent que les mémoires DRAM et celles-ci pouvaient fournir rapidement les instructions et données demandées par le CPU. Malheureusement, dans le courant des années 1980s, la tendance s'est inversée. La vitesse des processeurs s'est améliorée plus rapidement que les temps d'accès aux mémoires de type DRAM. La :numref:`fig-dram-cpu`, basée sur des données de l'excellent livre `Computer Systems: A Programmer's Perspective <http://csapp.cs.cmu.edu/3e/figures.html>`_ de Randal E. Bryant et David R. O'Hallaron décrit clairement ce problème. En 1985, il était encore possible de faire attendre le processeur pour accéder aux données de la DRAM sans trop affecter les performances, mais depuis le milieu des années 1990s, ce n'est plus envisageable. En 1995, le temps d'accès à la DRAM était de 70 nsec alors qu'un microprocesseur ne mettait que 6 nsec pour exécuter une instruction.


.. _fig-dram-cpu:
.. tikz:: Au fil des années, le gap entre la durée d'un cycle CPU (en nsec) et un temps d'accès à la DRAM n'a fait qu'augmenter
   
   \pgfplotstableread[row sep=\\,col sep=&]{
   %   	Disk seek time	SSD access time	DRAM access time	SRAM access tim CPU cycle time	Effective CPU cycle time
   %1985	75,000,000		200	150	166	
   %1990	28,000,000		100	35	50	
   %1995	10,000,000		70	15	6	
   %2000	8,000,000		60	3	1.6	
   %2003	6,000,000		55	2.5	0.3	0.3
   %2005	5,000,000		50	2	0.5	0.25
   %2010	3,000,000		40	1.5	0.4	0.1
   %2015	3,000,000	50,000	20	1.3	0.33	0.08
    an & dram & sram & cpu \\
    1985 & 200 & 150 & 166 \\
    1990 & 100 & 35 & 50 \\
    1995 & 70 & 15 & 6 \\
    2000 & 60 & 3 & 1.6 \\
    2003 & 55	& 2.5	& 0.3	 \\
    2005 & 50	&2	&0.5	 \\
    2010 & 40	& 1.5	&0.4	 \\
    2015 & 20	& 1.3	& 0.33	 \\
    }\mydata
    \begin{axis}[            
            xmin=1980,
	    ymax=2020,
            %nodes near coords,
            %nodes near coords align={vertical},
            ymin=0,ymax=300,
            ylabel={nsec},
	    legend pos= north east,
	    x tick label style={
		/pgf/number format/1000 sep=},
        ]
        \addplot table[x=an,y=dram]{\mydata};
        \addlegendentry{Temps d'accès à une DRAM}
	\addplot table[x=an,y=cpu]{\mydata};
        \addlegendentry{Durée d'un cycle CPU}
    \end{axis}


Une première solution pour pallier à ce problème était de remplacer les mémoires DRAM par des SRAM. En effet, cette technologie a des temps d'accès qui sont nettement plus courts comme illustré sur la :numref:`fig-sram-cpu`. 
    
.. _fig-sram-cpu:
.. tikz:: Gap entre la durée d'un cycle CPU (en nsec) et un temps d'accès à la SRAM 
   
   \pgfplotstableread[row sep=\\,col sep=&]{
   %   	Disk seek time	SSD access time	DRAM access time	SRAM access tim CPU cycle time	Effective CPU cycle time
   %1985	75,000,000		200	150	166	
   %1990	28,000,000		100	35	50	
   %1995	10,000,000		70	15	6	
   %2000	8,000,000		60	3	1.6	
   %2003	6,000,000		55	2.5	0.3	0.3
   %2005	5,000,000		50	2	0.5	0.25
   %2010	3,000,000		40	1.5	0.4	0.1
   %2015	3,000,000	50,000	20	1.3	0.33	0.08
    an & dram & sram & cpu \\
    1985 & 200 & 150 & 166 \\
    1990 & 100 & 35 & 50 \\
    1995 & 70 & 15 & 6 \\
    2000 & 60 & 3 & 1.6 \\
    2003 & 55	& 2.5	& 0.3	 \\
    2005 & 50	&2	&0.5	 \\
    2010 & 40	& 1.5	&0.4	 \\
    2015 & 20	& 1.3	& 0.33	 \\
    }\mydata
    \begin{semilogyaxis}[            
            xmin=1980,
	    ymax=2020,
            %nodes near coords,
            %nodes near coords align={vertical},
            ymin=0,ymax=5000,
            ylabel={nsec},
	    legend pos= north east,
	    x tick label style={
		/pgf/number format/1000 sep=},
        ]
        \addplot table[x=an,y=sram]{\mydata};
        \addlegendentry{Temps d'accès à une SRAM}
	\addplot table[x=an,y=cpu]{\mydata};
        \addlegendentry{Durée d'un cycle CPU}
    \end{semilogyaxis}


Si les SRAMs sont satisfaisantes au niveau des temps d'accès, elles ont un inconvénient majeur: leur capacité limitée. Il est économiquement impossible de construire un ordinateur qui n'utiliserait que de la mémoire de type SRAM. La solution qui a été trouvée par l'industrie informatique pour résoudre ce problème a été l'introduction des mémoires caches. Une :term:`mémoire cache` est une mémoire SRAM de faible capacité qui s'intercale entre le CPU et la mémoire DRAM.


.. _fig-cache:
.. tikz:: La cache s'interpose entre le CPU et la mémoire RAM
   :libs: positioning 

   \fill[gray] (0,0) -- (0,-6) -- (2, -5) -- (2,-1) -- cycle;
   \node at (1,-3) (CPU) {\textbf{CPU}};   

   \fill[lightgray] (5,0) -- (5,-6) -- (7, -6) -- (7,0) -- (5,0) -- cycle;
   \node at (6,-3) (RAM) {\textbf{RAM}};

   \fill[lightgray] (3.5,-2) -- (3.5,-4) -- (4.2, -4) -- (4.2,-2) -- (3.5,-2) -- cycle;
   \node[rotate=-90] at (3.85,-3) (cache) {\textbf{cache}};
   \draw [->, color=blue] (2,-2.5) -- (3.5,-2.5) node[midway, below] {addr}; 
   \draw [->, color=blue] (4,-2.5) -- (5,-2.5) node[midway, below] {addr};

   \draw [<->, color=blue] (2,-3.5) -- (3.5,-3.5) node[midway, below] {data}; 
   \draw [<->, color=blue] (4,-3.5) -- (5,-3.5) node[midway, below] {data};


Une mémoire cache ne fonctionne pas comme une mémoire RAM. Une mémoire RAM est un peu comme un tableau dans un langage de programmation comme python. En python, on peut accéder à un élément de ce tableau en utilisant son index. Dans une mémoire RAM, on accède à une donnée en fournissant son adresse. Chaque zone a la mémoire est identifiée par une adresse unique et une mémoire RAM supporte autant d'adresses qu'il y a d'éléments qu'elle peut stocker en mémoire.

Une mémoire cache est une mémoire qui est dite associative. Une cache stocke des couples `adresse, donnée`. Elle fonctionne un peu comme un dictionnaire en langage python. Lorsqu'elle reçoit une adresse, elle parcourt rapidement l'ensemble des couples `adresse, donnée` qu'elle a mémorisé. Si l'adresse demandée s'y trouve, elle retourne la donnée qui y est associée au processeur et arrête de demander cette adresse à la mémoire RAM. Sinon, elle attend simplement que la mémoire, plus lente, retourne la donnée demandé au processeur. Lorsque la mémoire RAM retourne la valeur demandée par le processeur, celle-ci passe par la mémoire cache qui en profite pour mémoriser ce nouveau couple `adresse,donnée`. Comme la capacité de la mémoire cache est limitée, il est possible qu'elle doivent supprimer un ancien couple pour avoir la place pour stocker le nouveau couple.

   
Une analyse détaillée du fonctionnement des mémoires cache sort du cadre de ce cours. La :numref:`fig-cache-cpu` présente l'évolution de la taille des mémoires cache sur les processeurs intel durant les trente dernières années. On est passé de quelques KBytes à quelques dizaines de MBytes, soit une capacité décuplée chaque décennie.


.. % taille des caches des processeurs intel
.. % https://en.wikipedia.org/wiki/List_of_Intel_processors

.. _fig-cache-cpu:
.. tikz:: Evolution de la taille totale de la cache sur les processeurs intel
   
   \pgfplotstableread[row sep=\\,col sep=&]{
   an & cache \\
   1989 & 8 \\ % 80486DX
   1993 & 16 \\ % P5 8KB instruction, 8KB données
   1996 & 262 \\ %P6 L1 et L2 cache
   1997 & 1024 \\ %P6 +
   1999 & 2048 \\ %Pentium II Xeon
   2002 & 9100 \\ %Itanium2 Madison
   2006 & 8096 \\ %Kentsfield 8M cache
   2008 & 8300 \\ %core i7 L2+L3
   2010 & 12256 \\ %gulftown
   2017 & 12000 \\ %i7
   2020 & 20000 \\ %i9
   }\mydata
    \begin{semilogyaxis}[            
            xmin=1987,
	    ymax=2020,
            %nodes near coords,
            %nodes near coords align={vertical},
            ymin=1,ymax=30000,
            ylabel={KBytes},
	    legend pos= south east,
	    x tick label style={
		/pgf/number format/1000 sep=},
        ]
        \addplot table[x=an,y=cache]{\mydata};
        \legend{Taille de la cache en KBytes} 
    \end{semilogyaxis}


Vu la différence au niveau des temps d'accès entre les mémoires caches et la DRAM, il peut être intéressant pour certains types de programmes qui échangent beaucoup de données avec la mémoire de traiter des blocs de données qui tiennent à l'intérieur de la cache. Vous aborderez ces techniques dans d'autres cours du bachelier et en master.
   

Pour terminer, notre discussion des ordinateurs actuels, il est intéressant d'analyser rapidement les dispositifs de stockage. Pour exécuter un programme, il faut d'abord le charger en mémoire RAM depuis un disque dur ou un lecteur SSD. Les données que le programme manipule sont aussi également stockées sur ce disque dur ou ce lecteur SSD. Sans entrer dans les détails du fonctionnement de ces dispositifs de stockage (ce sera l'objet du cours de systèmes informatiques), il est utile d'avoir en tête les performances de ces dispositifs. Un tel dispositif de stockage est conçu pour stocker des blocs de données qui sont généralement lus par le système d'exploitation. Les premiers disques durs datent de la fin des années 1950 avec l'`IBM 350 <https://en.wikipedia.org/wiki/IBM_350>`_ qui avait une capacité de 3.75 MBytes. Les disques durs actuels peuvent stocker plusieurs TBytes de données et il est possible de construire des armoires de stockage qui regroupent des centaines ou des milliers de tels disques durs. La capacité de ces disques durs n'a fait qu'augmenter au fil des années. Malheureusement, tout comme les DRAMs, les temps d'accès n'ont pas étés réduits aussi rapidement (voir :numref:`fig-hd` également extraite du livre `Computer Systems: A Programmer's Perspective <http://csapp.cs.cmu.edu/3e/figures.html>`_ ). C'est lié à la technologie utilisée pour construire ces dispositifs de stockage. 



.. _fig-hd:
.. tikz:: Evolution du temps d'accès aux disques durs
   
   \pgfplotstableread[row sep=\\,col sep=&]{
   an & disque \\
   1985	& 75000000 \\
   1990	& 28000000 \\ 
   1995	& 10000000 \\
   2000	& 8000000 \\
   2003	& 6000000 \\
   2005	& 5000000 \\
   2010	& 3000000 \\
   2015	& 3000000 \\
   }\mydata
   \begin{semilogyaxis}[            
            xmin=1983,
	    ymax=2020,
            %nodes near coords,
            %nodes near coords align={vertical},
            ymin=1000000,ymax=100000000,
            ylabel={nsec},
	    legend pos= south east,
	    x tick label style={
		/pgf/number format/1000 sep=},
        ]
        \addplot table[x=an,y=disque]{\mydata};
        \legend{Temps d'accès au disque dur};
   \end{semilogyaxis}




    
