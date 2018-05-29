positioning
positionObject: anObject
        "anObject could be myself or my referent"

	| pum clearArea |
	pum := self pasteUpMorph ifNil: [^ self].

	clearArea := Morph newBounds: pum clearArea.
	^self 
		positionObject: anObject 
		atEdgeOf: clearArea