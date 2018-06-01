tokenizing
skipSeparators
	pos := text indexOfAnyOf: CharacterSet nonSeparators  startingAt: pos  ifAbsent: [ text size + 1 ].