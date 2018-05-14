bit manipulation
setBitAt: anInteger
	"Set the value corresponding to anInteger to 1. Return true if the value wasn't 1."

	| index value newValue |
	index := (anInteger bitShift: -3) + 1.
	value := bytes at: index.
	(newValue := (1 bitShift: (anInteger bitAnd: 7)) bitOr: value) = value ifTrue: [ ^false ].
	bytes at: index put: newValue.
	tally := tally + 1.
	^true