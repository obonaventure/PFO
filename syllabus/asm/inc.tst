// Script de test du programme de calcul d'incrémentation avec passage par référence
load inc.hack,         // le fichier contenant le programme en langage machine
output-file inc.out,   // le fichier de sortie
//compare-to inc.cmp,    // les résultats attendus
output-list RAM[16]%D2.6.2 RAM[17]%D2.6.2 RAM[0]%D2.6.2 ;
// l'argument, le résultat et le sommet de la pile

// premier test, inc(7)=8
set PC 0,      // démarrage du minuscule processeur
set RAM[16] 7; 
repeat 50 {  
  ticktock;
}
output; // Sauvegarde dans le fichier sortie


// premier test, inc(0)=1
set PC 0,      // démarrage du minuscule processeur
set RAM[16] 0; 
repeat 50 {  
  ticktock;
}
output; // Sauvegarde dans le fichier sortie


// premier test, inc(-5)=-4
set PC 0,      // démarrage du minuscule processeur
set RAM[16] -5; 
repeat 50 {  
  ticktock;
}
output; // Sauvegarde dans le fichier sortie
