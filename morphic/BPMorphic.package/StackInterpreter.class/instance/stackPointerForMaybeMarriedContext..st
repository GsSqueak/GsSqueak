internal interpreter access
stackPointerForMaybeMarriedContext: aContext 
	"Return the stackPointer of a Context or BlockContext."
	| _gsSqueakTemp_sp |
	(self isStillMarriedContext: aContext)
		ifTrue: [_gsSqueakTemp_sp := self
						stackPointerIndexForFrame: (self frameOfMarriedContext: aContext).
			self assert: ReceiverIndex
					+ (objectMemory integerValueOf: _gsSqueakTemp_sp)
					< (objectMemory lengthOf: aContext).
			^ _gsSqueakTemp_sp].
	^ self fetchStackPointerOf: aContext