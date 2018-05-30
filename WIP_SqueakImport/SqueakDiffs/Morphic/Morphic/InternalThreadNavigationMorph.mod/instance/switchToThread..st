navigation
switchToThread: newName

	threadName := newName.
	listOfPages := self class knownThreads at: threadName.
	self removeAllMorphs.
	self addButtons.
	self currentIndex.
