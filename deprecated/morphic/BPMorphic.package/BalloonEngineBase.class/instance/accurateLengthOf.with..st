other
accurateLengthOf: deltaX with: deltaY 
	"Return the accurate length of the vector described by deltaX and
	deltaY "
	| _gsSqueakTemp_length2 |
	deltaX = 0
		ifTrue: [deltaY < 0
				ifTrue: [^ 0 - deltaY]
				ifFalse: [^ deltaY]].
	deltaY = 0
		ifTrue: [deltaX < 0
				ifTrue: [^ 0 - deltaX]
				ifFalse: [^ deltaX]].
	_gsSqueakTemp_length2 := deltaX * deltaX + (deltaY * deltaY).
	^ self computeSqrt: _gsSqueakTemp_length2