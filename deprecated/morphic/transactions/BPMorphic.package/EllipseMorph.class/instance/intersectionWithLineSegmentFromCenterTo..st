geometry
intersectionWithLineSegmentFromCenterTo: aPoint 
	| _gsSqueakTemp_dx _gsSqueakTemp_aSquared _gsSqueakTemp_bSquared _gsSqueakTemp_m _gsSqueakTemp_mSquared _gsSqueakTemp_xSquared _gsSqueakTemp_x _gsSqueakTemp_y _gsSqueakTemp_dy |
	(self containsPoint: aPoint)
		ifTrue: [^ aPoint].
	_gsSqueakTemp_dx := aPoint x - self center x.
	_gsSqueakTemp_dy := aPoint y - self center y.
	_gsSqueakTemp_dx = 0
		ifTrue: [^ self bounds pointNearestTo: aPoint].
	_gsSqueakTemp_m := _gsSqueakTemp_dy / _gsSqueakTemp_dx.
	_gsSqueakTemp_mSquared := _gsSqueakTemp_m squared.
	_gsSqueakTemp_aSquared := (self bounds width / 2) squared.
	_gsSqueakTemp_bSquared := (self bounds height / 2) squared.
	_gsSqueakTemp_xSquared := 1 / (1 / _gsSqueakTemp_aSquared + (_gsSqueakTemp_mSquared / _gsSqueakTemp_bSquared)).
	_gsSqueakTemp_x := _gsSqueakTemp_xSquared sqrt.
	_gsSqueakTemp_dx < 0
		ifTrue: [_gsSqueakTemp_x := _gsSqueakTemp_x negated].
	_gsSqueakTemp_y := _gsSqueakTemp_m * _gsSqueakTemp_x.
	^ self center + (_gsSqueakTemp_x @ _gsSqueakTemp_y) asIntegerPoint