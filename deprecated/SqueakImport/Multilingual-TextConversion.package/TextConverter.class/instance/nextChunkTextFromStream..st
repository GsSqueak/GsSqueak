fileIn/Out
nextChunkTextFromStream: input
	"Deliver the next chunk as a Text.  Decode the following ]style[ chunk if present.  Position at start of next real chunk."
	
	| chunk state runs |
	chunk := self nextChunkFromStream: input.
	state := self saveStateOf: input.
	(input skipSeparatorsAndPeekNext == $] and: [
		(input next: 7) = ']style[' ])
			ifTrue: [
				runs := RunArray scanFrom: (self nextChunkFromStream: input) readStream ]
			ifFalse: [
				self restoreStateOf: input with: state.
				runs := RunArray new: chunk size withAll: #() ].
	^Text string: chunk runs: runs