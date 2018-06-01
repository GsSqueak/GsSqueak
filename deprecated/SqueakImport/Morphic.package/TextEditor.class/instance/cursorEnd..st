nonediting/nontyping keys
cursorEnd: aKeyboardEvent 

	"Private - Move cursor end of current line."
	| string |
	self insertAndCloseTypeIn.
	string := paragraph text string.
	self
		moveCursor:
			[:position | Preferences wordStyleCursorMovement
				ifTrue:[| targetLine |
					targetLine := paragraph lines at:(paragraph lineIndexOfCharacterIndex: position).
					targetLine = paragraph lastLine
						ifTrue:[targetLine last + 1]
						ifFalse:[targetLine last]]
				ifFalse:[
					string
						indexOfAnyOf: CharacterSet crlf
						startingAt: position
						ifAbsent:[string size + 1]]]
		forward: true
		event: aKeyboardEvent
		specialBlock:[:dummy | string size + 1].
	^true