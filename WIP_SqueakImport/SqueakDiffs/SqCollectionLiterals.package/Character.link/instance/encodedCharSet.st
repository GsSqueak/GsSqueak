accessing
encodedCharSet
	
	self asInteger < 16r400000 ifTrue: [ ^Unicode ]. "Shortcut"
	^EncodedCharSet charsetAt: self leadingChar
