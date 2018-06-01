instruction stream support
isBranchIfTrueAt: pc in: method 
	"Answer whether the bytecode at pc is a conditional branch-if-true."
	self subclassResponsibility