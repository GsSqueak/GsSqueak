I/O primitives
primitiveShowDisplayRect
	"Force the given rectangular section of the Display to be 
	copied to the screen."
	| _gsSqueakTemp_bottom _gsSqueakTemp_top _gsSqueakTemp_right _gsSqueakTemp_left |
	_gsSqueakTemp_bottom := self stackIntegerValue: 0.
	_gsSqueakTemp_top := self stackIntegerValue: 1.
	_gsSqueakTemp_right := self stackIntegerValue: 2.
	_gsSqueakTemp_left := self stackIntegerValue: 3.
	self
		updateDisplayLeft: _gsSqueakTemp_left
		Top: _gsSqueakTemp_top
		Right: _gsSqueakTemp_right
		Bottom: _gsSqueakTemp_bottom.
	self successful
		ifTrue: [self ioForceDisplayUpdate.
			self pop: 4]