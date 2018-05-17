deserialization - new
deserializeNil: aStream

	self assert: (aStream next: 3) = 'nil'.
	^ nil