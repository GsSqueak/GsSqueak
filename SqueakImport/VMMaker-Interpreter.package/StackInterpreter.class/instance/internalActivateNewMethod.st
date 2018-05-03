message sending
internalActivateNewMethod
	| methodHeader numTemps rcvr errorCode |
	<inline: true>

	methodHeader := self headerOf: newMethod.
	numTemps := self tempCountOfMethodHeader: methodHeader.

	rcvr := self internalStackValue: argumentCount. "could new rcvr be set at point of send?"

	self internalPush: localIP.
	self internalPush: localFP.
	localFP := localSP.
	self internalPush: newMethod.
	self setMethod: newMethod.
	self internalPush: (self
						encodeFrameFieldHasContext: false
						isBlock: false
						numArgs: (self argumentCountOfMethodHeader: methodHeader)).
	self internalPush: objectMemory nilObject. "FxThisContext field"
	self internalPush: rcvr.

	"Initialize temps..."
	argumentCount + 1 to: numTemps do:
		[:i | self internalPush: objectMemory nilObject].

	"-1 to account for pre-increment in fetchNextBytecode"
	localIP := self pointerForOop: (self initialPCForHeader: methodHeader method: newMethod) - 1.

	"Pass primitive error code to last temp if method receives it (indicated
	 by an initial long store temp bytecode).  Protect against obsolete values
	 in primFailCode by checking that newMethod actually has a primitive?"
	primFailCode ~= 0 ifTrue:
		[((self methodHeaderHasPrimitive: methodHeader)
		   and: [(objectMemory byteAtPointer: localIP + 1) = 129 "long store temp"]) ifTrue:
			[errorCode := self getErrorObjectFromPrimFailCode.
			 self internalStackTopPut: errorCode "nil if primFailCode == 1, or primFailCode"].
		primFailCode := 0].

	self assert: (self frameNumArgs: localFP) == argumentCount.
	self assert: (self frameIsBlockActivation: localFP) not.
	self assert: (self frameHasContext: localFP) not.

	"Now check for stack overflow or an event (interrupt, must scavenge, etc)."
	localSP < stackLimit ifTrue:
		[self externalizeIPandSP.
		 self handleStackOverflowOrEventAllowContextSwitch: (self canContextSwitchIfActivating: methodHeader).
		 self internalizeIPandSP]