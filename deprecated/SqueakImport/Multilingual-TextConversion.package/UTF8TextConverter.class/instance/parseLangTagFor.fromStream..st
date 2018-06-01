fileIn/Out
parseLangTagFor: aString fromStream: stream

	| position |
	position := stream position.
	"Test for ]lang[ tag"
	((self skipSeparatorsAndPeekNextFrom: stream) == $] and: [
		(stream basicNext: 6) = ']lang[' ]) ifTrue: [
			^stream
				decodeString: aString
				andRuns: (self nextChunkFromStream: stream) ].
	"no tag"
	stream position: position.
	^aString