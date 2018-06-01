fileIn/Out
nextChunkFromStream: input
	"Answer the contents of input, up to the next terminator character. Doubled terminators indicate an embedded terminator character."
	
	input skipSeparators.
	^self
		parseLangTagFor: (
			String new: 1000 streamContents: [ :output |
				| character state |
				[ 
					(character := self nextFromStream: input) == nil or: [ 
						character == $! and: [ 
							state := self saveStateOf: input.
							(self nextFromStream: input) ~~ $! ] ] ] 
					whileFalse: [ output nextPut: character ].
				character ifNotNil: [ 
					self restoreStateOf: input with: state ] ])
		fromStream: input