textual tabs
textualTab
	self isCurrentlyTextual
		ifTrue:
			[self changeTabText]
		ifFalse:
			[self useTextualTab]