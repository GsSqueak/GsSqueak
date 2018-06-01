conversion
decode

	self readBOD ifFalse: [^ self dataStream].

	[self stringStream atEnd] whileFalse: [
		self stringStream skipSeparators.
		self readEOD ifTrue: [^ self endDecode]. "<--- End of data"

		self decodeChar: self stringStream next ifFail: [^ self dataStream]].
	"actually, should not reach, but our failure condition is returning the stream, anyway"		
	^ self dataStream