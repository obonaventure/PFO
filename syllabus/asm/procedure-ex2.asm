(LIGNE1)
   @1  // ligne 1
   D=A
   @a  
   M=D
   @COMPTE // ligne 2
   0;JMP
(LIGNE3)
   @2  // ligne 3
   D=A
   @a  
   M=D
   // ligne 4
   @COMPTE
   0;JMP
(LIGNE5)
   @3    // ligne 5
   D=A
   @a  
   M=D
(COMPTE) 
   @compteur  
   M=M+1
   @retour	
   0;JMP
