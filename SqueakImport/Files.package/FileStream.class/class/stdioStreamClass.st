stdio
stdioStreamClass

	^self encodeAndDecodeStdioFiles
		ifTrue: [ MultiByteFileStream ]
		ifFalse: [ StandardFileStream ]