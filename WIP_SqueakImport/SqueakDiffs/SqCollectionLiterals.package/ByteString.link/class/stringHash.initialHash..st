primitives
stringHash: aString initialHash: speciesHash
	"Answer the hash of a byte-indexed string, using speciesHash as the initial value.
	 See SmallInteger>>hashMultiply."
	
	| hash |
	hash := speciesHash bitAnd: 16rFFFFFFF.
	1 to: aString size do:
		[:pos |
		hash := (hash + (aString basicAt: pos)) hashMultiply].
	^hash
