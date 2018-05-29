instance creation
requestUsername

	^ (UIManager default
		request: 'Username of Existing GemStone User'
		initialAnswer: 'SystemUser') ifEmpty: [nil]