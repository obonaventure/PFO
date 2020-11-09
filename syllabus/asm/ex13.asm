   // valeur absolue
      @x    // variable, adresse choisie par l'assembleur    
      D=M
      @SUITE // adresse calculée par l'assembleur
      D;JLE
      @y    // variable, adresse choisie par l'assembleur    
      M=D
      @SUITE
      0;JMP
      @y
      M=-D
   (SUITE)
   //  ...		
