
# Somme des n premiers naturels
def sumn(n):
    if(n==0):
        return(0)
    return(n+sumn(n-1))

print(sumn(1)) # affiche 1
print(sumn(3)) # affiche 6
