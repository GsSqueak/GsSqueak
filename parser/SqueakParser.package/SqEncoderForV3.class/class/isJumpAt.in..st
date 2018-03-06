instruction stream support
isJumpAt: pc in: method 
	"Answer whether the bytecode at pc is an (unconditional) jump."
	| bytecode |
	bytecode := method at: pc.
	^ (bytecode between: 144 and: 151)
		or: [bytecode between: 160 and: 167]