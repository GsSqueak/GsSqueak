instruction stream support
isNonSyntheticStoreAt: pc in: method for: anInstructionStream 
	"Answer whether the bytecode at pc is a store or store-pop into an
	explicit variable.
	This eliminates stores into indirect temp vectors, which implement
	mutable closed-over
	variables in the the closure implementation, and hence stores into
	temp vectors are not real stores."
	^ (self isStoreAt: pc in: method)
		and: [(self
				isSyntheticStoreAt: pc
				in: method
				for: anInstructionStream) not]