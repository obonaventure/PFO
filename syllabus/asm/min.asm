     @x        // force l'assembleur à réserver l'adresse 16 pour x
     @y        // force l'assembleur à réserver l'adresse 17 pour y
     @z        // force l'assembleur à réserver l'adresse 18 pour z
     @16383    // initialisation pile
     D=A
     @SP
     M=D
     @SP       // libération de la place pour le second argument     
     M=M-1
     @y        // argument
     D=M
     @SP
     A=M
     M=D
     @SP       // libération de la place pour le premier argument     
     M=M-1
     @x        // argument
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
     @MIN      // appel à la fonction   
     0;JMP
(RETOUR)
     // D contient le résultat de min(x,y)
     @z
     M=D
     @FIN
     0;JMP
(DEBUT)
// Implémentation simple en minuscule assembleur de la fonction min
// def min(x,y):
//    if(x<y):
//        return(x)
//    return(y)	
(MIN)
     @SP
     A=M+1   // adresse de l'argument y
     D=M     // sauvegarde dans D
     @SP
     A=M+1
     A=A+1   // adresse de l'argument x
     D=D-M   // y-x
     @RETY
     D;JGT    
     @SP     // saut conditionnel a échoué, D doit contenir y
     A=M+1   // adresse de l'argument y
     D=M     // valeur de retour 
     @RET
     0;JMP
(RETY)
     @SP     // saut conditionnel a réuissi, D doit contenir x
     A=M+1   // adresse de l'argument y
     A=A+1   // adresse de l'argument x
     D=M     // valeur de retour 
     @RET
     0;JMP
(RET)
     @SP     // récupération de l'adresse de retour
     M=M+1   // et suppression du premier argument
     M=M+1   // et suppression du second argument
     M=M+1   // et de l'adresse de retour de la pile
     A=M     // adresse du sommet de la pile après min
     A=A-1   // adresse du premier argument sur la pile
     A=A-1   // adresse du deuxième argument sur la pile		
     A=A-1   // adresse de l'adresse de retour sur la pile
     A=M     // chargement de l'adresse de retour dans A
     0;JMP   // retour au programme appelant
(FIN)     
