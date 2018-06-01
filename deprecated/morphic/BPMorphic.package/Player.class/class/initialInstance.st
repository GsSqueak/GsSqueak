user-scripted subclasses
initialInstance
	self == Player
		ifTrue: [self error: 'must not instantiate naked Player'].
	^ super initialInstance