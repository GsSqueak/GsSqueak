conversion
encode

	| lineLength  |
	
	lineLength := 0.
	self stringStream nextPutAll: '<~'.
	[self dataStream atEnd] whileFalse: [
		| raw data out |
		lineLength >= 74 ifTrue: [self stringStream cr.  lineLength := 0].
		out := 5.
		raw := (self dataStream next: 4) asByteArray.
		raw size < 4 ifTrue:
			[out := raw size + 1.
			raw := raw, (self padOfSize: 4 - raw size)].
		data := raw unsignedLongAt: 1 bigEndian: true.
		data = 0
			ifTrue: [self stringStream nextPut: $z. lineLength := lineLength + 1]
			ifFalse: [self write85: data atMax: out. lineLength := lineLength + out]].
	self stringStream nextPutAll: '~>'.
	^ self stringStream
