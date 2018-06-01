typing support
autoEncloseFor: typedChar 
	"Answer whether typeChar was handled by auto-enclosure. Caller
	should call normalCharacter if not."
	| _gsSqueakTemp_openers _gsSqueakTemp_closers |
	_gsSqueakTemp_openers := '([{'.
	_gsSqueakTemp_closers := ')]}'.
	(_gsSqueakTemp_closers includes: typedChar)
		ifTrue: [| pos |
			self blinkPrevParen: typedChar.
			((pos := self indexOfNextNonwhitespaceCharacter) notNil
					and: [(paragraph string at: pos)
							= typedChar])
				ifTrue: [self
						moveCursor: [:position | position + pos - pointBlock stringIndex + 1]
						forward: true
						select: false.
					^ true]
				ifFalse: [^ false]].
	(_gsSqueakTemp_openers includes: typedChar)
		ifTrue: [self openTypeIn; addString: typedChar asString; addString: (_gsSqueakTemp_closers
					at: (_gsSqueakTemp_openers indexOf: typedChar)) asString; insertAndCloseTypeIn;
				moveCursor: [:position | position - 1]
				forward: false
				select: false.
			^ true].
	^ false