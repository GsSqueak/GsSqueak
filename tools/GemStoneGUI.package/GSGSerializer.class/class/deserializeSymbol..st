deserialization
deserializeSymbol: aStream

	| symbol originalPosition |
	originalPosition := aStream position.
	symbol := Symbol readFrom: aStream.
	aStream position: originalPosition.
	self assert: aStream next = $#.
	aStream next = $'
		ifTrue: [aStream next: symbol size + 1]
		ifFalse: [aStream next: symbol size - 1].
	^ symbol