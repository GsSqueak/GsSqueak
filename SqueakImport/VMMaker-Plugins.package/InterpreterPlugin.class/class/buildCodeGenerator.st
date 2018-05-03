translation
buildCodeGenerator
	"Build a CCodeGenerator for the plugin"
	 | cg |
	cg := self codeGeneratorClass new initialize.
	cg pluginName: self moduleName.
	"Add an extra declaration for module name"
	cg declareModuleName: self moduleNameAndVersion.
	cg declareMethodsStatic: true.
	"Certain plugins expect their methods to be referenced by support code
	even if not so declared. Do not prune methods for those plugins."
	cg permitMethodPruning: (self doNotPruneClasses includes: self moduleName) not.
	^self initializeCodeGenerator: cg.
