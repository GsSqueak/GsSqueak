miscellaneous
oppositeModeTo: aMode
 	aMode == #readOnly ifTrue: [^ #writeOnly].
	aMode == #writeOnly ifTrue: [^ #readOnly].
	^ aMode