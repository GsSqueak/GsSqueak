parenblinking
blinkPrevParen: aCharacter
	"Same as super, but tries to follow the Smalltalk syntax."

	| openDelimiter closeDelimiter level string here inside |
	string := paragraph text string.
	here := pointBlock stringIndex.
	openDelimiter := aCharacter.
	closeDelimiter := '([{' at: (')]}' indexOf: openDelimiter).
	level := 1.
	inside := nil. "Tricky."
	(here > 1 and: [ (string at: here - 1) = $$ ]) ifTrue: [ ^self ]. "Just a character literal."
	[ level > 0 and: [ here > 1 ] ] whileTrue: [
		| hereChar |
		hereChar := string at: (here := here - 1).
		inside "Are we inside a comment or string literal?"
			ifNotNil: [ "Yes."
				hereChar = inside ifTrue: [
					(here > 1 and: [ (string at: here - 1) ~= inside ])
						ifTrue: [ inside := nil ]
						ifFalse: [ here := here - 1 ] ] ]
			ifNil: [
				(here > 1 and: [ (string at: here - 1) = $$ ]) "Just a character literal."
					ifTrue: [ here := here - 1 ]
					ifFalse: [
						hereChar
							caseOf: {
								[ closeDelimiter ] -> [
									(level := level - 1) = 0 ifTrue: [
										^self blinkParenAt: here ] ].
								[ openDelimiter ] -> [  level := level + 1 ].
								[ $" ] -> [ inside := $" ].
								[ $' ] -> [ inside := $' ] }
							otherwise: [] ] ] ]