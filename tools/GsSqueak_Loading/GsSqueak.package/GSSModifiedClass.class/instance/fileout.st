utility
fileout

	self trimProperties.
	self trimMethods.
	self adoptOriginalMethodCategoryNames.
	self isUnnecessary
		ifTrue: [self deleteFolder]
		ifFalse: [super fileout]