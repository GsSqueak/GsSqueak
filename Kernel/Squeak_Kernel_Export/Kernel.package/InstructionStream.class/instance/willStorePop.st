testing
willStorePop
	"Answer whether the bytecode at pc is a store-pop."
	| method |
	method := self method.
	^method encoderClass isStorePopAt: pc in: method