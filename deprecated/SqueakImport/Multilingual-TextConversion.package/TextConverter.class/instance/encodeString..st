conversion
encodeString: aString

	^String new: aString size streamContents: [ :stream | 
		self 
			nextPutAll: aString
			toStream: stream ]