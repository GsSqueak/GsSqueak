translation
initializeCodeGenerator: cg
	"Load a code generator with classes in a manner suitable for generating
	code for this class."

	super initializeCodeGenerator: cg.

	"fixme - there is a method for getting the non-struct classes, use that"
	"add before the remapping - move this to init object memory if it works"
	cg addClass: InterpreterStackPages.


	self initializeNewObjectMemoryInCodeGenerator: cg.

	"fixme - there is a method for getting the struct classes, use that"
	cg addStructClasses: { VMCallbackContext . InterpreterStackPage }.
