slot getters/setters
getCharacterAtCursor
	"Answer the value of the text cursor"
	| _gsSqueakTemp_aLoc _gsSqueakTemp_aTextMorph _gsSqueakTemp_aString |
	_gsSqueakTemp_aLoc := (_gsSqueakTemp_aTextMorph := self costume renderedMorph) cursor.
	_gsSqueakTemp_aString := _gsSqueakTemp_aTextMorph text string.
	^ (_gsSqueakTemp_aString
		at: _gsSqueakTemp_aLoc
		ifAbsent: ['\B7']) asString