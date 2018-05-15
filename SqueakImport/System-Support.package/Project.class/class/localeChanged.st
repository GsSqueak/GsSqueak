class initialization
localeChanged
	self current class == self
		ifTrue: [self current localeChanged].