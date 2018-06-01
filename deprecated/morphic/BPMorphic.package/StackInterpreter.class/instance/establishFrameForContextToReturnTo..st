frame access
establishFrameForContextToReturnTo: contextToReturnTo 
	| _gsSqueakTemp_thePage |
	(objectMemory isContext: contextToReturnTo)
		ifFalse: [^ 0].
	(self isMarriedOrWidowedContext: contextToReturnTo)
		ifTrue: [(self isWidowedContext: contextToReturnTo)
				ifTrue: ["error: home's sender is dead; cannot return"
					^ 0].
			^ self frameOfMarriedContext: contextToReturnTo].
	(objectMemory
			isIntegerObject: (objectMemory fetchPointer: InstructionPointerIndex ofObject: contextToReturnTo))
		ifFalse: [^ 0].
	_gsSqueakTemp_thePage := self makeBaseFrameFor: contextToReturnTo.
	stackPages markStackPageMostRecentlyUsed: _gsSqueakTemp_thePage.
	^ _gsSqueakTemp_thePage baseFP