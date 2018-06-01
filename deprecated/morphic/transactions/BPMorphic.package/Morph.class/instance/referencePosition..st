-Etoys-geometry
referencePosition: aPosition 
	"Move the receiver to match its reference position with aPosition"
	| _gsSqueakTemp_newPos _gsSqueakTemp_intPos |
	_gsSqueakTemp_newPos := self position + (aPosition - self referencePosition).
	_gsSqueakTemp_intPos := _gsSqueakTemp_newPos asIntegerPoint.
	_gsSqueakTemp_newPos = _gsSqueakTemp_intPos
		ifTrue: [self position: _gsSqueakTemp_intPos]
		ifFalse: [self position: _gsSqueakTemp_newPos]