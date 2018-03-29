message sending
internalActivateNewMethod
	| _gsSqueakTemp_methodHeader _gsSqueakTemp_numTemps _gsSqueakTemp_rcvr |
	_gsSqueakTemp_methodHeader := objectMemory methodHeaderOf: newMethod.
	_gsSqueakTemp_numTemps := self temporaryCountOfMethodHeader: _gsSqueakTemp_methodHeader.
	self assert: argumentCount
			= (self argumentCountOfMethodHeader: _gsSqueakTemp_methodHeader).
	_gsSqueakTemp_rcvr := self internalStackValue: argumentCount.
	"could new rcvr be set at point of send?"
	self assert: (objectMemory isOopForwarded: _gsSqueakTemp_rcvr) not.
	self internalPush: localIP.
	self internalPush: localFP.
	localFP := localSP.
	self internalPush: newMethod.
	self setMethod: newMethod methodHeader: _gsSqueakTemp_methodHeader.
	self
		internalPush: (self
				encodeFrameFieldHasContext: false
				isBlock: false
				numArgs: (self argumentCountOfMethodHeader: _gsSqueakTemp_methodHeader)).
	self internalPush: objectMemory nilObject.
	"FxThisContext field"
	self internalPush: _gsSqueakTemp_rcvr.
	"Initialize temps..."
	argumentCount + 1
		to: _gsSqueakTemp_numTemps
		do: [:i | self internalPush: objectMemory nilObject].
	"-1 to account for pre-increment in fetchNextBytecode"
	localIP := self pointerForOop: (self initialIPForHeader: _gsSqueakTemp_methodHeader method: newMethod)
					- 1.
	(self methodHeaderHasPrimitive: _gsSqueakTemp_methodHeader)
		ifTrue: ["Skip the CallPrimitive bytecode, if it's there, and store the
			error code if the method starts
			with a long store temp. Strictly no need to skip the store
			because it's effectively a noop."
			localIP := localIP
						+ (self sizeOfCallPrimitiveBytecode: _gsSqueakTemp_methodHeader).
			primFailCode ~= 0
				ifTrue: [self reapAndResetErrorCodeTo: localSP header: _gsSqueakTemp_methodHeader]].
	self assert: (self frameNumArgs: localFP)
			== argumentCount.
	self assert: (self frameIsBlockActivation: localFP) not.
	self assert: (self frameHasContext: localFP) not.
	"Now check for stack overflow or an event (interrupt, must scavenge,
	etc). "
	localSP < stackLimit
		ifTrue: [self externalizeIPandSP.
			self
				handleStackOverflowOrEventAllowContextSwitch: (self canContextSwitchIfActivating: newMethod header: _gsSqueakTemp_methodHeader).
			self internalizeIPandSP]