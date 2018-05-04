translation
isNonArgumentImplicitReceiverVariableName: aString
	^aString = 'objectMemory'
		or: [super isNonArgumentImplicitReceiverVariableName: aString]
