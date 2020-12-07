(DEBUT)
// Implémentation en assembleur de la fonction f1
// en réservant une zone de mémoire fixe pour ses variables locales
// def f1(x):
//     y=x+1
//    return(y)
// Implémentation simple en minuscule assembleur de la fonction f1
// def f1(x):
//     y=x+1
//    return(y)
(F1)
     @SP
     A=M+1   // adresse de l'argument x   
     D=M+1
     
     D=M+1   // calcul de y=x+1 et sauvegarde dans D
     @SP     // récupération de l'adresse de retour
     M=M+1   // et suppression de l'argument
     M=M+1   // et de l'adresse de retour de la pile
     A=M     // adresse du sommet de la pile après f1
     A=A-1   // adresse de l'argument de f1 sur la pile
     A=A-1   // adresse de l'adresse de retour sur la pile
     A=M     // chargement de l'adresse de retour dans A
     0;JMP   // retour au programme appelant
(FIN)     	
