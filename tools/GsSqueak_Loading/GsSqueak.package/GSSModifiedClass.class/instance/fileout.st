utility
fileout

	self trimProperties.
	self trimMethods.
	self isUnnecessary
		ifTrue: [self deleteFolder]
		ifFalse: [super fileout]