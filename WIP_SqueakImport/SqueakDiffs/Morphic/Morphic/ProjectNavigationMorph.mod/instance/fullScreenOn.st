the actions
fullScreenOn

	self setProperty: #showingFullScreenMode toValue: true.
	DisplayScreen fullScreenOn.
	self removeProperty: #currentNavigatorVersion.
	mouseInside := false.
