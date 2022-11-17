.. include:: defs.rst

Premier projet
--------------

Votre premier projet dans le cadre de ce cours est de construire les circuits de base que l'on retrouve dans tout ordinateur en utilisant exclusivement des fonctions `NAND`. Ces circuits sont:

 - `NOT` (une entrée), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Not
 - `AND` (deux entrées), voir https://inginious.info.ucl.ac.be/course/LSINC1102/And
 - `OR` (deux entrées), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Or
 - `XOR` (deux entrées), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Xor  
 - Multiplexeur (deux entrées et sélecteur), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Mux
 - Démultiplexeur (une entrée et sélecteur, une sortie), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Dmux

Construisez ces différents circuits dans l'ordre indiqué en réutilisant pour chaque circuit votre circuit précédent.
   
Dans la suite du cours, vous devrez aussi utiliser des circuits qui manipulent des mots de 16 bits. Vous devez donc construire les circuits :

 - `NOT16` (16 entrées et 16 sorties), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Not16
 - `AND16` (16 entrées et 16 sorties), voir https://inginious.info.ucl.ac.be/course/LSINC1102/And16
 - `OR16` (16 entrées et 16 sorties), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Or16
 - Multiplexeur16 (2 fois 16 entrées, un sélecteur et 16 sorties), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Mux16

En outre, vous devez également construire les circuits suivants:

 - une fonction `OR` avec 8 entrées et une sortie (`Or8Way`), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Or8Way
 - un multiplexeur avec 4 entrées sur 16 bits, un sélecteur sur 2 bits et 16 sorties (`Mux4Way16`), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Mux4Way16
 - un multiplexeur avec 8 entrées sur 16 bits, un sélecteur sur 3 bits et 16 sortie (`Mux8Way16`), voir https://inginious.info.ucl.ac.be/course/LSINC1102/Mux8Way16
 - un démultiplexeur une entrée sur 16 bits, un sélecteur sur 2 bits et 4 sorties sur 16 bits (`DMux4Way`), voir https://inginious.info.ucl.ac.be/course/LSINC1102/DMux4Way
 - un démultiplexeur une entrée sur 16 bits, un sélecteur sur 3 bits et 8 sorties sur 16 bits (`DMux8Way`), voir https://inginious.info.ucl.ac.be/course/LSINC1102/DMux8Way
   
   
Ce projet est également décrit en ligne sur le site `nand2tetris.org/project01 <https://www.nand2tetris.org/project01>`_.

La date limite pour ce projet est fixée au |deadlineP1|. Vous devez déposer toutes vos solutions aux exercices pour cette date sur https://inginious.info.ucl.ac.be/course/LSINC1102/ Vous aurez un retour sur votre projet durant la séance de travaux pratiques de la semaine suivante. 

Deuxième projet
===============

Ce projet est à rendre par groupe de deux étudiants pour le |deadlineP2| sur inginious. 

1. Construisez un demi-additionneur sur un bit, https://inginious.info.ucl.ac.be/course/LSINC1102/HalfAdder 

2. Construisez un additionneur complet sur un bit, https://inginious.info.ucl.ac.be/course/LSINC1102/FullAdder

3. Construisez un additionneur sur 16 bits, https://inginious.info.ucl.ac.be/course/LSINC1102/Add16

4. Construisez un circuit permettant d'incrémenter un nombre sur 16 bits, https://inginious.info.ucl.ac.be/course/LSINC1102/Inc16

5. Construisez l'ALU qui a été présentée en détails dans la section précédente, https://inginious.info.ucl.ac.be/course/LSINC1102/ALU


    
Troisième projet
================

Ce projet est à rendre par groupe de deux étudiants pour le |deadlineP3| sur inginious.

1. Construisez un circuit permettant de stocker un bit, https://inginious.info.ucl.ac.be/course/LSINC1102/Bit

2. Construisez un circuit permettant d'implémenter un registre à 16 bits, https://inginious.info.ucl.ac.be/course/LSINC1102/Register

3. Construisez un circuit permettant de supporter une mémoire RAM comprenant 8 registres de 16 bits chacun, https://inginious.info.ucl.ac.be/course/LSINC1102/RAM8

4. Construisez un circuit permettant de supporter une mémoire RAM comprenant 64 registres de 16 bits chacun, https://inginious.info.ucl.ac.be/course/LSINC1102/RAM64

5. Construisez un circuit permettant de supporter une mémoire RAM comprenant 512 registres de 16 bits chacun, https://inginious.info.ucl.ac.be/course/LSINC1102/RAM512

.. 6. Construisez un circuit permettant de supporter une mémoire RAM comprenant 4096 registres de 16 bits chacun, https://inginious.info.ucl.ac.be/course/LSINC1102/RAM4K

.. 7. Construisez un circuit permettant de supporter une mémoire RAM comprenant 16K registres de 16 bits chacun, https://inginious.info.ucl.ac.be/course/LSINC1102/RAM16K

6. Construisez un circuit permettant d'implémenter un compteur de programme, https://inginious.info.ucl.ac.be/course/LSINC1102/PC


		 
      
Quatrième projet
================


L'objectif de ce quatrième projet, qui se fera de façon individuelle, est de démontrer votre connaissance de la programmation en langage d'assemblage. Vous devrez écrire deux petits programmes dans ce langage pour le |deadlineP4|. Ce projet vaut trois points et sera le dernier projet côté pour le cours cette année.


1. Implémentez un programme en langage d'assemblage qui permet de calculer le résultat de la multiplication entre deux naturels. Ce programme est à déposer sur inginious : https://inginious.info.ucl.ac.be/course/LSINC1102/MultAsm
   Cet exercice compte pour un point sur les trois points de ce projet.

2. Vous avez maintenant appris les bases vous permettant d'écrire un petit programme en langage d'assemblage. En utilisant ces connaissances, soyez créatifs et proposez un programme non trivial qui traite des données sous la forme d'un tableau, d'une matrice ou de chaînes de caractères. Le type de traitement est laissé à votre choix. Inventez un traitement qui est utile et écrivez d'abord un petit programme python qui réalise un traitement de votre choix. Écrivez un script de test qui permettra de valider votre programme. Ensuite, traduisez ce programme en minuscule langage d'assemblage et utilisez votre script de test pour démontrer le bon fonctionnement de votre programme. Justifiez vos choix éventuels dans les commentaires de votre programme et du script de test. Cette seconde partie du projet comptera pour 2 points, le programme et le script de test auront le même poids.
   
