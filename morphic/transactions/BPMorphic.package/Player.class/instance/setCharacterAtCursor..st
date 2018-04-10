slot getters/setters
setCharacterAtCursor: aCharOrString 
	"Insert the given character at my cursor position"
	| _gsSqueakTemp_aLoc _gsSqueakTemp_aTextMorph _gsSqueakTemp_aString _gsSqueakTemp_charToUse |
	_gsSqueakTemp_aLoc := (_gsSqueakTemp_aTextMorph := self costume renderedMorph) cursor.
	_gsSqueakTemp_charToUse := (_gsSqueakTemp_aString := aCharOrString asString) size > 0
				ifTrue: [_gsSqueakTemp_aString first]
				ifFalse: ['\B7'].
	_gsSqueakTemp_aTextMorph paragraph
		replaceFrom: _gsSqueakTemp_aLoc
		to: _gsSqueakTemp_aLoc
		with: _gsSqueakTemp_charToUse asString asText
		displaying: true.
	_gsSqueakTemp_aTextMorph updateFromParagraph