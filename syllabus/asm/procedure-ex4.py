

compteur=0

def oppose():
    global compteur
    compteur = -compteur


def compte():
    global compteur
    compteur = compteur+1
    oppose()

    
a=1          # ligne 1
compte()     # ligne 2
a=2          # ligne 3
compte()     # ligne 4
a=3          # ligne 5

