callback support
returnAs: returnTypeOop ThroughCallback: vmCallbackContext Context: callbackMethodContext 
	"callbackMethodContext is an activation of
	invokeCallback:[stack:registers:jmpbuf:]. Its sender is the VM's state
	prior to the callback. Reestablish that state (via longjmp),
	and mark callbackMethodContext as dead."
	| _gsSqueakTemp_calloutMethodContext _gsSqueakTemp_theFP _gsSqueakTemp_thePage |
	self assert: primFailCode = 0.
	self
		assert: (objectMemory isIntegerObject: returnTypeOop).
	self assert: (objectMemory isImmediate: vmCallbackContext) not.
	self
		assert: ((objectMemory addressCouldBeObj: callbackMethodContext)
				and: [objectMemory isContext: callbackMethodContext]).
	self assert: (debugCallbackPath := 0) = 0.
	((objectMemory isIntegerObject: returnTypeOop)
			and: [self isLiveContext: callbackMethodContext])
		ifFalse: [self assert: (debugCallbackPath := 1) = 1.
			^ false].
	_gsSqueakTemp_calloutMethodContext := self externalInstVar: SenderIndex ofContext: callbackMethodContext.
	(self isLiveContext: _gsSqueakTemp_calloutMethodContext)
		ifFalse: [self assert: (debugCallbackPath := 2) = 2.
			^ false].
	self assert: (debugCallbackReturns := debugCallbackReturns + 1) > 0.
	"self assert: debugCallbackReturns < 3802."
	"We're about to leave this stack page; must save the current frame's
	instructionPointer. "
	self push: instructionPointer.
	self externalWriteBackHeadFramePointers.
	"Mark callbackMethodContext as dead; the common case is that it is
	the current frame.
	We go the extra mile for the debugger."
	(self isSingleContext: callbackMethodContext)
		ifTrue: [self assert: (debugCallbackPath := debugCallbackPath bitOr: 4) > 0.
			self markContextAsDead: callbackMethodContext]
		ifFalse: [self assert: (debugCallbackPath := debugCallbackPath bitOr: 8) > 0.
			_gsSqueakTemp_theFP := self frameOfMarriedContext: callbackMethodContext.
			self assert: (self frameReceiver: _gsSqueakTemp_theFP)
					= (objectMemory splObj: ClassAlien).
			framePointer = _gsSqueakTemp_theFP
				ifTrue: ["common case"
					self assert: (debugCallbackPath := debugCallbackPath bitOr: 16) > 0.
					(self isBaseFrame: _gsSqueakTemp_theFP)
						ifFalse: ["calloutMethodContext is immediately below on
							the same page. Make it current."
							self assert: (debugCallbackPath := debugCallbackPath bitOr: 32) > 0.
							instructionPointer := (self frameCallerSavedIP: _gsSqueakTemp_theFP) asUnsignedInteger.
							stackPointer := _gsSqueakTemp_theFP
										+ (self frameStackedReceiverOffset: _gsSqueakTemp_theFP) + objectMemory wordSize.
							framePointer := self frameCallerFP: _gsSqueakTemp_theFP.
							self
								setMethod: (self frameMethodObject: framePointer).
							self restoreCStackStateForCallbackContext: vmCallbackContext.
							self
								assertValidExecutionPointe: instructionPointer
								r: framePointer
								s: stackPointer.
							"N.B. siglongjmp is defines as _longjmp on
							non-win32 platforms.
							This matches the use of _setjmp in
							ia32abicc.c. "
							self
								siglong: vmCallbackContext trampoline
								jmp: (self integerValueOf: returnTypeOop).
							^ true].
					stackPages freeStackPage: stackPage]
				ifFalse: [self assert: (debugCallbackPath := debugCallbackPath bitOr: 64) > 0.
					self externalDivorceFrame: _gsSqueakTemp_theFP andContext: callbackMethodContext.
					self markContextAsDead: callbackMethodContext]].
	"Make the calloutMethodContext the active frame. The case where
	calloutMethodContext is immediately below callbackMethodContext on
	the same page is handled above."
	(self isStillMarriedContext: _gsSqueakTemp_calloutMethodContext)
		ifTrue: [self assert: (debugCallbackPath := debugCallbackPath bitOr: 128) > 0.
			_gsSqueakTemp_theFP := self frameOfMarriedContext: _gsSqueakTemp_calloutMethodContext.
			_gsSqueakTemp_thePage := stackPages stackPageFor: _gsSqueakTemp_theFP.
			"findSPOf:on: points to the word beneath the
			instructionPointer, but
			there is no instructionPointer on the top frame of the current
			page. "
			self assert: _gsSqueakTemp_thePage ~= stackPage.
			stackPointer := _gsSqueakTemp_thePage headFP = _gsSqueakTemp_theFP
						ifTrue: [_gsSqueakTemp_thePage headSP]
						ifFalse: [(self findSPOf: _gsSqueakTemp_theFP on: _gsSqueakTemp_thePage)
								- objectMemory wordSize].
			framePointer := _gsSqueakTemp_theFP.
			self assert: stackPointer < framePointer]
		ifFalse: [self assert: (debugCallbackPath := debugCallbackPath bitOr: 256) > 0.
			_gsSqueakTemp_thePage := self makeBaseFrameFor: _gsSqueakTemp_calloutMethodContext.
			self setStackPointersFromPage: _gsSqueakTemp_thePage].
	instructionPointer := self popStack.
	self
		setMethod: (objectMemory fetchPointer: MethodIndex ofObject: _gsSqueakTemp_calloutMethodContext).
	self setStackPageAndLimit: _gsSqueakTemp_thePage.
	self restoreCStackStateForCallbackContext: vmCallbackContext.
	primitiveFunctionPointer := vmCallbackContext savedPrimFunctionPointer.
	"N.B. siglongjmp is defined as _longjmp on non-win32 platforms.
	This matches the use of _setjmp in ia32abicc.c."
	self
		siglong: vmCallbackContext trampoline
		jmp: (self integerValueOf: returnTypeOop).
	"NOTREACHED"
	^ true