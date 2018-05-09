private-encoding
readWord

	| strm |
	strm := WriteStream on: (String new: 20)
	dataStream skipSeparators.
	[dataStream atEnd] whileFalse: 
		[ | c |
		c := dataStream next.
		strm nextPut: c.
		c isSeparator ifTrue: [^ strm contents]].
	^ strm contents