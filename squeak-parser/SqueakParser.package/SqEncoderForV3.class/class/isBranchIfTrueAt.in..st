instruction stream support
isBranchIfTrueAt: pc in: method 
	"Answer whether the bytecode at pc is a conditional branch-if-true."
	^ (method at: pc)
		between: 168
		and: 171