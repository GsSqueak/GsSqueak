callback support
reestablishContextPriorToCallback: callbackContext 
	"callbackContext is an activation of
	invokeCallback:[stack:registers:jmpbuf:]. Its sender is the VM's state
	prior to the callback. Reestablish that state,
	and mark calloutContext as dead."
	| _gsSqueakTemp_calloutContext _gsSqueakTemp_theFP _gsSqueakTemp_thePage |
	self flag: #obsolete.
	(self isLiveContext: callbackContext)
		ifFalse: [^ false].
	_gsSqueakTemp_calloutContext := self externalInstVar: SenderIndex ofContext: callbackContext.
	(self isLiveContext: _gsSqueakTemp_calloutContext)
		ifFalse: [^ false].
	"We're about to leave this stack page; must save the current frame's
	instructionPointer. "
	self push: instructionPointer.
	self externalWriteBackHeadFramePointers.
	"Mark callbackContext as dead; the common case is that it is the
	current frame.
	We go the extra mile for the debugger."
	(self isSingleContext: callbackContext)
		ifTrue: [self markContextAsDead: callbackContext]
		ifFalse: [_gsSqueakTemp_theFP := self frameOfMarriedContext: callbackContext.
			framePointer = _gsSqueakTemp_theFP
				ifTrue: ["common case"
					(self isBaseFrame: _gsSqueakTemp_theFP)
						ifTrue: [stackPages freeStackPage: stackPage]
						ifFalse: ["calloutContext is immediately below on the
							same page. Make it current."
							instructionPointer := (self frameCallerSavedIP: framePointer) asUnsignedInteger.
							stackPointer := framePointer
										+ (self frameStackedReceiverOffset: framePointer) + objectMemory wordSize.
							framePointer := self frameCallerFP: framePointer.
							^ true]]
				ifFalse: [self externalDivorceFrame: _gsSqueakTemp_theFP andContext: callbackContext.
					self markContextAsDead: callbackContext]].
	"Make the calloutContext the active frame. The case where
	calloutContext is immediately below callbackContext on the same
	page is handled above."
	(self isStillMarriedContext: _gsSqueakTemp_calloutContext)
		ifTrue: [_gsSqueakTemp_theFP := self frameOfMarriedContext: _gsSqueakTemp_calloutContext.
			_gsSqueakTemp_thePage := stackPages stackPageFor: _gsSqueakTemp_theFP.
			"findSPOf:on: points to the word beneath the
			instructionPointer, but
			there is no instructionPointer on the top frame of the current
			page. "
			self assert: _gsSqueakTemp_thePage ~= stackPage.
			stackPointer := (self findSPOf: _gsSqueakTemp_theFP on: _gsSqueakTemp_thePage)
						- objectMemory wordSize.
			framePointer := _gsSqueakTemp_theFP.
			self assert: stackPointer < framePointer]
		ifFalse: [_gsSqueakTemp_thePage := self makeBaseFrameFor: _gsSqueakTemp_calloutContext.
			self setStackPointersFromPage: _gsSqueakTemp_thePage].
	instructionPointer := self popStack.
	self setStackPageAndLimit: _gsSqueakTemp_thePage.
	^ true