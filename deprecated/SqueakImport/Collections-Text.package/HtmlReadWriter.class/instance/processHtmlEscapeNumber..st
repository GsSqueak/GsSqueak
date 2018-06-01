private
processHtmlEscapeNumber: aString
	| number |
	number := aString first = $x
		ifTrue: [ '16r', aString allButFirst ]
		ifFalse: [ aString ].
	self addCharacter: number asNumber asCharacter.
	