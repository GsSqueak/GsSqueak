instruction stream support
isStoreAt: pc in: method
	"Answer whether the bytecode at pc is a store or store-pop."

	| byte |
	byte := method at: pc.
	^(byte between: 96 and: 132) "96 103 storeAndPopReceiverVariableBytecode"
		and: [byte <= 111	"104 111 storeAndPopTemporaryVariableBytecode"
			or: [byte >= 129 "129 extendedStoreBytecode"
				and: [byte <= 130 "130 extendedStoreAndPopBytecode"
					or: [byte = 132 "132 doubleExtendedDoAnythingBytecode"
						and: [(method at: pc+1) >= 160]]]]]