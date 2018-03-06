instruction stream support
isJustPopAt: pc in: method 
	"Answer whether the bytecode at pc is a pop."
	^ (method at: pc)
		= 135"135 10000111 Pop Stack Top"