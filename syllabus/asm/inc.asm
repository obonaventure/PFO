     @x       // variable
     @r       // résultat
     @16383    // initialisation pile
     D=A
     @SP
     M=D
     @SP       // libération de la place pour l'argument     
     M=M-1
     @x        // adresse de la variable passée en argument
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
     @INC      // appel à la fonction   
     0;JMP
(RETOUR)
     // D contient le résultat de inc(x)
     @r
     M=D
     @FIN
     0;JMP
// Implémentation simple en minuscule assembleur de la fonction inc qui
// incrémente la valeur stockée à l'adresse passée en argument
// exemple de passage par référence - bien spécifier quand c'est le cas
(INC)
     @SP
     A=M+1   // élément de la pile contenant l'argument
     D=M     // 
     A=D
     M=M+1   // incrémentation de la variable
     @SP
     A=M+1   // adresse contenant l'argument
     M=D     // mise à jour de la valeur de la variable passée en argument
     @SP     // récupération de l'adresse de retour
     M=M+1   // et suppression de l'argument
     M=M+1   // et de l'adresse de retour de la pile
     A=M     // adresse du sommet de la pile après inc
     A=A-1   // adresse de l'argument de inc sur la pile
     A=A-1   // adresse de l'adresse de retour sur la pile
     A=M     // chargement de l'adresse de retour dans A
     0;JMP   // retour au programme appelant
(FIN)     
