   @16383 // sommet choisi pour notre pile
   D=A
   @SP    // 0 par convention dans le livre
   M=D	
   @compteur
   M=0
(LIGNE1)
   @1  // ligne 1
   D=A
   @a  
   M=D
   @SP
   M=M-1    // libération d'une place au sommet de la pile 	
   @LIGNE3  // sauvegarde de l'adresse de retour
   D=A
   @SP
   A=M 	
   M=D
   @COMPTE  // appel de la procédure
   0;JMP                  // adresse 18 
(LIGNE3)                  // adresse 19
   @2  // ligne 3
   D=A
   @a  
   M=D
   @SP
   M=M-1    // libération d'une place au sommet de la pile 	
   @LIGNE5  // sauvegarde de l'adresse de retour
   D=A
   @SP
   A=M 	
   M=D	
   @COMPTE  // appel de la procédure
   0;JMP	          // adresse 31
(LIGNE5)                  // adresse 32
   @3    // ligne 5
   D=A
   @a  
   M=D                    // adresse 35
   @FIN
   0;JMP
(COMPTE) 
   @compteur  
   M=M+1
   @SP
   M=M-1    // libération d'une place au sommet de la pile 	
   @SUIVANT  // sauvegarde de l'adresse de retour
   D=A
   @SP
   A=M 	
   M=D		
   @OPPOSE   // appel de la procédure
   0;JMP                      
(SUIVANT)                                   
   @SP                 // adresse 48
   A=M
   D=M	
   @SP
   M=M+1
   A=D	
   0;JMP
(OPPOSE)
   @compteur           // adresse 56
   M=-M
   @SP                 // adresse 58
   A=M
   D=M	
   @SP
   M=M+1
   A=D	
   0;JMP	
(FIN)
	
