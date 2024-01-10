
str="Hello!"
c='h'
r=0 # absent
i=0
while(i<len(str)):
    if str[i]==c:
        r=1 # present
        break
    i=i+1

#fin
    
print(len(str))
print(r)
