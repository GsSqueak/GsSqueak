frame access
frameCallerContext: theFP 
	^ stackPages longAt: theFP + FoxCallerContext"a.k.a. FoxCallerSavedIP"