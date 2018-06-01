message sending
justActivateNewMethod
	| _gsSqueakTemp_methodHeader _gsSqueakTemp_numArgs _gsSqueakTemp_numTemps _gsSqueakTemp_rcvr |
	_gsSqueakTemp_methodHeader := objectMemory methodHeaderOf: newMethod.
	_gsSqueakTemp_numTemps := self temporaryCountOfMethodHeader: _gsSqueakTemp_methodHeader.
	_gsSqueakTemp_numArgs := self argumentCountOfMethodHeader: _gsSqueakTemp_methodHeader.
	_gsSqueakTemp_rcvr := self stackValue: _gsSqueakTemp_numArgs.
	"could new rcvr be set at point of send?"
	self assert: (objectMemory isOopForwarded: _gsSqueakTemp_rcvr) not.
	self push: instructionPointer.
	self push: framePointer.
	framePointer := stackPointer.
	self push: newMethod.
	self setMethod: newMethod methodHeader: _gsSqueakTemp_methodHeader.
	self
		push: (self
				encodeFrameFieldHasContext: false
				isBlock: false
				numArgs: _gsSqueakTemp_numArgs).
	self push: objectMemory nilObject.
	"FxThisContext field"
	self push: _gsSqueakTemp_rcvr.
	"clear remaining temps to nil"
	_gsSqueakTemp_numArgs + 1
		to: _gsSqueakTemp_numTemps
		do: [:i | self push: objectMemory nilObject].
	instructionPointer := (self initialIPForHeader: _gsSqueakTemp_methodHeader method: newMethod)
				- 1.
	(self methodHeaderHasPrimitive: _gsSqueakTemp_methodHeader)
		ifTrue: ["Skip the CallPrimitive bytecode, if it's there, and store the
			error code if the method starts
			with a long store temp. Strictly no need to skip the store
			because it's effectively a noop."
			instructionPointer := instructionPointer
						+ (self sizeOfCallPrimitiveBytecode: _gsSqueakTemp_methodHeader).
			primFailCode ~= 0
				ifTrue: [self reapAndResetErrorCodeTo: stackPointer header: _gsSqueakTemp_methodHeader]].
	^ _gsSqueakTemp_methodHeader