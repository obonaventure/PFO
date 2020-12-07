

def plus1(x):
    y = x+1
    return y

def plus2a(x):
    y = x+2
    return y


def plus2b(x):
    y = plus1(x)
    z = plus1(y)
    return z


print(plus1(2))
print(plus2a(2))
print(plus2b(2))
