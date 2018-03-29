other
estimatedLengthOf: deltaX with: deltaY 
	"Estimate the length of the vector described by deltaX and deltaY.
	This method may be extremely inaccurate - use it only
	if you know exactly that this doesn't matter. Otherwise
	use #accurateLengthOf:width:"
	| _gsSqueakTemp_absDx _gsSqueakTemp_absDy |
	deltaX >= 0
		ifTrue: [_gsSqueakTemp_absDx := deltaX]
		ifFalse: [_gsSqueakTemp_absDx := 0 - deltaX].
	deltaY >= 0
		ifTrue: [_gsSqueakTemp_absDy := deltaY]
		ifFalse: [_gsSqueakTemp_absDy := 0 - deltaY].
	_gsSqueakTemp_absDx > _gsSqueakTemp_absDy
		ifTrue: [^ _gsSqueakTemp_absDx + (_gsSqueakTemp_absDy // 2)]
		ifFalse: [^ _gsSqueakTemp_absDy + (_gsSqueakTemp_absDx // 2)]