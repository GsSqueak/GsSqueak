frame access
instVar: offset ofContext: aContext 
	"Fetch an instance variable from a maybe married context.
	If the context is still married compute the value of the
	relevant inst var from the spouse frame's state."
	| _gsSqueakTemp_spouseFP |
	self assert: offset < MethodIndex.
	self
		assert: (objectMemory isContext: aContext).
	(self isMarriedOrWidowedContext: aContext)
		ifFalse: [^ objectMemory fetchPointer: offset ofObject: aContext].
	self writeBackHeadFramePointers.
	(self isWidowedContext: aContext)
		ifTrue: [^ objectMemory fetchPointer: offset ofObject: aContext].
	_gsSqueakTemp_spouseFP := self frameOfMarriedContext: aContext.
	offset = SenderIndex
		ifTrue: [^ self ensureCallerContext: _gsSqueakTemp_spouseFP].
	offset = StackPointerIndex
		ifTrue: [self assert: ReceiverIndex
					+ (self stackPointerIndexForFrame: _gsSqueakTemp_spouseFP)
					< (objectMemory lengthOf: aContext).
			^ objectMemory
				integerObjectOf: (self stackPointerIndexForFrame: _gsSqueakTemp_spouseFP)].
	offset = InstructionPointerIndex
		ifTrue: [^ self
				instructionPointerForFrame: _gsSqueakTemp_spouseFP
				currentFP: localFP
				currentIP: (self oopForPointer: localIP)].
	self error: 'bad index'.
	^ 0