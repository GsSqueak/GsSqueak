events
doFastFrameDrag: grabPoint 
	"Do fast frame dragging from the given point"
	| _gsSqueakTemp_offset _gsSqueakTemp_newBounds _gsSqueakTemp_outerWorldBounds |
	_gsSqueakTemp_outerWorldBounds := self boundsIn: nil.
	_gsSqueakTemp_offset := _gsSqueakTemp_outerWorldBounds origin - grabPoint.
	_gsSqueakTemp_newBounds := _gsSqueakTemp_outerWorldBounds
				newRectFrom: [:f | Sensor cursorPoint + _gsSqueakTemp_offset extent: _gsSqueakTemp_outerWorldBounds extent].
	self
		position: (self globalPointToLocal: _gsSqueakTemp_newBounds topLeft);
		 comeToFront