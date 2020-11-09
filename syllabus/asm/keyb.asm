	@c
	M=0
(LOOP)
	@24576 // keyboard 
	D=M
	@LOOP
	D;JEQ
	@c
	M=M+1
	@LOOP
	0;JMP
