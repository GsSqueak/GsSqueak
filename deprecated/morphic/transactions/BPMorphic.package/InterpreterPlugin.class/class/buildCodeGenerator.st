translation
buildCodeGenerator
	"Build a CCodeGenerator for the plugin"
	| _gsSqueakTemp_cg |
	_gsSqueakTemp_cg := self codeGeneratorClass new initialize.
	_gsSqueakTemp_cg pluginName: self moduleName.
	"Add an extra declaration for module name"
	_gsSqueakTemp_cg declareModuleName: self moduleNameAndVersion.
	_gsSqueakTemp_cg declareMethodsStatic: true.
	"Certain plugins expect their methods to be referenced by support
	code even if not so declared. Do not prune methods for those plugins."
	_gsSqueakTemp_cg permitMethodPruning: (self doNotPruneClasses includes: self moduleName) not.
	^ self initializeCodeGenerator: _gsSqueakTemp_cg