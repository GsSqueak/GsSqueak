typing support
autoEncloseFor: typedChar 
	"Answer whether typeChar was handled by auto-enclosure.  Caller should call normalCharacter if not."
	| openers closers |
	openers := '([{'.
	closers := ')]}'.
	(closers includes: typedChar) ifTrue:
		[ | pos |
		self blinkPrevParen: typedChar.
		((pos := self indexOfNextNonwhitespaceCharacter) notNil and: [ (paragraph string at: pos) = typedChar ])
			ifTrue:
				[ self
					moveCursor: [ : position | position + pos - pointBlock stringIndex + 1 ]
					forward: true
					select: false.
				^ true ]
			ifFalse: [ ^ false ] ].
	(openers includes: typedChar) ifTrue:
		[ self
			openTypeIn;
			addString: typedChar asString;
			addString: (closers at: (openers indexOf: typedChar)) asString;
			insertAndCloseTypeIn;
			
			moveCursor: [ : position | position - 1 ]
			forward: false
			select: false.
		^ true ].
	^ false