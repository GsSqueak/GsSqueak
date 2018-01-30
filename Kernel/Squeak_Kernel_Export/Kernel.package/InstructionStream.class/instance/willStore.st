testing
willStore
	"Answer whether the bytecode at pc is a store or store-pop."
	| method |
	method := self method.
	^method encoderClass isStoreAt: pc in: method