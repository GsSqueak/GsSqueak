testing
willJump
	"Answer whether the next bytecode is an uncoinditional jump."
	| method |
	method := self method.
	^method encoderClass isJumpAt: pc in: method