accessing
size
	"Extract this closure's bytecode size (number of bytes) by accessing
	 the closure creation bytecode in the enclosing method."
	
	^self blockCreationBytecodeMessage arguments last