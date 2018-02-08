class initialization
localeChanged
	self currentPlatform class == self
		ifTrue: [self startUp]