frame access
frameCallerContext: theFP put: aValue 
	self
		assert: (aValue = objectMemory nilObject
				or: [objectMemory isContext: aValue]).
	^ stackPages longAt: theFP + FoxCallerContext put: aValue"a.k.a. FoxCallerSavedIP"