testing
willReturn
	"Answer whether the next bytecode is a return."
	| method |
	method := self method.
	^method encoderClass isReturnAt: pc in: method