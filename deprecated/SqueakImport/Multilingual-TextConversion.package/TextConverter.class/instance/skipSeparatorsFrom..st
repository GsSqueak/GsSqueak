fileIn/Out
skipSeparatorsFrom: aStream

	| state character |
	[ 
		state := self saveStateOf: aStream.
		(character := aStream next) 
			ifNil: [ false ]
			ifNotNil: [ character isSeparator ] ] whileTrue.
	character ifNotNil: [ 
		self restoreStateOf: aStream with: state ]
	