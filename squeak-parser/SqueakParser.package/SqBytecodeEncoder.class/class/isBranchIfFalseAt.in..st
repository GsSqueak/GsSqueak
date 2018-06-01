instruction stream support
isBranchIfFalseAt: pc in: method 
	"Answer whether the bytecode at pc is a conditional branch-if-false."
	self subclassResponsibility