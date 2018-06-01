array primitive support
commonVariable: rcvr at: index cacheIndex: atIx 
	"This code assumes the receiver has been identified at location atIx in the atCache."
	| stSize fmt fixedFields result |

	stSize := atCache at: atIx+AtCacheSize.
	((objectMemory oop: index isGreaterThanOrEqualTo: 1)
		and: [objectMemory oop: index isLessThanOrEqualTo: stSize])
	ifTrue:
		[fmt := atCache at: atIx+AtCacheFmt.
		fmt <= 4 ifTrue:
			[fixedFields := atCache at: atIx+AtCacheFixedFields.
			^ objectMemory fetchPointer: index + fixedFields - 1 ofObject: rcvr].
		fmt < 8 ifTrue:  "Bitmap"
			[result := objectMemory fetchLong32: index - 1 ofObject: rcvr.
			result := objectMemory positive32BitIntegerFor: result.
			^ result].
		fmt >= 16  "Note fmt >= 16 is an artificial flag for strings"
			ifTrue: "String"
			[^ self characterForAscii: (objectMemory fetchByte: index - 1 ofObject: rcvr)]
			ifFalse: "ByteArray"
			[^ objectMemory integerObjectOf: (objectMemory fetchByte: index - 1 ofObject: rcvr)]].

	self primitiveFail