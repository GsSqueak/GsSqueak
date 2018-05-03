message sending
justActivateNewMethod
	| methodHeader numArgs numTemps rcvr errorCode |
	<inline: true>
	methodHeader := self headerOf: newMethod.
	numTemps := self temporaryCountOfMethodHeader: methodHeader.
	numArgs := self argumentCountOfMethodHeader: methodHeader.

	rcvr := self stackValue: numArgs. "could new rcvr be set at point of send?"

	self push: instructionPointer.
	self push: framePointer.
	framePointer := stackPointer.
	self push: newMethod.
	self setMethod: newMethod.
	self push: (self encodeFrameFieldHasContext: false isBlock: false numArgs: numArgs).
	self push: objectMemory nilObject. "FxThisContext field"
	self push: rcvr.

	"clear remaining temps to nil"
	numArgs+1 to: numTemps do:
		[:i | self push: objectMemory nilObject].

	instructionPointer := (self initialPCForHeader: methodHeader method: newMethod) - 1.

	"Pass primitive error code to last temp if method receives it (indicated by an
	 initial long store temp bytecode).  We don't need to check that newMethod
	 actually has a primitive because the initial 129 only occurs if there is one."
	primFailCode ~= 0 ifTrue:
		[(objectMemory byteAtPointer: instructionPointer + 1) = 129 "long store temp" ifTrue:
			[errorCode := self getErrorObjectFromPrimFailCode.
			 self stackTopPut: errorCode "nil if primFailCode == 1, or primFailCode"].
		primFailCode := 0].

	^methodHeader