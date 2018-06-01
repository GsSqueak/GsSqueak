menu
toggleShowingOfPageControls
	self pageControlsVisible
		ifTrue:	[self hidePageControls]
		ifFalse:	[self showPageControls]