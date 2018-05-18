utilities
emphasisStringFor: emphasisCode
	"Answer a translated string that represents the attributes given in emphasisCode."

	| emphases |
	emphasisCode = 0 ifTrue: [ ^'Normal' translated ].

	emphases := #('Bold' 'Italic' 'Underlined' 'Narrow' 'StruckOut').

	^String streamContents: [ :s |
		1 to: emphases size do: [ :i |
			(emphasisCode bitAt: i) isZero ifFalse: [ s nextPutAll: (emphases at: i) translated; space ] ].
		s position isZero ifFalse: [ s skip: -1 ] ]