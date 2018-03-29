frame access
frameMethodObject: theFP 
	"Homonym of frameMethod: for compatibility with CoInterpreter"
	^ stackPages longAt: theFP + FoxMethod