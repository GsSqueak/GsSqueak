utility
fileoutTo: aFileDirectory

	self trimProperties.
	self trimMethods.
	self trimComment.
	self isUnmodified
		ifTrue: [self deleteFolder]
		ifFalse: [super fileoutTo: aFileDirectory]