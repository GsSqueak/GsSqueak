private
beginningOfNextParagraph: position
	| s |
	s := self string.
	^ (s
		indexOf: Character cr
		startingAt: position
		ifAbsent: [ s size ]) + 1