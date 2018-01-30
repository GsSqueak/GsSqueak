testing
willJumpIfFalse
	"Answer whether the next bytecode is a jump-if-false."
	| method |
	method := self method.
	^method encoderClass isBranchIfFalseAt: pc in: method