slot getters/setters
getNumberAtCursor
	"Answer the number borne by the object at my costume's current
	cursor position"
	| _gsSqueakTemp_renderedMorph _gsSqueakTemp_aCostume |
	_gsSqueakTemp_aCostume := self costume.
	((_gsSqueakTemp_renderedMorph := _gsSqueakTemp_aCostume renderedMorph) respondsTo: #valueAtCursor:)
		ifTrue: [^ _gsSqueakTemp_renderedMorph valueAtCursor getNumericValue]