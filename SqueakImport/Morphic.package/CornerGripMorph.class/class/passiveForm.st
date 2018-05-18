accessing
passiveForm
	^PassiveForm ifNil: [self initializePassiveForm]