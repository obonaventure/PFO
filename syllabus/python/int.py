import sys


i=1
for n in range (2000):
    if n<40 or n%100==0:  
        print(n,i,sys.getsizeof(i))
    i=i*2
