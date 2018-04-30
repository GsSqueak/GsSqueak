page controls
fewerPageControls
	self currentEvent shiftPressed
		ifTrue: [self hidePageControls]
		ifFalse: [self showPageControls: self shortControlSpecs]