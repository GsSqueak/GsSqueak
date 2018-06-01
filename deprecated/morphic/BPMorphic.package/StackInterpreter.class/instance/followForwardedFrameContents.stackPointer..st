lazy become
followForwardedFrameContents: theFP stackPointer: theSP 
	"follow pointers in the current stack frame up to theSP."
	| _gsSqueakTemp_oop |
	theSP
		to: (self frameReceiverLocation: theFP)
		by: objectMemory wordSize
		do: [:ptr | 
			_gsSqueakTemp_oop := stackPages longAt: ptr.
			((objectMemory isNonImmediate: _gsSqueakTemp_oop)
					and: [objectMemory isForwarded: _gsSqueakTemp_oop])
				ifTrue: [stackPages
						longAt: ptr
						put: (objectMemory followForwarded: _gsSqueakTemp_oop)]].
	theFP + FoxCallerSavedIP + objectMemory wordSize
		to: theFP
				+ (self frameStackedReceiverOffset: theFP)
		by: objectMemory wordSize
		do: [:ptr | 
			_gsSqueakTemp_oop := stackPages longAt: ptr.
			((objectMemory isNonImmediate: _gsSqueakTemp_oop)
					and: [objectMemory isForwarded: _gsSqueakTemp_oop])
				ifTrue: [_gsSqueakTemp_oop := objectMemory followForwarded: _gsSqueakTemp_oop.
					stackPages longAt: ptr put: _gsSqueakTemp_oop]].
	"If we're in a block then also follow fields in the stacked closure as it
	may be activated again."
	(self frameIsBlockActivation: theFP)
		ifTrue: [self assert: _gsSqueakTemp_oop
					= (stackPages longAt: theFP
								+ (self frameStackedReceiverOffset: theFP)).
			objectMemory followForwardedObjectFields: _gsSqueakTemp_oop toDepth: 0].
	self assert: (objectMemory
			isForwarded: (self frameMethodObject: theFP)) not.
	(self frameHasContext: theFP)
		ifTrue: [self assert: (objectMemory
					isForwarded: (self frameContext: theFP)) not]