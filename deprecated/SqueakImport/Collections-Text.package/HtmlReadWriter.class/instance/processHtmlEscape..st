reading
processHtmlEscape: aString
	| escapeSequence |
	escapeSequence := aString copyFrom: 2 to: aString size - 1.
	escapeSequence first = $# ifTrue: [^ self processHtmlEscapeNumber: escapeSequence allButFirst].
	(String htmlEntities at: (aString copyFrom: 2 to: aString size - 1) ifAbsent: [])
		ifNotNil: [:char | 
			self addCharacter: char].