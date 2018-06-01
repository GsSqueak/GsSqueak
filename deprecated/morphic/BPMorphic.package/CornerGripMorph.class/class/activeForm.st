accessing
activeForm
	^ ActiveForm
		ifNil: [self initializeActiveForm]