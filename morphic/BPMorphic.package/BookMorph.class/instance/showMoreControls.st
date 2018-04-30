navigation
showMoreControls
	self currentEvent shiftPressed
		ifTrue: [self hidePageControls]
		ifFalse: [self showPageControls: self fullControlSpecs]