other
maxBounds
	"fullBounds if all flop-out parts of the paintBox were showing."
	| _gsSqueakTemp_rr |
	_gsSqueakTemp_rr := bounds merge: colorMemory bounds.
	_gsSqueakTemp_rr := _gsSqueakTemp_rr merge: (self submorphNamed: 'stamps') bounds.
	_gsSqueakTemp_rr := _gsSqueakTemp_rr origin corner: _gsSqueakTemp_rr corner + (0 @ (self submorphNamed: 'shapes') height + 10).
	"what is showing of (self submorphNamed: #toggleShapes) height"
	^ _gsSqueakTemp_rr