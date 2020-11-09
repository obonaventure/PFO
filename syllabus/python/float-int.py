import sys

i=1
f=1.0
for n in range (2000):
    print(n,i,f)
    if f == float('inf') :
        print(n, "dépassement de capacité")
        break
    f=f*3.0
    i=i*3

