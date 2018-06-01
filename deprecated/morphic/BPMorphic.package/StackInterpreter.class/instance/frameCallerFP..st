frame access
frameCallerFP: theFP 
	^ self
		pointerForOop: (stackPages longAt: theFP + FoxSavedFP)