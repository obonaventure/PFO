import sys


f=2.0
for n in range (2000):
    f=f*2
    if n%100==0:  
        print(f,sys.getsizeof(f))
    if f == float('inf') :
        print(n, "dépassement de capacité")
        break
    
