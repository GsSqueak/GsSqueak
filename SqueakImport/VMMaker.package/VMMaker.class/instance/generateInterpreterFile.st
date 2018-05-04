generate sources
generateInterpreterFile
	"Translate the Smalltalk description of the virtual machine into C.  If 'self doInlining' is true, small method bodies are inlined to reduce procedure call overhead.  On the PPC, this results in a factor of three speedup with only 30% increase in code size.  Subclasses can use specialised versions of CCodeGenerator and interpreterClass."

	| cg |
	self needsToRegenerateInterpreterFile ifFalse: [^nil].
	self interpreterClass initialize.
	ObjectMemory initializeConstants.
	ObjectMemory initializeSmallIntegers. "Overridden in simulation, restore for code generation"
	ContextInterpreter initializeInterpreterSourceVersion.
	cg := self createCodeGenerator.
	cg declareMethodsStatic: false.
	self interpreterClass initializeCodeGenerator: cg.
	cg vmClass: self interpreterClass.
	cg storeHeaderFor: interpreterClassName onFile: self interpreterHeaderPath.
	cg storeCodeOnFile: self interpreterFilePath doInlining: self doInlining.
	self interpreterClass additionalHeadersDo:
		[:headerName :headerContents| | filePath |
		 filePath := self coreVMDirectory fullNameFor: headerName.
		 (cg needToGenerateHeader: headerName file: filePath contents: headerContents) ifTrue:
			 [cg storeHeaderOnFile: filePath contents: headerContents]].
	self interpreterClass apiExportHeaderName ifNotNil:
		[cg storeAPIExportHeader: self interpreterClass apiExportHeaderName
			OnFile: (self sourceFilePathFor: self interpreterClass apiExportHeaderName)].
