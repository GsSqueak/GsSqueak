initialize-release
home: aContextPart startpc: position nargs: anInteger 
	"This is the initialization message. The receiver has been initialized with 
	the correct size only."

	home := aContextPart.
	pc := startpc := position.
	nargs := anInteger.
	stackp := 0.