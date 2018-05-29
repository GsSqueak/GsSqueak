accessing
at: index put: value
	self notYetImplemented.
	value isFloat 
		ifTrue:[self basicAt: index put: value asIEEE32BitWord]
		ifFalse:[self at: index put: value asFloat].
	^value