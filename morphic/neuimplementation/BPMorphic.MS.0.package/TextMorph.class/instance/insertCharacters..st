scripting access
insertCharacters: aSource 
	"Insert the characters from the given source at my current cursor
	position "
	| _gsSqueakTemp_aLoc |
	_gsSqueakTemp_aLoc := self cursor max: 1.
	paragraph
		replaceFrom: _gsSqueakTemp_aLoc
		to: _gsSqueakTemp_aLoc - 1
		with: aSource asText
		displaying: true.
	self updateFromParagraph