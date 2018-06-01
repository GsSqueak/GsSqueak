private
beginningOfParagraph: position
	^ (self string
		lastIndexOf: Character cr
		startingAt: position) + 1.