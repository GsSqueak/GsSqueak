frame access
setFrameHasNativeFrame: theFP 
	self
		temporary: (self frameNumArgs: theFP)
		in: theFP
		put: (objectMemory splObj: LowcodeContextMark)