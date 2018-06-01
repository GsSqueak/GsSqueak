event handling
cursorPoint
	"Implemented for allowing embedded worlds in an event cycle to
	query a hand's position and get it in its coordinates. The same can be
	achieved by #point:from: but this is simply much more convenient
	since it will look as if the hand is in the lower world."
	| _gsSqueakTemp_pos |
	_gsSqueakTemp_pos := self position.
	(ActiveWorld isNil
			or: [ActiveWorld == owner])
		ifTrue: [^ _gsSqueakTemp_pos].
	^ ActiveWorld point: _gsSqueakTemp_pos from: owner