nonediting/nontyping keys
cursorEnd: aKeyboardEvent 
	"Private - Move cursor end of current line."
	| _gsSqueakTemp_string |
	self insertAndCloseTypeIn.
	_gsSqueakTemp_string := paragraph text string.
	self
		moveCursor: [:position | Preferences wordStyleCursorMovement
				ifTrue: [| targetLine |
					targetLine := paragraph lines
								at: (paragraph lineIndexOfCharacterIndex: position).
					targetLine = paragraph lastLine
						ifTrue: [targetLine last + 1]
						ifFalse: [targetLine last]]
				ifFalse: [_gsSqueakTemp_string
						indexOfAnyOf: CharacterSet crlf
						startingAt: position
						ifAbsent: [_gsSqueakTemp_string size + 1]]]
		forward: true
		event: aKeyboardEvent
		specialBlock: [:dummy | _gsSqueakTemp_string size + 1].
	^ true