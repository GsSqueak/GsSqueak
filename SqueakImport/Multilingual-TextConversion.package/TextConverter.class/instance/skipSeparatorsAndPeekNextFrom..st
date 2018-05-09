fileIn/Out
skipSeparatorsAndPeekNextFrom: aStream
	"Same as #skipSeparators, but returns the next character after the separators if such exists."

	| state character |
	[ 
		state := self saveStateOf: aStream.
		(character := aStream next) 
			ifNil: [ false ]
			ifNotNil: [ character isSeparator ] ] whileTrue.
	character ifNotNil: [ 
		self restoreStateOf: aStream with: state.
		^character ].
	^aStream
	