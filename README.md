# Principes de fonctionnement des ordinateurs

[![Build Status](https://travis-ci.org/obonaventure/PFO.svg?branch=master)](https://travis-ci.org/obonaventure/PFO.svg)

Ce dépôt GitHub contient les sources du syllabus interactif du cours de Principes de Fonctionnement des Ordinateurs qui est donné dans le cadre du [bachelier en sciences informatiques (e-santé)](https://uclouvain.be/bac-e-sante) co-organisé par l'[UCLouvain](https://uclouvain.be) et l'[UNamur](https://unamur.be) sur le site de la HELHA à Montignies-sur-Sambre.

Ce cours et ce syllabus s'appuient fortement sur l'excellent livre [The Elements of Computing Systems](https://www.nand2tetris.org) écrit par Noam Nisan et Shimon Schocken et publié par MIT Press.


Le syllabus sera mis régulièrement à jour et les étudiants sont encouragés à soumettre [soumettre des issues](https://github.com/obonaventure/PFO/issues) ou mieux proposer des améliorations sous la forme de [pull requests](https://github.com/obonaventure/PFO/pulls)



Compilation
-----------

Les notes sont écrites en [restructured text](http://docutils.sourceforge.net/rst.html) et peuvent être transformées en un document au format HTML, epub ou PDF en utilisant le logiciel [sphinx](https://sphinx-doc.org). Pour faciliter cette compilation, une configuration [vagrant](https://www.vagrantup.com) est reprise dans le fichier [Vagrantfile](https://github.com/obonaventure/SystemesInformatiques/tree/master/Vagrantfile) se trouvant à la racine du projet.  [Vagrant](https://www.vagrantup.com) est un logiciel fonctionnant sur Linux, Windows et MacOS qui permet d'automatiser et de faciliter la création de machines virtuelles supportées notamment par [Virtualbox](https://www.virtualbox.org).

Pour démarrer votre environnement [Vagrant](https://www.vagrantup.com), commencez par installer [Vagrant](https://www.vagrantup.com) et [Virtualbox](https://www.virtualbox.org). [Vagrant](https://www.vagrantup.com) utilise le [Vagrantfile](https://github.com/obonaventure/PFO/Vagrantfile) pour créer les machines virtuelles. Ce dernier marque le dossier racine du projet et décrit le type de machine ainsi que les dépendances logicielles nécessaires au projet.

Plutôt que de créer une machine virtuelle à partir de zéro, [Vagrant](https://www.vagrantup.com) utilise une image de base à partir de laquelle créer la nouvelle machine virtuelle. Dans notre cas, le projet est configuré pour utiliser l'image "hashicorp/precise32" via la ligne `config.vm.box = "hashicorp/precise32"` dans le [Vagrantfile](https://github.com/obonaventure/SystemesInformatiques/tree/master/Vagrantfile). Si cette image n'est pas encore présente sur votre machine, elle sera automatiquement téléchargée lors du lancement de la machine virtuelle.

Pour démarrer votre environnement Vagrant, exécutez la commande `vagrant up` depuis le répertoire racine du projet. Cette commande télécharge toutes les dépendances nécessaires, démarre et configure la machine virtuelle. Lorsqu'elle termine, vous pouvez exécuter la commande `vagrant ssh` pour démarrer une session SSH avec la machine virtuelle nouvellement créée.

Cette machine virtuelle ne fournit pas d'interface graphique et vous serez donc contraints d'intéragir avec cette dernière en ligne de commande. Sur cette machine virtuelle, vous trouverez le répertoire `/vagrant` qui est en réalité un dossier partagé avec le répertoire racine du projet sur la machine host. [Vagrant](https://www.vagrantup.com) se charge de synchroniser automatiquement tous les changements à ce dossier depuis et vers la machine virtuelle. Vous n'êtes donc pas contraints de travailler sur le projet depuis le terminal à travers une session SSH. Vous pouvez très bien utiliser votre éditeur de texte favori sur votre machine host pour modifier n'importe quel fichier du projet. Les changements seront alors automatiquement synchronisés avec la machine virtuelle. Pour vous en convaincre, créez un nouveau fichier et vérifiez qu'il apparaît bien à la fois sur votre machine host et dans le répertoire `/vagrant` de la machine virtuelle.

Finalement, lorsque que vous avez terminé de travailler sur le projet, vous pouvez exécuter la commande `vagrant destroy` pour supprimer toutes les traces de la machine virtuelle précédemment créée.

Intégration continue
--------------------

Le syllabus utilise [travis](https://travis-ci.com/) comme système d'intégration continue. Si vous soumettez une proposition de modification au syllabus, tout le syllabus sera recompilé pour vérifier si votre modification est correcte au niveau de la syntaxe et de l'orthographe. Pensez à mettre des commentaires dans vos pull-requests en expliquant la raison de vos modifications. Essayez également de regrouper vos modifications pour faciliter leur relecture avant une intégration. Vous pouvez accéder aux résultats des tests d'intégration continue via [https://travis-ci.org/github/obonaventure/PFO](https://travis-ci.org/github/obonaventure/PFO)
