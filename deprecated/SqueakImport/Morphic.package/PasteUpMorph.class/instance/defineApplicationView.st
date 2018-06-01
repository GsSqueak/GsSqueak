menu & halo
defineApplicationView

	| r |
	r := Rectangle fromUser.
	self 
		setProperty: #applicationViewBounds 
		toValue: ((self transformFromOutermostWorld) globalBoundsToLocal: r) truncated 