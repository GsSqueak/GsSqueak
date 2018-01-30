testing
willReallyStore
	"Answer whether the bytecode at pc is a store or store-pop into an explicit variable.
	 This eliminates stores into indirect temp vectors, which implement mutable closed-over
	 variables in the the closure implementation, and hence stores into temp vectors are not real stores."
	| method |
	method := self method.
	^method encoderClass isNonSyntheticStoreAt: pc in: method for: self