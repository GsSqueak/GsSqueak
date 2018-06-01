bytecode decoding
pcOfBlockCreationBytecodeForBlockStartingAt: startpc in: method 
	"Answer the pc of the push closure bytecode whose block starts at
	startpc in method.
	143 10001111 llllkkkk jjjjjjjj iiiiiiii	Push Closure Num Copied llll Num
	Args kkkk BlockSize jjjjjjjjiiiiiiii"
	^ startpc - 4