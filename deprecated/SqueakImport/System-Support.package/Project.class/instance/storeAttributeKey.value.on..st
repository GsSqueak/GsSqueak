file in/out
storeAttributeKey: key value: value on: aStream

	(key includes: $:) ifTrue: [self error: 'key should not contain :'].
	aStream nextPutAll: key.
	aStream nextPutAll: ': '.
	aStream nextPutAll: value.
	aStream cr.
