import time


a=int(12344)
b=int(4)
c=int(2)

t0=time.perf_counter()
for i in range(100000000):
    a=a//b
t1=time.perf_counter()
print(t1-t0)
a=int(12344)
t0=time.perf_counter()
for i in range(100000000):
    a=a >> c
t1=time.perf_counter()
print(t1-t0)
