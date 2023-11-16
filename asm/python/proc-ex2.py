
compteur=0

def compte():
   global compteur
   compteur = compteur+1

x=0
compte()
x=123+compteur
print(x)
