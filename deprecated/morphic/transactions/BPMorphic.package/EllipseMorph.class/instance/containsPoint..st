geometry testing
containsPoint: aPoint 
	| _gsSqueakTemp_radius _gsSqueakTemp_other _gsSqueakTemp_delta _gsSqueakTemp_xOverY |
	(bounds containsPoint: aPoint)
		ifFalse: [^ false].
	"quick elimination"
	(bounds width = 1
			or: [bounds height = 1])
		ifTrue: [^ true].
	"Degenerate case -- code below fails by a bit"
	_gsSqueakTemp_radius := bounds height asFloat / 2.
	_gsSqueakTemp_other := bounds width asFloat / 2.
	_gsSqueakTemp_delta := aPoint - bounds topLeft - (_gsSqueakTemp_other @ _gsSqueakTemp_radius).
	_gsSqueakTemp_xOverY := bounds width asFloat / bounds height asFloat.
	^ (_gsSqueakTemp_delta x asFloat / _gsSqueakTemp_xOverY) squared + _gsSqueakTemp_delta y squared <= _gsSqueakTemp_radius squared