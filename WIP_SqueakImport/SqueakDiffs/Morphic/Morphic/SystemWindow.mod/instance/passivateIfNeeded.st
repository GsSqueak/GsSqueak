focus
passivateIfNeeded

	model windowActiveOnFirstClick
		ifFalse: [self passivate]
		ifTrue: [self lookUnfocused].
	
	self unlockWindowDecorations.
	
	self class windowTitleActiveOnFirstClick
		ifFalse: [self lockWindowTitle]
		ifTrue: [self unlockWindowTitle].