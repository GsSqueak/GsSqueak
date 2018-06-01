synchronization
protected: aBlock

	^(AccessLock ifNil: [ AccessLock := Mutex new ]) critical: aBlock