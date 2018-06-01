nonediting/nontyping keys
cursorHome: aKeyboardEvent 
	"Private - Move cursor from position in current line to beginning of
	current line. If control key is pressed put cursor at beginning of text"
	| _gsSqueakTemp_string |
	_gsSqueakTemp_string := paragraph text string.
	self
		moveCursor: [:position | Preferences wordStyleCursorMovement
				ifTrue: [(paragraph lines
						at: (paragraph lineIndexOfCharacterIndex: position)) first]
				ifFalse: [(_gsSqueakTemp_string lastIndexOfAnyOf: CharacterSet crlf startingAt: position - 1)
						+ 1]]
		forward: false
		event: aKeyboardEvent
		specialBlock: [:dummy | 1].
	^ true