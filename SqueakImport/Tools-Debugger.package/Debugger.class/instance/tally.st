tally support
tally

	self codeTextMorph ifNotNil: [:o| o tallyIt] ifNil: [Beeper beep]
