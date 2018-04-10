scripting access
insertContentsOf: aPlayer 
	"Insert the characters from the given player at my current cursor
	position "
	| _gsSqueakTemp_aLoc |
	_gsSqueakTemp_aLoc := self cursor.
	paragraph
		replaceFrom: _gsSqueakTemp_aLoc
		to: _gsSqueakTemp_aLoc - 1
		with: aPlayer getStringContents
		displaying: true.
	self updateFromParagraph