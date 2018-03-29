internal interpreter access
framePointerOfNativeArgument: offset in: theFP 
	^ (self nativePreviousStackPointerIn: theFP)
		+ offset - 1