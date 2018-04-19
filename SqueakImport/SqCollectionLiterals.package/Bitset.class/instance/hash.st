*SqCollectionLiterals-*SqCollectionLiterals-comparing
hash
	"#hash is implemented, because #= is implemented."

	^(self species hash bitXor: tally hashMultiply) bitXor: bytes hash
