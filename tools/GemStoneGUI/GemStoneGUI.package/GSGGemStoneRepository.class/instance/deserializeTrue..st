deserialization - new
deserializeTrue: aStream

	self assert: (aStream next: 4) = 'true'.
	^ true