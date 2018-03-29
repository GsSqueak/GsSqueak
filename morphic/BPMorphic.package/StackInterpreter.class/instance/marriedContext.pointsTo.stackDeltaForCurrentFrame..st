frame access
marriedContext: spouseContext pointsTo: anOop stackDeltaForCurrentFrame: stackDeltaForCurrentFrame 
	"This is a helper for primitiveObjectPointsTo so it *does not* check the
	frameContext field because that is an implicit self-reference not
	present in the state ."
	| _gsSqueakTemp_theFP _gsSqueakTemp_thePage _gsSqueakTemp_theSP _gsSqueakTemp_rcvrOffset |
	_gsSqueakTemp_theFP := self frameOfMarriedContext: spouseContext.
	_gsSqueakTemp_theFP = framePointer
		ifTrue: [_gsSqueakTemp_theSP := stackPointer + (stackDeltaForCurrentFrame * objectMemory wordSize)]
		ifFalse: [_gsSqueakTemp_thePage := stackPages stackPageFor: _gsSqueakTemp_theFP.
			_gsSqueakTemp_theSP := self findSPOf: _gsSqueakTemp_theFP on: _gsSqueakTemp_thePage].
	(objectMemory isIntegerObject: anOop)
		ifTrue: ["Check stack and instruction pointer fields."
			(anOop
						= (objectMemory
								integerObjectOf: (self stackPointerIndexForFrame: _gsSqueakTemp_theFP WithSP: _gsSqueakTemp_theSP))
					or: [anOop
							= (self externalInstVar: InstructionPointerIndex ofContext: spouseContext)])
				ifTrue: [^ true]]
		ifFalse: ["Check method and sender fields, avoiding unnecessarily
			reifying sender context."
			anOop
					= (self frameMethodObject: _gsSqueakTemp_theFP)
				ifTrue: [^ true].
			(self isBaseFrame: _gsSqueakTemp_theFP)
				ifTrue: [anOop
							= (self frameCallerContext: _gsSqueakTemp_theFP)
						ifTrue: [^ true]]
				ifFalse: [((self
								frameHasContext: (self frameCallerFP: _gsSqueakTemp_theFP))
							and: [anOop
									= (self
											frameContext: (self frameCallerFP: _gsSqueakTemp_theFP))])
						ifTrue: [^ true]]].
	"Now check receiver, temps and stack contents"
	_gsSqueakTemp_rcvrOffset := self frameReceiverLocation: _gsSqueakTemp_theFP.
	[_gsSqueakTemp_theSP <= _gsSqueakTemp_rcvrOffset]
		whileTrue: [anOop
					= (stackPages longAt: _gsSqueakTemp_theSP)
				ifTrue: [^ true].
			_gsSqueakTemp_theSP := _gsSqueakTemp_theSP + objectMemory wordSize].
	"Finally check stacked receiver (closure field or duplicate of receiver)
	and arguments"
	_gsSqueakTemp_theSP := _gsSqueakTemp_theFP + FoxCallerSavedIP + objectMemory wordSize.
	_gsSqueakTemp_rcvrOffset := _gsSqueakTemp_theFP
				+ (self frameStackedReceiverOffset: _gsSqueakTemp_theFP).
	[_gsSqueakTemp_theSP <= _gsSqueakTemp_rcvrOffset]
		whileTrue: [anOop
					= (stackPages longAt: _gsSqueakTemp_theSP)
				ifTrue: [^ true].
			_gsSqueakTemp_theSP := _gsSqueakTemp_theSP + objectMemory wordSize].
	^ false