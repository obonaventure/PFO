
# incrémente son argument de 1
def f1(x):
    y=x+1
    return(y)

# incrémente son argument de 2
def f2(x):
    y=f1(x)
    z=f1(y)
    return(z)

# retourne le minimum
def min(x,y):
    if (x<y):
        r=x
    else:
        r=y
    return(r)

print(f1(3)) # affiche 4
print(f2(5)) # affiche 7
print(min(3,5)) # affiche 3
