translation
initializeCodeGenerator: cg
	"Load a code generator with classes in a manner suitable for generating
	code for this class."

	super initializeCodeGenerator: cg.
	VMMaker addMemoryAccessTo: cg.
	^cg
