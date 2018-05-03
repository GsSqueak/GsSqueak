translation
declareCVarsIn: aCCodeGenerator 
	aCCodeGenerator addHeaderFile: '<setjmp.h>'.
	aCCodeGenerator var: #interpreterProxy type: #'struct VirtualMachine*'.
	"declare primitiveTable as an array of pointers to a function returning void, taking no arguments"
	aCCodeGenerator var: #primitiveFunctionPointer declareC: 'void (*primitiveFunctionPointer)(void)'.
	aCCodeGenerator var: #methodCache declareC: 'long methodCache[' , (MethodCacheSize + 1) printString , ']'.
	aCCodeGenerator var: #atCache declareC: 'sqInt atCache[' , (AtCacheTotalSize + 1) printString , ']'.
	aCCodeGenerator var: #statGCTime type: #sqLong.
	aCCodeGenerator var: #statFullGCMSecs type: #sqLong.
	aCCodeGenerator var: #statIGCDeltaTime type: #sqLong.
	aCCodeGenerator var: #statIncrGCMSecs type: #sqLong.
	aCCodeGenerator var: #localIP type: #'char*'.
	aCCodeGenerator var: #localSP type: #'char*'.
	aCCodeGenerator var: #showSurfaceFn type: #'void*'.
	aCCodeGenerator var: #compilerHooks declareC: 'sqInt (*compilerHooks[' , (CompilerHooksSize + 1) printString , '])()'.
	aCCodeGenerator var: #interpreterVersion declareC: 'const char *interpreterVersion = "' , SmalltalkImage current datedVersion , ' [' , SmalltalkImage current lastUpdateString , ']"'.
	self declareCAsOop: {#instructionPointer. #method. #newMethod. #activeContext. #theHomeContext. #stackPointer} in: aCCodeGenerator.
	aCCodeGenerator var: #jmpBuf declareC: 'jmp_buf jmpBuf[' , (MaxJumpBuf + 1) printString , ']'.
	aCCodeGenerator var: #suspendedCallbacks declareC: 'sqInt suspendedCallbacks[' , (MaxJumpBuf + 1) printString , ']'.
	aCCodeGenerator var: #suspendedMethods declareC: 'sqInt suspendedMethods[' , (MaxJumpBuf + 1) printString , ']'.
	"Reinitialized at interpreter entry by #initializeImageFormatVersion"
	aCCodeGenerator var: #imageFormatVersionNumber declareC: 'sqInt imageFormatVersionNumber = 0'.
	"Declared here to prevent inclusion in foo struct by
	CCodeGeneratorGlobalStructure"
	aCCodeGenerator var: #imageFormatInitialVersion declareC: 'sqInt imageFormatInitialVersion = 0'.
	aCCodeGenerator var: #primitiveTable declareC: 'void (*primitiveTable[' , (MaxPrimitiveIndex + 2) printString , '] )(void)= ' , self primitiveTableString.
	aCCodeGenerator var: #externalPrimitiveTable declareC: 'void (*externalPrimitiveTable[' , (MaxExternalPrimitiveTableSize + 1) printString , '])(void)'.
