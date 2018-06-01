initialization
initialize

	super initialize.

	self
		changeTableLayout;
		listDirection: #leftToRight;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		layoutInset: 3;
		cellInset: 3;
		wrapCentering: #center;
		cellPositioning: #leftCenter;
		setProperty: #indicateKeyboardFocus toValue: #never.
	
	self doMove.
	
	self on: #keyStroke send: #keyStroke: to: self.
	self on: #keyUp send: #updateFromUserInputEvent: to: self.
	self on: #keyDown send: #updateFromUserInputEvent: to: self.

	self setDefaultParameters.