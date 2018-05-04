initialize
createCodeGenerator
"set up a CCodeGenerator for this VMMaker - Mac OS uses the global struct and local def of the structure"
	^CCodeGeneratorGlobalStructure new
		globalStructDefined: true