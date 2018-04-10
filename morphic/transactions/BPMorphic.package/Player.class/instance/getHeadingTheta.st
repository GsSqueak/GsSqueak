slot getters/setters
getHeadingTheta
	"Answer the angle, in degrees, between the positive x-axis and the
	receiver's heading vector"
	| _gsSqueakTemp_aHeading _gsSqueakTemp_excess _gsSqueakTemp_normalized |
	_gsSqueakTemp_aHeading := self getHeadingUnrounded.
	_gsSqueakTemp_excess := _gsSqueakTemp_aHeading - _gsSqueakTemp_aHeading rounded.
	_gsSqueakTemp_normalized := 450 - _gsSqueakTemp_aHeading \\ 360.
	^ _gsSqueakTemp_normalized + _gsSqueakTemp_excess