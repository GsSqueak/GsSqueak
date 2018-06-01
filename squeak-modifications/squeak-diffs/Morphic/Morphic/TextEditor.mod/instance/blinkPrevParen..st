parenblinking
blinkPrevParen: aCharacter
	"Used if not Shout"
	| openDelimiter closeDelimiter level string here hereChar |
	string := paragraph string.
	here := pointBlock stringIndex.
	openDelimiter := aCharacter.
	closeDelimiter := '([{' at: (')]}' indexOf: openDelimiter).
	level := 1.
	[level > 0 and: [here > 1]]
		whileTrue:
			[hereChar := string at: (here := here - 1).
			hereChar = closeDelimiter
				ifTrue:
					[level := level - 1.
					level = 0
						ifTrue: [^ self blinkParenAt: here]]
				ifFalse:
					[hereChar = openDelimiter
						ifTrue: [level := level + 1]]]