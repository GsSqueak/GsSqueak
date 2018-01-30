testing
willJustPop
	"Answer whether the bytecode at pc is a pop."
	| method |
	method := self method.
	^method encoderClass isJustPopAt: pc in: method