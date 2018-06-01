focus
passivateIfNeeded
	model windowActiveOnFirstClick
		ifTrue: [self lookUnfocused]
		ifFalse: [self passivate].
	self unlockWindowDecorations.
	self class windowTitleActiveOnFirstClick
		ifTrue: [self unlockWindowTitle]
		ifFalse: [self lockWindowTitle]