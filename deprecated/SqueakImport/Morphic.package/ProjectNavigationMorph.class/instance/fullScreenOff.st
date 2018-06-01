the actions
fullScreenOff

	self setProperty: #showingFullScreenMode toValue: false.
	DisplayScreen fullScreenOff.
	self removeProperty: #currentNavigatorVersion.
	mouseInside := false.
