     @16383    // initialisation pile
     D=A
     @SP
     M=D
     @SP       // libération de la place pour l'argument     
     M=M-1
     @7        // argument
     D=A
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
     @F2      // appel à la fonction   
     0;JMP
(RETOUR)
     // D contient le résultat de f2(7)
     @FIN
     0;JMP
(DEBUT)
// Implémentation simple en minuscule assembleur de la fonction f1
// def f1(x):
//     y=x+1
//    return(y)
(F1)
     @SP
     A=M+1   // adresse de l'argument x
     D=M+1   // calcul de y=x+1 et sauvegarde dans D
     @SP     // récupération de l'adresse de retour
     M=M+1   // et suppression de l'argument
     M=M+1   // et de l'adresse de retour de la pile
     A=M     // adresse du sommet de la pile après f1
     A=A-1   // adresse de l'argument de f1 sur la pile
     A=A-1   // adresse de l'adresse de retour sur la pile
     A=M     // chargement de l'adresse de retour dans A
     0;JMP   // retour au programme appelant
// # incrémente son argument de 2
// def f2(x):
//    y=f1(x)
//    z=f1(y)
//    return(z)
(F2)	
     @SP
     A=M+1   // adresse de l'argument x
     D=M     // argument pour l'appel
     @SP     // libération de la place pour l'argument     
     M=M-1
     A=M
     M=D     // argument placé sur la pile
     @SP     // libération de la place pour l'adresse de retour     
     M=M-1
     @RETOUR1 // adresse de retour
     D=A
     @SP
     A=M
     M=D
     @F1      // appel à la fonction   
     0;JMP
(RETOUR1)     // résultat dans D
     @SP     // libération de la place pour l'argument     
     M=M-1
     A=M
     M=D     // argument placé sur la pile
     @SP     // libération de la place pour l'adresse de retour     
     M=M-1
     @RETOUR2 // adresse de retour
     D=A
     @SP
     A=M
     M=D
     @F1      // deuxième appel à la fonction   
     0;JMP	      
(RETOUR2)     // résultat dans le registre D
     @SP     // récupération de l'adresse de retour
     M=M+1   // et suppression de l'argument
     M=M+1   // et de l'adresse de retour de la pile
     A=M     // adresse du sommet de la pile après f1
     A=A-1   // adresse de l'argument de f1 sur la pile
     A=A-1   // adresse de l'adresse de retour sur la pile
     A=M     // chargement de l'adresse de retour dans A
     0;JMP   // retour au programme appelant
(FIN)     
 
