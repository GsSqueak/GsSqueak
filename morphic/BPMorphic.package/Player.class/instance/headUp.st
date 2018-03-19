heading
headUp
	| _gsSqueakTemp_radians |
	_gsSqueakTemp_radians := (self getHeadingUnrounded - 90.0) degreesToRadians.
	self setHeading: ((_gsSqueakTemp_radians cos @ _gsSqueakTemp_radians sin abs negated) theta radiansToDegrees roundTo: 0.001)
			+ 90.0