instruction stream support
isBlockReturnAt: pc in: method 
	"Answer whether the bytecode at pc is a return from block."
	self subclassResponsibility