instruction stream support
isJumpAt: pc in: method 
	"Answer whether the bytecode at pc is an (unconditional) jump."
	self subclassResponsibility