Introduction
============

.. spelling:word-list::

   coeur
   oeuvre



Les ordinateurs sont au coeur d'un nombre grandissant de services dans notre
société qui est de plus en plus numérique. Ce cours vise à vous apprendre les principes de base de fonctionnement des dispositifs numériques que vous utilisez tous les jours. Le cours s'appuie sur l'excellent livre `The Elements of Computing Systems <https://www.nand2tetris.org>`_ écrit par Noam Nisan et Shimon Schocken et publié au MIT Press. 

Ce syllabus n'est pas exhaustif, le livre de référence contient de nombreux détails qui ne sont pas abordés dans le syllabus. Par contre, le syllabus est interactif, c'est-à-dire qu'à côté des concepts théoriques, vous y trouverez également de nombreux exercices qui sont supportés par `inginious <https://inginious.info.ucl.ac.be>`_ afin de permettre à chaque étudiant de vérifier sa compréhension de la théorie.

Le cours est divisé en cinq missions qui abordent chacune un aspect particulier du fonctionnement des ordinateurs. Chaque mission dure deux semaines. Durant la première semaine, nous détaillerons les principes théoriques et vérifierons via des exercices simples qu'ils sont bien compris par tous les étudiants. Ceux-ci seront mis en oeuvre durant la seconde partie de la mission via un mini-projet qui sera réalisé de façon individuelle.

Nous aborderons cinq aspects différents du fonctionnement des ordinateurs dans ce syllabus. Dans tout ordinateur, l'information est encodée sous la forme de :index:`bits`. Chaque bit peut prendre deux valeurs distinctes: `0` et `1`. Leur intérêt principal est qu'il est possible de représenter n'importe quel type de données (nombre, caractères, texte, image, vidéo, son, ...) sous la forme d'une séquence de bits. Durant la première mission, nous nous concentrerons sur la logique booléenne qui permet de manipuler ces bits. Les premiers ordinateurs ont été conçus pour effectuer des calculs numériques. Nous verrons durant la deuxième mission comment représenter les nombres sous forme binaire et ensuite comment construire des circuits qui permettent de réaliser des additions, des soustractions et d'autres opérations sur les nombres entiers. La troisième mission se concentrera sur comment un ordinateur peut mémoriser de l'information et utiliser l'information stockée en mémoire.

Avec ces trois premières missions, nous aurons appris les bases qui permettent de concevoir un microprocesseur simple qui pourra être programmé. Nous commencerons par construire un langage machine qui permet de programmer ce microprocesseur. Grâce à un simulateur, nous pourrons tester de petits programmes sur notre futur microprocesseur avant de le construire. La mission suivante se concentrera sur l'architecture des ordinateurs et les interactions entre le microprocesseur, la mémoire et les entrées/sorties. Après avoir construit ce microprocesseur, vous pourrez voir comment définir un langage d'assemblage qui est plus facile à utiliser pour les programmeurs que le langage machine.

Une version imprimable de ce document est disponible via :download:`/LSINC1102.pdf`. 
