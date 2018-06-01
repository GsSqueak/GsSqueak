miscellaneous
oppositeSideTo: aSide 
	aSide == #left
		ifTrue: [^ #right].
	aSide == #right
		ifTrue: [^ #left].
	aSide == #top
		ifTrue: [^ #bottom].
	^ #top