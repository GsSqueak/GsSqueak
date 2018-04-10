slot getters/setters
setValueAtCursor: aPlayer 
	| _gsSqueakTemp_renderedMorph _gsSqueakTemp_aCostume |
	_gsSqueakTemp_aCostume := self costume.
	((_gsSqueakTemp_renderedMorph := _gsSqueakTemp_aCostume renderedMorph) respondsTo: #valueAtCursor:)
		ifTrue: [^ _gsSqueakTemp_renderedMorph valueAtCursor: aPlayer costume].
	(_gsSqueakTemp_aCostume respondsTo: #valueAtCursor:)
		ifTrue: [_gsSqueakTemp_aCostume valueAtCursor: aPlayer costume]