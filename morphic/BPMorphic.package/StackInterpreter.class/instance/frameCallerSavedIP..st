frame access
frameCallerSavedIP: theFP 
	^ self
		pointerForOop: (stackPages longAt: theFP + FoxCallerSavedIP)"a.k.a. FoxCallerSavedIP"