instruction stream support
isBlockReturnAt: pc in: method 
	"Answer whether the bytecode at pc is a return from block."
	^ (method at: pc)
		= 125