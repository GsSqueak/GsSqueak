testing
willReturnTopFromMethod
	"Answer whether the next bytecode is a return stack top from method."
	| method |
	method := self method.
	^method encoderClass isReturnTopFromMethodAt: pc in: method