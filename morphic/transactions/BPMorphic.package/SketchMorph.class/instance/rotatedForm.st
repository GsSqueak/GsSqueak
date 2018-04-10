accessing
rotatedForm
	rotatedForm
		ifNil: [self layoutChanged].
	^ rotatedForm