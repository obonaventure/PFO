// Script de test du programme de calcul du minimum
load min.hack,         // le fichier contenant le programme en langage machine
output-file min.out,   // le fichier de sortie
//compare-to abs.cmp,    // les résultats attendus
output-list RAM[16]%D2.6.2 RAM[17]%D2.6.2 RAM[18]%D2.6.2 RAM[0]%D2.6.2 ;
// les deux arguments, le résultat et le sommet de la pile

// premier test, min(8,8)=8
set PC 0,     
set RAM[16] 8, // x
set RAM[17] 8; // y
repeat 100 {  
  ticktock;
}
output; // Sauvegarde dans le fichier sortie

// deuxième test, min(1,3)=1
set PC 0,      
set RAM[16] 1, 
set RAM[17] 3; 
repeat 100 {   
  ticktock;
}
output; 

// troisième test, min(7,3)=3
set PC 0,      
set RAM[16] 7, 
set RAM[17] 3; 
repeat 100 {   
  ticktock;
}
output;

// quatrième test, min(-6,3)=-6
set PC 0,      
set RAM[16] -6, 
set RAM[17] 3; 
repeat 100 {   
  ticktock;
}
output;

// cinquième test, min(2,-9)=-9
set PC 0,      
set RAM[16] 2, 
set RAM[17] -9; 
repeat 100 {   
  ticktock;
}
output;

// cinquième test, min(-12,-9)=-12
set PC 0,      
set RAM[16] -12, 
set RAM[17] -9; 
repeat 100 {   
  ticktock;
}
output;

// sixième test, min(-1,-9)=-9
set PC 0,      
set RAM[16] -1, 
set RAM[17] -9; 
repeat 100 {   
  ticktock;
}
output; 

