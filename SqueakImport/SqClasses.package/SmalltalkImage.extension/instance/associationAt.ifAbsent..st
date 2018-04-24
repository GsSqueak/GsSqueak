*SqClasses-*SqClasses-*SqClasses-dictionary access
associationAt: key ifAbsent: aBlock
	"Obsoleted."

	self deprecated: 'Use Smalltalk globals'.
	^globals associationAt: key ifAbsent: aBlock
