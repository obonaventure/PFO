// Script de test du programme de calcul récursif de la somme des n premiers naturels
load sumn.hack,         // le fichier contenant le programme en langage machine
output-file sumn.out,   // le fichier de sortie
//compare-to sumn.cmp,    // les résultats attendus
output-list RAM[16]%D2.6.2 RAM[17]%D2.6.2 RAM[0]%D2.6.2 ;
// l'argument, le résultat et le sommet de la pile

// premier test, sumn(0)=0
set PC 0, 
set RAM[16] 0; 
repeat 100 {  
  ticktock;
}
output; 


// deuxième test, sumn(1)=1
set PC 0, 
set RAM[16] 1; 
repeat 100 {  
  ticktock;
}
output; 


// troisième test, sumn(3)=6
set PC 0,     
set RAM[16] 3; 
repeat 200 {  
  ticktock;
}
output;

// quatrième test, sumn(5)=15
set PC 0,     
set RAM[16] 5; 
repeat 200 {  
  ticktock;
}
output; 
