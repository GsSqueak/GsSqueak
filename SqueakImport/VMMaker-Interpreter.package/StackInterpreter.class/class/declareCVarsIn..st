translation
declareCVarsIn: aCCodeGenerator
	self class == thisContext methodClass ifFalse: [^self]. "Don't duplicate decls in subclasses"
	aCCodeGenerator
		addHeaderFile:'<stddef.h> /* for e.g. alloca */';
		addHeaderFile:'<setjmp.h>';
		addHeaderFile:'"vmCallback.h"'.
	self declareInterpreterVersionIn: aCCodeGenerator
		defaultName: 'Stack'.
	aCCodeGenerator
		var: #interpreterProxy  type: #'struct VirtualMachine*'.
	aCCodeGenerator
		declareVar: #sendTrace type: 'volatile int';
		declareVar: #byteCount type: 'unsigned long'.
	"These need to be pointers or unsigned."
	self declareC: #(instructionPointer method newMethod)
		as: #usqInt
		in: aCCodeGenerator.
	"These are all pointers; char * because Slang has no support for C pointer arithmetic."
	self declareC: #(localIP localSP localFP stackPointer framePointer stackLimit stackMemory)
		as: #'char *'
		in: aCCodeGenerator.
	self declareC: #(stackPage overflowedPage)
		as: #'StackPage *'
		in: aCCodeGenerator.
	aCCodeGenerator removeVariable: 'stackPages'.  "this is an implicit receiver in the translated code."
	aCCodeGenerator
		var: #methodCache
		declareC: 'long methodCache[MethodCacheSize + 1 /* ', (MethodCacheSize + 1) printString, ' */]'.
	aCCodeGenerator
		var: #atCache
		declareC: 'sqInt atCache[AtCacheTotalSize + 1 /* ', (AtCacheTotalSize + 1) printString, ' */]'.
	self primitiveTable do:
		[:symbolOrNot|
		(symbolOrNot isSymbol
		 and: [symbolOrNot ~~ #primitiveFail]) ifTrue:
			[(aCCodeGenerator methodNamed: symbolOrNot) ifNotNil:
				[:tMethod| tMethod returnType: #void]]].
	aCCodeGenerator
		var: #primitiveFunctionPointer
		declareC: 'void (*primitiveFunctionPointer)()'.
	aCCodeGenerator var: #showSurfaceFn type: #'void *'.
	aCCodeGenerator
		var: #jmpBuf
		declareC: 'jmp_buf jmpBuf[MaxJumpBuf + 1 /* ', (MaxJumpBuf + 1) printString, ' */]'.
	aCCodeGenerator
		var: #suspendedCallbacks
		declareC: 'usqInt suspendedCallbacks[MaxJumpBuf + 1 /* ', (MaxJumpBuf + 1) printString, ' */]'.
	aCCodeGenerator
		var: #suspendedMethods
		declareC: 'usqInt suspendedMethods[MaxJumpBuf + 1 /* ', (MaxJumpBuf + 1) printString, ' */]'.
	aCCodeGenerator
		var: #interruptCheckChain
		declareC: 'void (*interruptCheckChain)(void) = 0'.
	aCCodeGenerator
		var: #breakSelector type: #'char *';
		var: #breakSelectorLength
		declareC: 'sqInt breakSelectorLength = -1'.

	self declareC: #(nextPollUsecs nextWakeupUsecs longRunningPrimitiveGCUsecs
					longRunningPrimitiveStartUsecs longRunningPrimitiveStopUsecs)
		as: #usqLong
		in: aCCodeGenerator.
	aCCodeGenerator var: #nextProfileTick type: #sqLong.

	aCCodeGenerator var: #primitiveTable declareC: 'void (*primitiveTable[' , (MaxPrimitiveIndex + 2) printString , '] )(void)= ' , self primitiveTableString.
	aCCodeGenerator var: #externalPrimitiveTable declareC: 'void (*externalPrimitiveTable[' , (MaxExternalPrimitiveTableSize + 1) printString , '])(void)'.
