*System-Changes-fileIn/Out
copyMethodChunkFrom: aStream at: pos
	"Copy the next chunk from aStream (must be different from the receiver)."
	| chunk |
	aStream position: pos.
	chunk := aStream nextChunkText.
	chunk runs values size = 1 "Optimize for unembellished text"
		ifTrue: [self nextChunkPut: chunk asString]
		ifFalse: [self nextChunkPutWithStyle: chunk]