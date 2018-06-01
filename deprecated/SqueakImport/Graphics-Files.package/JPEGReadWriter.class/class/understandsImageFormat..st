image reading/writing
understandsImageFormat: aStream
	(JPEGReadWriter2 understandsImageFormat: aStream) ifTrue:[^false].
	aStream reset; binary.
	aStream next = 16rFF ifFalse: [^ false].
	aStream next = 16rD8 ifFalse: [^ false].
	^true