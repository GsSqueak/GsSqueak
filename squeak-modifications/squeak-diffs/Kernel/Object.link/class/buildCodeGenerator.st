*VMMaker-translation
buildCodeGenerator
	"Build a CCodeGenerator for this class. By default, generate only the
	the methods for aClass."
	 | cg |
	cg := self codeGeneratorClass new initialize.
	cg declareModuleName: self name.
	cg addClass: self.
	cg declareMethodsStatic: true.
	cg permitMethodPruning: false.
	^cg
