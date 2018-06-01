menu
autoFitOnOff
	autoFit := self isAutoFit not.
	self isAutoFit ifTrue: [self fit]