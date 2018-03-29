frame access
externalInstVar: index ofContext: maybeMarriedContext put: anOop 
	| _gsSqueakTemp_theFP _gsSqueakTemp_thePage _gsSqueakTemp_onCurrentPage |
	self
		assert: (objectMemory isContext: maybeMarriedContext).
	self externalWriteBackHeadFramePointers.
	"Assign the field of a married context."
	self
		deny: (objectMemory isObjImmutable: maybeMarriedContext).
	(self isStillMarriedContext: maybeMarriedContext)
		ifFalse: [objectMemory
				storePointer: index
				ofObject: maybeMarriedContext
				withValue: anOop.
			index = StackPointerIndex
				ifTrue: [self ensureContextIsExecutionSafeAfterAssignToStackPointer: maybeMarriedContext].
			^ nil].
	_gsSqueakTemp_theFP := self frameOfMarriedContext: maybeMarriedContext.
	_gsSqueakTemp_thePage := stackPages stackPageFor: _gsSqueakTemp_theFP.
	self assert: stackPage = stackPages mostRecentlyUsedPage.
	_gsSqueakTemp_onCurrentPage := _gsSqueakTemp_thePage = stackPage.
	index = SenderIndex
		ifTrue: [self storeSenderOfFrame: _gsSqueakTemp_theFP withValue: anOop]
		ifFalse: [self externalDivorceFrame: _gsSqueakTemp_theFP andContext: maybeMarriedContext.
			(self is: index methodAssignmentToContextWithMachineCodePC: maybeMarriedContext)
				ifTrue: [self ensureContextHasBytecodePC: maybeMarriedContext].
			objectMemory
				storePointer: index
				ofObject: maybeMarriedContext
				withValue: anOop.
			index = StackPointerIndex
				ifTrue: [self ensureContextIsExecutionSafeAfterAssignToStackPointer: maybeMarriedContext]].
	_gsSqueakTemp_onCurrentPage
		ifTrue: [self setStackPointersFromPage: stackPage]
		ifFalse: [stackPages markStackPageMostRecentlyUsed: stackPage].
	stackPages assert: stackPage = stackPages mostRecentlyUsedPage.
	stackPages assert: stackPages pageListIsWellFormed.
	stackPages assert: self validStackPageBaseFrames