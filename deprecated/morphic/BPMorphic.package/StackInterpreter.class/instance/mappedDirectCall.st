sista bytecodes
mappedDirectCall
	"250	directCall
	literal index of the method to call on top of stack => (variable number
	of parameters)"
	| _gsSqueakTemp_methodHeader _gsSqueakTemp_localPrimIndex _gsSqueakTemp_methodIndex |
	_gsSqueakTemp_methodIndex := self internalPopStack.
	"Can't write this inside next line for Slang inliner"
	newMethod := self
				literal: (objectMemory integerValueOf: _gsSqueakTemp_methodIndex).
	self
		assert: (objectMemory isCompiledMethod: newMethod).
	_gsSqueakTemp_methodHeader := objectMemory methodHeaderOf: newMethod.
	_gsSqueakTemp_localPrimIndex := self primitiveIndexOfMethod: newMethod header: _gsSqueakTemp_methodHeader.
	argumentCount := self argumentCountOfMethodHeader: _gsSqueakTemp_methodHeader.
	"The primitive function pointer is not cached in the interpreter, but it's
	called quickly in the JIT"
	primitiveFunctionPointer := self functionPointerFor: _gsSqueakTemp_localPrimIndex inClass: objectMemory nilObject.
	self internalActivateNewMethod