message sending
dispatchFunctionPointer: aFunctionPointer 
	<var: #aFunctionPointer declareC: 'void (*aFunctionPointer)(void)'>
	self
		cCode: '(aFunctionPointer)()'
		inSmalltalk: [self error: 'my simulator should simulate me']