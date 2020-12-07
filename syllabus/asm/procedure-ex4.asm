   @compteur
   M=0
(LIGNE1)
   @1  // ligne 1
   D=A
   @a  
   M=D
   @LIGNE3  // sauvegarde de l'adresse de retour
   D=A
   @retour
   M=D	
   @COMPTE  // appel de la procédure
   0;JMP                  // adresse 11 
(LIGNE3)                  // adresse 12
   @2  // ligne 3
   D=A
   @a  
   M=D
   @LIGNE5  // sauvegarde de l'adresse de retour
   D=A
   @retour
   M=D	
   @COMPTE  // appel de la procédure
   0;JMP	          // adresse 21
(LIGNE5)                  // adresse 22
   @3    // ligne 5
   D=A
   @a  
   M=D                    // adresse 25
   @FIN
   0;JMP
(COMPTE) 
   @compteur  
   M=M+1
   @SUIVANT  // sauvegarde de l'adresse de retour
   D=A
   @retour
   M=D	
   @OPPOSE   // appel de la procédure
   0;JMP                      
(SUIVANT)                                   
   @retour                 // adresse 36
   A=M	
   0;JMP
(OPPOSE)
   @compteur               // adresse 39
   M=-M
   @retour
   A=M
   0;JMP
(FIN)
	
