selection
characterBlockForIndex: index 
	"Answer a CharacterBlock for the character in text at index."
	| _gsSqueakTemp_line |
	_gsSqueakTemp_line := lines
				at: (self lineIndexOfCharacterIndex: index).
	^ (CharacterBlockScanner new text: text textStyle: textStyle)
		characterBlockAtPoint: nil
		index: ((index max: _gsSqueakTemp_line first)
				min: text size + 1)
		in: _gsSqueakTemp_line