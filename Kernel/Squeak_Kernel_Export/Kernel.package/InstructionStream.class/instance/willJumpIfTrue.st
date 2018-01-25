testing
willJumpIfTrue
	"Answer whether the next bytecode is a jump-if-true."
	| method |
	method := self method.
	^method encoderClass isBranchIfTrueAt: pc in: method