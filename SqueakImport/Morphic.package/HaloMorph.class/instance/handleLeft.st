stepping
handleLeft
	self isMagicHalo ifFalse:[^self].
	self stopStepping; startStepping.
	self startSteppingSelector: #fadeOut.