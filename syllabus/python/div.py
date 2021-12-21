


a=0b01111011
b=0b0111

#begin
def div(dividende,diviseur):
    quotient=0b0000
    reste = dividende
    diviseur = diviseur << 4
    for i in range(4+1):
        r=reste-diviseur
        if( r > 0 ):
            reste=r
            quotient = quotient << 1
            quotient = quotient | 0b0001
        else:
            quotient = quotient << 1
            quotient = quotient & 0b1110

        diviseur = diviseur >> 1
    return quotient, reste
#end

print(div(a,b))        
print(divmod(a,b))
