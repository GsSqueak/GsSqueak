fileIn/Out
parseLangTagFor: aString fromStream: stream

	| state |
	state := self saveStateOf: stream.
	"Test for ]lang[ tag"
	(stream skipSeparatorsAndPeekNext == $] and: [
		(stream next: 6) = ']lang[' ]) ifTrue: [
			^stream
				decodeString: aString
				andRuns: (self nextChunkFromStream: stream) ].
	"no tag"
	self restoreStateOf: stream with: state.
	^aString
			