frame access
setFrameContext: theFP to: aContext 
	stackPages longAt: theFP + FoxThisContext put: aContext