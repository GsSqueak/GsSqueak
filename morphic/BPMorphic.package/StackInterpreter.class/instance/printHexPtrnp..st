debug printing
printHexPtrnp: p 
	"Print p in hex, unpadded, in the form '0x1234'"
	self
		printHexnp: (self oopForPointer: p)