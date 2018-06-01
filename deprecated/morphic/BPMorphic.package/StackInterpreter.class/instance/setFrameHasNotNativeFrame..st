frame access
setFrameHasNotNativeFrame: theFP 
	self
		temporary: (self frameNumArgs: theFP)
		in: theFP
		put: objectMemory nilObject