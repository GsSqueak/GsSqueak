instruction stream support
isBranchIfFalseAt: pc in: method 
	"Answer whether the bytecode at pc is a conditional branch-if-false."
	| bytecode |
	bytecode := method at: pc.
	^ (bytecode between: 152 and: 159)
		or: [bytecode between: 172 and: 175]