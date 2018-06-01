scrolling
scrollPageInit: evt 
	evt redButtonPressed
		ifFalse: [^ self].
	self resetTimer.
	self setNextDirectionFromEvent: evt.
	self scrollBarAction: #doScrollByPage.
	self startStepping