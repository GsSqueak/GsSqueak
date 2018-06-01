instruction stream support
isJustPopAt: pc in: method 
	"Answer whether the bytecode at pc is a pop."
	self subclassResponsibility