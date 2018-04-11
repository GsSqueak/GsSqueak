transformations
transform: aPoint 
	"Transform the given point from global to local coordinates."
	| _gsSqueakTemp_p2 _gsSqueakTemp_p3 |
	self isPureTranslation
		ifTrue: [^ aPoint + offset].
	_gsSqueakTemp_p2 := aPoint + offset.
	_gsSqueakTemp_p3 := _gsSqueakTemp_p2 x * angle cos - (_gsSqueakTemp_p2 y * angle sin) @ (_gsSqueakTemp_p2 y * angle cos + (_gsSqueakTemp_p2 x * angle sin)) / scale.
	^ _gsSqueakTemp_p3