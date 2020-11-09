
	// INIT
	@12
	D=A
	@19
	M=D
	@31
	D=A
	@20
	M=D
	@22
	M=D
	@24
	M=D
	@26
	M=D
	@27
	M=D
	@29
	M=D
	@31
	M=D
	@28
	D=A
	@21
	M=D
	@30
	D=A
	@23
	M=D
	@25
	M=D
	@28
	M=D
	@30
	M=D
(DEBUT)
	@16   // somme
	M=0
	@17   // i variable boucle
	M=0
(BOUCLE)
	@19   // début tableau
	D=A+1 // on veut le premier élément, pas la taille
	@17
	A=M+D
	D=M   // charge i ème élément du tableau
	@16
	M=D+M
	@17
	M=M+1
	@19
	D=M   // taille du tableau
	@17
	D=D-M
	@BOUCLE
	D;JGT

