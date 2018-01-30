testing
willBlockReturn
	"Answer whether the next bytecode is a return."
	| method |
	method := self method.
	^method encoderClass isBlockReturnAt: pc in: method