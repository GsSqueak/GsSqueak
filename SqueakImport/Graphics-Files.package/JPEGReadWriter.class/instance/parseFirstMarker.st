marker parsing
parseFirstMarker

	| marker |
	self next = 16rFF ifFalse: [self error: 'JFIF marker expected'].
	marker := self next.
	marker = 16rD9
		ifTrue: [^self "halt: 'EOI encountered.'"].
	marker = 16rD8 ifFalse: [self error: 'SOI marker expected'].
	self parseStartOfInput.
