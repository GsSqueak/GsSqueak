accessing
skipTo: anObject
	"fast version using indexOf:"

	(position := collection indexOf: anObject startingAt: position + 1) = 0 ifTrue: [
		"not present. consume all characters"
		position := readLimit.
		^false ].
	^true