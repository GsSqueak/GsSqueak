stepping
handleEntered
	self isMagicHalo
		ifFalse: [^ self].
	self stopStepping; startStepping.
	self startSteppingSelector: #fadeIn