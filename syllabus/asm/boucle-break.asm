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
	@9
	D=A
        @x
        M=D
   (DBOUCLE)
	@a
	D=M
	@x
	D=M-D
	@FBOUCLE
	D;JGE      // while(x<a)
	@b
	D=M
	@x
	M=D+M
	@x	   // x=x+b	
	D=M
	@c
	D=D-M
	@FINIF
	D;JLE      // if(x>c)
	@c
	D=M     
	@x
	M=D        // x=c  
	@FBOUCLE   
	0;JMP      // break
   (FINIF)	
	@DBOUCLE  
	0;JMP
   (FBOUCLE)
