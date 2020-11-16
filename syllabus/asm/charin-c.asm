(INIT)
     @72  // H
     D=A
     @30
     M=D
     @101 // e
     D=A
     @31
     M=D
     @108 // l
     D=A
     @32
     M=D
     @108 // l
     D=A
     @33
     M=D
     @111 // o
     D=A
     @34
     M=D
     @33  // !
     D=A
     @35
     M=D
(DEBUT)   // string démarre à l'adresse 30
     @104 // caractère à tester
     D=A 
     @c 
     M=D 
     @i 
     M=0
     @r 
     M=0	
(BOUCLE)
     @30 // string
     D=A  
     @i
     A=M+D  // adresse de str[i]
     D=M
     @FIN
     D;JEQ	
     @c
     D=M-D  // str[i] - c
     @TROUVE
     D;JEQ
     @i
     M=M+1	
     @BOUCLE
     0;JMP
(TROUVE)
     @r
     M=1	
(FIN)	
