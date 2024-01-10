Introduction
============

.. spelling:word-list::

   coeur
   oeuvre



Les ordinateurs sont au coeur d'un nombre grandissant de services dans notre
société qui est de plus en plus numérique. Ce cours vise à vous apprendre les
principes de base de fonctionnement des dispositifs numériques que vous utilisez tous
les jours. Le syllabus est divisé en deux parties.

La première partie se focalise sur l'apprentissage de l'assembleur. L'assembleur ou langage d'assemblage est l'ensemble des instructions simples qui sont directement supportées par un microprocesseur. Plutôt que de considérer un microprocesseur réelle avec toute sa complexité, les syllabus utilise un [simulateur de microprocesseur](https://github.com/Schweigi/assembler-simulator) dévelopé intialement par [Marco Schweighauser](https://github.com/Schweigi) et amélioré par [Nikita Tyunyayev](https://github.com/ntyunyayev). Cette première partie du syllabus vous permettre de comprendre les principes de base de la programmation d'un microprocesseur simple en assembleur.

La deuxième partie du livre abordera les aspects matériels en construisant pas à pas un microprocesseur extrèmement simple mais fonctionnel. Cette partie s'appuie sur l'excellent livre `The Elements of Computing Systems <https://www.nand2tetris.org>`_ écrit par Noam Nisan et Shimon Schocken et publié au MIT Press. 

Ce syllabus n'est pas exhaustif, le livre de référence contient de nombreux détails qui ne sont pas abordés dans le syllabus. Par contre, la version web du syllabus est interactive, c'est-à-dire qu'à côté des concepts théoriques, vous y trouverez également de nombreux exercices qui sont supportés par `inginious <https://inginious.info.ucl.ac.be>`_ afin de permettre à chaque étudiant de vérifier sa compréhension de la théorie.


Nous aborderons différents aspects du fonctionnement des ordinateurs dans ce syllabus. Dans tout ordinateur, l'information est encodée sous la forme de :index:`bits`. Chaque bit peut prendre deux valeurs distinctes: `0` et `1`. Leur intérêt principal est qu'il est possible de représenter n'importe quel type de données (nombre, caractères, texte, image, vidéo, son, ...) sous la forme d'une séquence de bits. Nous nous concentrerons sur la logique booléenne qui permet de manipuler ces bits. Les premiers ordinateurs ont été conçus pour effectuer des calculs numériques. Nous verrons ensuite comment représenter les nombres sous forme binaire et comment construire des circuits qui permettent de réaliser des additions, des soustractions et d'autres opérations sur les nombres entiers. Nous pourrons ensuite analyser comment un ordinateur peut mémoriser de l'information et utiliser l'information stockée en mémoire.

A ce stade, nous aurons appris les bases qui permettent de concevoir un microprocesseur simple qui pourra être programmé. Nous nous concentrerons ensuite sur l'architecture des ordinateurs et les interactions entre le microprocesseur, la mémoire et les entrées/sorties. Après avoir construit ce microprocesseur, vous pourrez voir comment il peut supporter un langage d'assemblage simple. Le cours se terminera par une explication du fonctionnement des dispositifs de stockage de données.

Une version imprimable de ce document est disponible via :download:`/PFO.pdf`. 
