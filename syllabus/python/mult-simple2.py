
a=7
b=22

#begin

def mult(multiplicande,multiplicateur):
    produit=0
    if (multiplicateur<multiplicande) :
        for i in range(multiplicateur):
            produit = produit + multiplicande
    else:
        for i in range(multiplicande):
            produit = produit + multiplicateur
    return produit

#end

print(mult(a,b))        
