instruction stream support
isStorePopAt: pc in: method 
	"Answer whether the bytecode at pc is a store-pop."
	| byte |
	byte := method at: pc.
	^ (byte between: 96 and: 111)
		or: ["96 103	storeAndPopReceiverVariableBytecode"
			"104 111	storeAndPopTemporaryVariableBytecode"
			byte = 130
			"130		extendedStoreAndPopBytecode"]