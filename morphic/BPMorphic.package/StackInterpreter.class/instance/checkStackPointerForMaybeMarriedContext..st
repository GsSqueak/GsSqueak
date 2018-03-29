internal interpreter access
checkStackPointerForMaybeMarriedContext: aContext 
	"Version of stackPointerForMaybeMarriedContext: with no side-effects
	(does not widow).
	Used for assertion checking. Safe only in external primitives
	(framePointer valid).
	Answer the stackPointer of a Context."
	| _gsSqueakTemp_sp |
	(self checkIsStillMarriedContext: aContext currentFP: framePointer)
		ifTrue: [_gsSqueakTemp_sp := self
						checkStackPointerIndexForFrame: (self frameOfMarriedContext: aContext).
			self assert: ReceiverIndex
					+ (objectMemory integerValueOf: _gsSqueakTemp_sp)
					< (objectMemory lengthOf: aContext).
			^ _gsSqueakTemp_sp].
	(self isMarriedOrWidowedContext: aContext)
		ifTrue: [^ self
				argumentCountOf: (objectMemory fetchPointer: MethodIndex ofObject: aContext)].
	^ self fetchStackPointerOf: aContext