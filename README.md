# Principes de fonctionnement des ordinateurs

[![Build Status](https://travis-ci.org/obonaventure/PFO.svg?branch=master)](https://travis-ci.org/obonaventure/PFO.svg)

Ce dépôt GitHub contient les sources du syllabus interactif du cours de Principes de Fonctionnement des Ordinateurs qui est donné dans le cadre du [bachelier en sciences informatiques (e-santé)](https://uclouvain.be/bac-e-sante) co-organisé par l'[UCLouvain](https://uclouvain.be) et l'[UNamur](https://unamur.be) sur le site de la HELHA à Montignies-sur-Sambre.

Ce cours et ce syllabus s'appuient fortement sur l'excellent livre [The Elements of Computing Systems](https://www.nand2tetris.org) écrit par Noam Nisan et Shimon Schocken et publié par MIT Press.

Les notes sont écrites en [restructured text](http://docutils.sourceforge.net/rst.html) et peuvent être transformées en un document au format HTML, epub ou PDF en utilisant le logiciel [sphinx](https://sphinx-doc.org). La plupart des figures sont écrites en utilisant [tikz](https://pgf-tikz.github.io/pgf/pgfmanual.pdf). 

Le syllabus sera mis régulièrement à jour et les étudiants sont encouragés à soumettre [soumettre des issues](https://github.com/obonaventure/PFO/issues) ou mieux proposer des améliorations sous la forme de [pull requests](https://github.com/obonaventure/PFO/pulls)

##Créer des issues

Sur GitHub, une issue est la façond de documenter un problème dans un programme qui devrait être résolu pour les développeurs. En général, on essaye de documenter ce problème de la façon la plus précise possible. Dans le cas du syllabus, le problème sera une figure incorrecte, une mauvaise explication ou des informations qui manque. 

Pour créer une issue sur GitHub, connectez-vous sur GitHub et choisissez un
nom d'utilisateur et un mot de passe.

Lors de votre premier accès à [https://github.com/obonaventure/PFO](https://github.com/obonaventure/PFO), GitHub vous recommande de lire le tutoriel accessible depuis [https://guides.github.com/activities/hello-world/](https://guides.github.com/activities/hello-world/), c'est une excellente idée.

Voici quelques copies d'écrans qui illustrent comment écrire une issue concernant le syllabus depuis GitHub.

La première étape est d'aller dans la zone relative aux "Issues"
le projet GitHub du blog.

![GitHub issue](/images/github-issues.png)

Ensuite il faut créer une nouvelle "Issue".

![GitHub create issue](/images/github-create-issue.png)

Vous pouvez maintenant expliquer le problème que vous avez identifié dans la nouvelle "Issue".

Votre "Issue" est maintenant prête vous pouvez commencer une discussion pour
voir comment la résoudre. 

## Créer un pull request

Un pull request est une modification sur un dépôt git stocké sur GitHub que vous souhaitez proposer. Pour pouvoir faire une telle contribution, vous devez d'abord créer une copie (un fork) du dépôt.

![GitHub fork](/images/github-fork.png)

Après quelques secondes, vous avez maintenant un repo GitHub contenant
une copie de celui du syllabus. C'est ce dépôt que vous allez modifier et dans
lequel vous allez ajouter ou modifier du texte.

![GitHub fork](/images/github-fork-2.png)

Vous pouvez maintenant modifier votre copie personelle du syllabus. Vous avez accès à l'ensemble des fichiers en restructured text, python et assembleur qui permettent de construire le syllabus. Les modifications les plus simples sont la correction d'une erreur dans le texte (faute de frappe, faute d'orthographe, mot imprécis, ...). 

La structure générale du répertoire est la suivante

![GitHub fork](/images/github-rep.png)

Tout le texte se trouve dans les fichiers avec le suffixe ```.rst``` . Le fichier ```index.rst``` est celui qui contient la table des matières et charge les autres fichiers dans le bon ordre. Le fichier ```glossary.rst``` contient le glossaire dont nous reparlerons. Le fichier ```dict.txt``` contient les exceptions pour le vérificateur orthographique.

Imaginons que vous voulez corriger une erreur dans le fichier ```introduction.rst```. Tout cela peut se faire directement depuis GitHub. Cliquez sur le fichier ```introduction.rst```.

![GitHub fork](/images/github-intro.png)

Vous pouvez ensuite éditer ce fichier en cliquant sur le crayon.

![GitHub fork](/images/github-edit.png)

Après avoir fait vos corrections, vous les documentez dans un message de commit en dessous et sélectionnez "create a new branch for this commit and start a pull request". Cela vous permettra de démarrer un pull request vers le projet principal. Ce pull request démarre en créant ue branche sur votre copie du dépôt.

![GitHub fork](/images/github-commit.png)

Vous avez maintenant votre premier pull request que vous pouvez envoyer au projet principal en cliquant sur "create pull request".

![GitHub fork](/images/github-pr.png)

Si vous avez d'autres modifications à ajouter, vous pourrez le faire en poussant les commit correspondant sur cette branche.

![GitHub fork](/images/github-pr-2.png)


Il vous suffit ensuite de taper sur Merge pull request et puis confirm merge pour accepter votre pull request sur votre dépôt.

![GitHub fork](/images/github-pr-3.png)

Vous pouvez maintenant soumettre votre pull request au projet principal  en cliquant sur pull request en dessous du bouton add file. 


![GitHub fork](/images/github-submit-pr.png)

Vous arrivez maintenant sur le projet principal et GitHub vous présente votre proposition de modification

![GitHub fork](/images/github-submit-pr-2.png)

Il vous suffit de cliquer sur "Create pull request" pour que celle-ci soit soumise au projet principal. Indiquez dans votre pull request une petit explication. Si elle résoude une issue, indiquez le numéro de cette issue précédé par # dans le titre.

![GitHub fork](/images/github-submit-pr-3.png)

GitHub va vérifier si votre proposition de modification peut être acceptée sans causer de conflit. Ensuite, l'intégration continue va vérifier si il est encore possible de construire le syllabus après votre modification. Le responsable du projet aura accès à votre pull request et pourra en discuter avec vous.


Vous pouvez aussi proposer des définitions dans le glossaire. Celui-ci contient les définitions de quelques termes importants, mais vous pouvez en ajouter d'autres. Vous trouverez plus d'informations sur la façon dont un glossaire Sphinx est organisé dans la [documentation officielle de sphinx](https://www.sphinx-doc.org/en/master/glossary.html).



Intégration continue
--------------------

Le syllabus utilise [travis](https://travis-ci.com/) comme système d'intégration continue. Si vous soumettez une proposition de modification au syllabus, tout le syllabus sera recompilé pour vérifier si votre modification est correcte au niveau de la syntaxe et de l'orthographe. Pensez à mettre des commentaires dans vos pull-requests en expliquant la raison de vos modifications. Essayez également de regrouper vos modifications pour faciliter leur relecture avant une intégration. Vous pouvez accéder aux résultats des tests d'intégration continue via [https://travis-ci.org/github/obonaventure/PFO](https://travis-ci.org/github/obonaventure/PFO)




Compilation
-----------

Pour faciliter cette compilation, une configuration [vagrant](https://www.vagrantup.com) est reprise dans le fichier [Vagrantfile](https://github.com/obonaventure/SystemesInformatiques/tree/master/Vagrantfile) se trouvant à la racine du projet.  [Vagrant](https://www.vagrantup.com) est un logiciel fonctionnant sur Linux, Windows et MacOS qui permet d'automatiser et de faciliter la création de machines virtuelles supportées notamment par [Virtualbox](https://www.virtualbox.org).

Pour démarrer votre environnement [Vagrant](https://www.vagrantup.com), commencez par installer [Vagrant](https://www.vagrantup.com) et [Virtualbox](https://www.virtualbox.org). [Vagrant](https://www.vagrantup.com) utilise le [Vagrantfile](https://github.com/obonaventure/PFO/Vagrantfile) pour créer les machines virtuelles. Ce dernier marque le dossier racine du projet et décrit le type de machine ainsi que les dépendances logicielles nécessaires au projet.

Plutôt que de créer une machine virtuelle à partir de zéro, [Vagrant](https://www.vagrantup.com) utilise une image de base à partir de laquelle créer la nouvelle machine virtuelle. Dans notre cas, le projet est configuré pour utiliser l'image "hashicorp/precise32" via la ligne `config.vm.box = "hashicorp/precise32"` dans le [Vagrantfile](https://github.com/obonaventure/SystemesInformatiques/tree/master/Vagrantfile). Si cette image n'est pas encore présente sur votre machine, elle sera automatiquement téléchargée lors du lancement de la machine virtuelle.

Pour démarrer votre environnement Vagrant, exécutez la commande `vagrant up` depuis le répertoire racine du projet. Cette commande télécharge toutes les dépendances nécessaires, démarre et configure la machine virtuelle. Lorsqu'elle termine, vous pouvez exécuter la commande `vagrant ssh` pour démarrer une session SSH avec la machine virtuelle nouvellement créée.

Cette machine virtuelle ne fournit pas d'interface graphique et vous serez donc contraints d'intéragir avec cette dernière en ligne de commande. Sur cette machine virtuelle, vous trouverez le répertoire `/vagrant` qui est en réalité un dossier partagé avec le répertoire racine du projet sur la machine host. [Vagrant](https://www.vagrantup.com) se charge de synchroniser automatiquement tous les changements à ce dossier depuis et vers la machine virtuelle. Vous n'êtes donc pas contraints de travailler sur le projet depuis le terminal à travers une session SSH. Vous pouvez très bien utiliser votre éditeur de texte favori sur votre machine host pour modifier n'importe quel fichier du projet. Les changements seront alors automatiquement synchronisés avec la machine virtuelle. Pour vous en convaincre, créez un nouveau fichier et vérifiez qu'il apparaît bien à la fois sur votre machine host et dans le répertoire `/vagrant` de la machine virtuelle.

Finalement, lorsque que vous avez terminé de travailler sur le projet, vous pouvez exécuter la commande `vagrant destroy` pour supprimer toutes les traces de la machine virtuelle précédemment créée.
