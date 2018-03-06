instruction stream support
isSyntheticStoreAt: pc in: method for: anInstructionStream 
	"Answer whether the bytecode at pc is a store or store-pop of an
	indirect temp vector,
	which implement mutable closed-over variables in the the closure
	implementation. Stores into temp vectors are not real stores."
	self subclassResponsibility