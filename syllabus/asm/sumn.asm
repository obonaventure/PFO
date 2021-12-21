     @x       // variable
     @r       // résultat
     @16383    // initialisation pile
     D=A
     @SP
     M=D
     @SP       // libération de la place pour l'argument     
     M=M-1
     @x        // adresse de la variable passée en argument
     D=M
     @SP
     A=M
     M=D
     @SP       // libération de la place pour l'adresse de retour     
     M=M-1
     @RETOUR   // adresse de retour
     D=A
     @SP
     A=M
     M=D
     @SUMN      // appel à la fonction   
     0;JMP
(RETOUR)
     // D contient le résultat de SUMN(x)
     @r
     M=D
     @FIN
     0;JMP
// Implémentation simple en minuscule assembleur de la fonction récursive
// sumn qui retourne la somme des n premiers naturels
(SUMN)
     @SP
     A=M+1   // élément de la pile contenant l'argument
     D=M     //
     @RECURSION
     D;JNE
             // argument == 0, D contient déjà 0
     @FINSUMN
     0;JMP
(RECURSION)
             // D contient l'argument, calculer n-1 puis appeler sumn
     D=D-1
     @SP       // libération de la place pour l'argument     
     M=M-1
     @SP
     A=M
     M=D
     @SP       // libération de la place pour l'adresse de retour     
     M=M-1
     @RETSUMN   // adresse de retour
     D=A
     @SP
     A=M
     M=D
     @SUMN      // appel à la fonction
     0;JMP
(RETSUMN)     
                // retour de sumn(n-1), reste à récupérer n et n+D
     @SP
     A=M+1      // élément de la pile contenant l'argument
     D=D+M      // calcul de la valeur de retour
(FINSUMN)
             // libération de la pile et retour
     @SP     // récupération de l'adresse de retour
     M=M+1   // et suppression de l'adresse de retour de la pile
     M=M+1   // et de l'argument
     A=M     // adresse du sommet de la pile après SUMN 
     A=A-1   // adresse de l'argument de SUMN sur la pile
     A=A-1   // adresse de l'adresse de retour sur la pile
     A=M     // chargement de l'adresse de retour dans A
     0;JMP   // retour au programme appelant	     			  	
(FIN)     
