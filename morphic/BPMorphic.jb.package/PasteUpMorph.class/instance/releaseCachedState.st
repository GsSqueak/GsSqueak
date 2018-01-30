caching
releaseCachedState
	super releaseCachedState.
	self removeModalWindow.
	presenter
		ifNotNil: [presenter flushPlayerListCache].
	self isWorldMorph
		ifTrue: [self cleanseStepList]