    (DEBUT)
	@22
	D=A
	@a
	M=D
	@3
	D=A
	@b
	M=D	
	@15
	D=A
	@c
	M=D
(START)
	@7
	D=A
        @x
        M=D
   (DBOUCLE)
	@a
	D=M
	@x
	D=M-D
	@FBOUCLE
	D;JGE     // while(x<a)
	@x		
	D=M
	@c
	D=D-M     
	@SUITE
	0;JGE     // if (x<c)
	@x
	M=M+1     // x=x+1
	@DBOUCLE
	D;JMP
   (SUITE)	
	@b
	D=M
	@x
	M=D+M     // x=x+b
	@DBOUCLE  
	0;JMP
   (FBOUCLE)
