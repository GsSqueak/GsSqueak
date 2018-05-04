translation
buildCodeGeneratorInlined: doInlining
	"Build a CCodeGenerator for this class."

	 | cg |
	cg := CCodeGeneratorGlobalStructure new initialize.
	cg declareMethodsStatic: false.
	cg permitMethodPruning: true.
	cg uncheckedAbstractMethods addAll: self abstractSelectors.
	^self initializeCodeGenerator: cg

