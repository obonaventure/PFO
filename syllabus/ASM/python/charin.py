
mystr="Hello!"
c='h'
r=0 # absent
i=0
while(i<len(mystr)):
    if mystr[i]==c:
        r=1 # present
        break
    i=i+1

#fin
    
print(len(mystr))
print(r)
