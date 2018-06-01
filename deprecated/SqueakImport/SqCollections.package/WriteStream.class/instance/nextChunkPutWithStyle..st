fileIn/Out
nextChunkPutWithStyle: aStringOrText
	"Append the argument, aText, to the receiver, doubling embedded terminators.  Put out one chunk for the string and one for the style runs.  Mark the style with ]style[."

	aStringOrText isString ifTrue: [^ self nextChunkPut: aStringOrText].
	aStringOrText runs coalesce.
	aStringOrText unembellished ifTrue: [^ self nextChunkPut: aStringOrText asString].

	self nextChunkPut: aStringOrText asString.
	self cr; nextPutAll: ']style['.
	self nextChunkPut: 
		(String streamContents: [:strm | 
			aStringOrText runs writeScanOn: strm]).
