solid tabs
solidTab
	self isCurrentlySolid
		ifTrue: [self changeTabSolidity]
		ifFalse: [self useSolidTab]