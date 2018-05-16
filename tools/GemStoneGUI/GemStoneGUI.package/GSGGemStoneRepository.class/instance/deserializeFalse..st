deserialization - new
deserializeFalse: aStream

	self assert: (aStream next: 5) = 'false'.
	^ false