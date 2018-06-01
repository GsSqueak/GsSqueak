transformations
invert: aPoint 
	"Transform the given point from local to global coordinates."
	| _gsSqueakTemp_p3 _gsSqueakTemp_p2 |
	self isPureTranslation
		ifTrue: [^ aPoint - offset].
	_gsSqueakTemp_p3 := aPoint * scale.
	_gsSqueakTemp_p2 := _gsSqueakTemp_p3 x * angle cos + (_gsSqueakTemp_p3 y * angle sin) @ (_gsSqueakTemp_p3 y * angle cos - (_gsSqueakTemp_p3 x * angle sin)).
	^ _gsSqueakTemp_p2 - offset