keyboard control
keyStroke: evt 
	self hideKeyboardHelp; noteRootMenuHasUsedKeyboard.
	self keyStrokeHandlers
		detect: [:each | self perform: each with: evt]
		ifNone: [self handleFiltering: evt]