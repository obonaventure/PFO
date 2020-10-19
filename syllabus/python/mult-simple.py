
a=7
b=22

#begin

def mult(multiplicande,multiplicateur):
    produit=0
    for i in range(multiplicateur):
        produit = produit + multiplicande
    return produit

#end

print(mult(a,b))        
