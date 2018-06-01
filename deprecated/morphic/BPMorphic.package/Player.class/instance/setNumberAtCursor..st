slot getters/setters
setNumberAtCursor: aNumber 
	"Place the given number into the morph residing at my costume's
	current cursor position"
	| _gsSqueakTemp_renderedMorph _gsSqueakTemp_aCostume |
	_gsSqueakTemp_aCostume := self costume.
	((_gsSqueakTemp_renderedMorph := _gsSqueakTemp_aCostume renderedMorph) respondsTo: #valueAtCursor:)
		ifTrue: [^ _gsSqueakTemp_renderedMorph valueAtCursor setNumericValue: aNumber]