*GemStoneGUI
withoutFirstLine

	| nextCr nextLf startOfNewLine |
	nextCr := self indexOf: Character cr startingAt: 1.
	nextCr = 0 ifTrue: [nextCr := self size].
	nextLf := self indexOf: Character lf startingAt: 1.
	nextLf = 0 ifTrue: [nextLf := self size].
	startOfNewLine := (nextCr min: nextLf) + 1.
	^ startOfNewLine > self size
		ifTrue: ['']
		ifFalse: [self copyFrom: startOfNewLine to: self size]