heading
headLeft
	| _gsSqueakTemp_radians |
	_gsSqueakTemp_radians := (self getHeadingUnrounded - 90.0) degreesToRadians.
	self setHeading: ((_gsSqueakTemp_radians cos abs negated @ _gsSqueakTemp_radians sin) theta radiansToDegrees roundTo: 0.001)
			+ 90.0