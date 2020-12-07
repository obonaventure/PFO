    // exemple d'utilisation de la pile
    // celle-ci démarre à l'adresse 1000
    @1000
    D=A	
    @pile
    M=D
    // push (2)
    @2
    D=A	
    @pile
    M=M-1    
    @pile
    A=M 
    M=D
    // push (7)
    @7
    D=A	
    @pile
    M=M-1    
    @pile
    A=M 
    M=D
    // pop
    @pile
    A=M
    D=M		
    @pile
    M=M+1
    // push (9)
    @9
    D=A	
    @pile
    M=M-1    
    @pile
    A=M
    M=D
    // pop
    @pile
    A=M
    D=M		
    @pile
    M=M+1
    // pop
    @pile
    A=M
    D=M		
    @pile
    M=M+1	
