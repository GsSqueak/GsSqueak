*SqCollectionLiterals-*SqCollectionLiterals-bit manipulation
clearBitAt: anInteger
	"Set the value corresponding to anInteger to 0. Return true if the value wasn't 0."

	| index value mask newValue |
	index := (anInteger bitShift: -3) + 1.
	value := bytes at: index.
	mask := 1 bitShift: (anInteger bitAnd: 7).
	(newValue := (value bitOr: mask) - mask) = value ifTrue: [ ^false ].
	bytes at: index put: newValue.
	tally := tally - 1.
	^true
