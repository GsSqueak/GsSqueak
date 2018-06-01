selection
characterBlockAtPoint: aPoint 
	"Answer a CharacterBlock for the character in the text at aPoint."
	| _gsSqueakTemp_line |
	_gsSqueakTemp_line := lines
				at: (self lineIndexForPoint: aPoint).
	^ (CharacterBlockScanner new text: text textStyle: textStyle)
		characterBlockAtPoint: aPoint
		index: nil
		in: _gsSqueakTemp_line