initialization
initialize

	super initialize.
	
	self
		changeTableLayout;
		listDirection: #topToBottom;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		setProperty: #indicateKeyboardFocus toValue: #never.
	
	self createTitle: 'Dialog'.
	self createBody.
	
	self setDefaultParameters.
	
	keyMap := Dictionary new.
	exclusive := true.
	autoCancel := false.
	preferredPosition := ActiveWorld center.