-widgets-geometry
visibleBounds
	"Computes the rectangle that is not occluded and actually visible on
	the screen."
	| _gsSqueakTemp_globalBounds |
	_gsSqueakTemp_globalBounds := self boundsInWorld.
	^ self owner
		ifNil: [_gsSqueakTemp_globalBounds]
		ifNotNil: [self owner visibleBounds intersect: _gsSqueakTemp_globalBounds]