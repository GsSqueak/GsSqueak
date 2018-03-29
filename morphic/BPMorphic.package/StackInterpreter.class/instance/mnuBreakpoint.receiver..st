debug support
mnuBreakpoint: selector receiver: rcvr 
	self
		mnuBreak: (objectMemory firstFixedFieldOfMaybeImmediate: selector)
		point: (objectMemory lengthOfMaybeImmediate: selector)
		receiver: rcvr