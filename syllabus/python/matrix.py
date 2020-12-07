

import time


# Multiplication de matrices - ligne par ligne
N=100

M1 = [ [ i+j for i in range(N) ] for j in range(N) ]
M2 = [ [ i+j for i in range(N) ] for j in range(N) ]
result = [ [ 0 for i in range(N) ] for j in range(N) ]

now=time.perf_counter_ns()

for i in range(len(M1)):
    # lignes
   for j in range(len(M1[0])):
       # colonnes
       for k in range(len(M2)):
           result[i][j] += M1[i][k] * M2[k][j]

print(time.perf_counter_ns()-now)

result = [ [ 0 for i in range(N) ] for j in range(N) ]
now=time.perf_counter_ns()
for j in range(len(M1)):
    # lignes
   for i in range(len(M1[0])):
       # colonnes
       for k in range(len(M2)):
           result[i][j] += M1[i][k] * M2[k][j]
print(time.perf_counter_ns()-now)
