running
cancelDialog
	self cancelButton
		ifNil: [self closeDialog: nil]
		ifNotNil: [:btn | btn performAction]