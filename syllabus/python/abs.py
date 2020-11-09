
from goto import goto, label


def abs1(x):

    if(x>0):
      y=x
    else:
      y=-x

    print(y)  
    return(y)   

def abs2(x):

    if(x>0):
      y=x
      goto .suite
    y=-x  
    label .suite
    print(y)  
    return(y)
  


print(abs1(-42))
print(abs1(42))

print(abs(-44))
print(abs2(44))
