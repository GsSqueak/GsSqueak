scripting access
insertCharacters: aString 
	"Insert the characters from the given source at my current cursor
	position "
	| _gsSqueakTemp_aLoc _gsSqueakTemp_aText _gsSqueakTemp_attributes |
	_gsSqueakTemp_aLoc := self cursor max: 1.
	_gsSqueakTemp_aText := _gsSqueakTemp_aLoc > text size
				ifTrue: [aString asText]
				ifFalse: [_gsSqueakTemp_attributes := (text attributesAt: _gsSqueakTemp_aLoc)
								select: [:attr | attr mayBeExtended].
					Text string: aString attributes: _gsSqueakTemp_attributes].
	paragraph
		replaceFrom: _gsSqueakTemp_aLoc
		to: _gsSqueakTemp_aLoc - 1
		with: _gsSqueakTemp_aText
		displaying: true.
	self updateFromParagraph