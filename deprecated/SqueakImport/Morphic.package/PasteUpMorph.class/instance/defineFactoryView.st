menu & halo
defineFactoryView

	| r |
	r := Rectangle fromUser.
	self 
		setProperty: #factoryViewBounds 
		toValue: ((self transformFromOutermostWorld) globalBoundsToLocal: r) truncated 