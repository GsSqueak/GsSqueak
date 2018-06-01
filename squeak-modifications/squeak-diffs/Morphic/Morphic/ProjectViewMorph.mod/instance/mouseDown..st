event handling
mouseDown: evt

	evt yellowButtonPressed ifTrue:
		[self showMenuForProjectView].
	evt hand newMouseFocus: self.
	self removeProperty: #wasOpenedAsSubproject.
	self showMouseState: 2.