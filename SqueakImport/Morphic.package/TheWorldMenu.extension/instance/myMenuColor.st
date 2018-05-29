*Morphic-MorphicExtras-construction
myMenuColor

	| c |
	c := myWorld color.
	c isColor ifTrue: [^c atLeastAsLuminentAs: 0.2].
	^Color white