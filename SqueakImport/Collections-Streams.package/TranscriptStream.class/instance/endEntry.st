stream extensions
endEntry
	"Display all the characters since the last endEntry, and reset the stream"
	self semaphore critical:[
		self class forceUpdate
			ifTrue: [self changed: #appendEntry]
			ifFalse: [self changed: #appendEntryLater].
		self reset.
	].