caching
releaseCachedState
	super releaseCachedState.
	presenter ifNotNil:[presenter flushPlayerListCache].
	self isWorldMorph ifTrue:[self cleanseStepList].