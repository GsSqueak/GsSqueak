primitives
indexOfAscii: anInteger inString: aString startingAt: start

	| stringSize |
	stringSize := aString size.
	start to: stringSize do: [:pos |
		(aString basicAt: pos) = anInteger ifTrue: [^ pos]].

	^ 0
