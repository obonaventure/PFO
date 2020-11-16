// Script de test du programme de calcule de la valeur absolue
load abs.hack,         // le fichier contenant le programme en langage machine
output-file abs.out,   // le fichier de sortie
//compare-to abs.cmp,    // les résultats attendus
output-list RAM[16]%D2.6.2 RAM[17]%D2.6.2;  // les deux valeurs

// premier test, abs(0)=0
set PC 0,      // démarrage du minuscule processeur
set RAM[16] 0, // valeur d'entrée
set RAM[17] 0; // initialisation de la mémoire 
repeat 20 {    // vingt cycles d'horloge devraient suffire
  ticktock;
}
output; // Sauvegarde dans le fichier sortie

// deuxième test, abs(1)=1
set PC 0,      
set RAM[16] 1, 
set RAM[17] 1; 
repeat 20 {   
  ticktock;
}
output; 

// troisième test, abs(7)=7
set PC 0,      
set RAM[16] 7, 
set RAM[17] 7; 
repeat 20 {   
  ticktock;
}
output; 

// quatrième test, abs(-3)=3
set PC 0,      
set RAM[16] -3, 
set RAM[17] 3; 
repeat 20 {   
  ticktock;
}
output; 

// cinquième test, abs(-1)=1

set PC 0,      
set RAM[16] -1, 
set RAM[17] 1; 
repeat 20 {   
  ticktock;
}
output; 