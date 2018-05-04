translation
buildCodeGeneratorInlined: doInlining
	"Build a CCodeGenerator for this class. By default, generate only the
	the methods for aClass. Classes that are normally translated along with
	other collaborating classes, such as an object memory and its interpreter,
	may include the collaborating classes when doInlining is true, allowing methods
	in those classes to be included in the inlining process."

	 | cg |
	cg := VMMaker new createCodeGenerator.
	cg declareMethodsStatic: false.
	cg permitMethodPruning: true.
	cg uncheckedAbstractMethods addAll: self abstractSelectors.
	doInlining
		ifTrue: ["Include methods from associated classes so that inlining for each
				method is performed as in normal interp.c generation"
				^self interpreterClass initializeCodeGenerator: cg]
		ifFalse: [^self initializeCodeGenerator: cg]

