converting
asMinimalRepresentation

	self size = 0
		ifTrue: [^nil].
	self size = 1
		ifTrue: [^self first].
	^self