fileIn/Out
nextChunkTextFromStream: input
	"Deliver the next chunk as a Text.  Decode the following ]style[ chunk if present.  Position at start of next real chunk."
	
	| chunk position runs |
	chunk := self nextChunkFromStream: input.
	position := input position.
	((self skipSeparatorsAndPeekNextFrom: input) == $] and: [
		(input basicNext: 7) = ']style[' ])
			ifTrue: [
				runs := RunArray scanFrom: (self nextChunkFromStream: input) readStream ]
			ifFalse: [
				input position: position.
				runs := RunArray new: chunk size withAll: #() ].
	^Text string: chunk runs: runs