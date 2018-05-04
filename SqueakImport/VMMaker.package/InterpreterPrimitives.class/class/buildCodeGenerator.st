translation
buildCodeGenerator
	"Build a CCodeGenerator. Use VMMaker to determine an appropriate
	code generator for the current platform."
	 | cg |
	cg := VMMaker new createCodeGenerator.
	cg declareMethodsStatic: false.
	cg permitMethodPruning: true.
	^self initializeCodeGenerator: cg.
