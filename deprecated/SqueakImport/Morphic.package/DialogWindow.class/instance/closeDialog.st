running
closeDialog

	self selectedButton
		ifNil: [self closeDialog: nil]
		ifNotNil: [:btn | btn performAction].	