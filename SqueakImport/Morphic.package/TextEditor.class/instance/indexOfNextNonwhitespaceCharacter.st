private
indexOfNextNonwhitespaceCharacter
	pointBlock stringIndex
		to: paragraph string size
		do:
			[ : n | | char | (char := paragraph string at: n) isSeparator ifFalse: [ ^ n ] ].
	^ nil