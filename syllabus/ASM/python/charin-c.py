
mystr="Hello!\0"
c='o'
r=0 # absent
i=0
while(mystr[i]!='\0'):
    if mystr[i]==c:
        r=1 # present
        break
    i=i+1

#fin
    

print(r)
