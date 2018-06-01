fileIn/Out
nextChunkFromStream: input
	"Answer the contents of input, up to the next terminator character. Doubled terminators indicate an embedded terminator character."
	
	self skipSeparatorsFrom: input.
	^self 
		parseLangTagFor: (
			self decodeString: (
				String new: 1000 streamContents: [ :stream |
					[
						stream nextPutAll: (input basicUpTo: $!).
						input basicNext == $! ]
							whileTrue: [ 
								stream nextPut: $! ].
					input atEnd ifFalse: [ input skip: -1 ] ]))
		fromStream: input