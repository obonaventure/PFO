

BITS=4
a=0b01011
b=0b01010

#begin

def lowest_order_bit(x):
    return x & 0b0001

def mult(multiplicande,multiplicateur):
    resultat=0b00000000
    for i in range(4):
        if lowest_order_bit(multiplicateur) == 1:
            resultat = resultat + multiplicande
        multiplicande = multiplicande << 1
        multiplicateur = multiplicateur >>1
    return resultat

#end

print(lowest_order_bit(a))
print(lowest_order_bit(b))
print(mult(a,b))        
