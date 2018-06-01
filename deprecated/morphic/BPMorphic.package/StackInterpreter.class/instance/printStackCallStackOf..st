debug printing
printStackCallStackOf: aContextOrProcessOrFrame 
	| _gsSqueakTemp_theFP _gsSqueakTemp_context |
	(self
			cCode: [false
				"In the stack simulator, frame pointers are negative which
				upsets addressCouldBeObj:"]
			inSmalltalk: [stackPages couldBeFramePointer: aContextOrProcessOrFrame])
		ifFalse: [(objectMemory addressCouldBeObj: aContextOrProcessOrFrame)
				ifTrue: [((objectMemory isContext: aContextOrProcessOrFrame)
							and: [self checkIsStillMarriedContext: aContextOrProcessOrFrame currentFP: nil])
						ifTrue: [^ self printStackCallStackOf: (self frameOfMarriedContext: aContextOrProcessOrFrame) asInteger].
					(self couldBeProcess: aContextOrProcessOrFrame)
						ifTrue: [^ self
								printCallStackOf: (objectMemory fetchPointer: SuspendedContextIndex ofObject: aContextOrProcessOrFrame)].
					^ nil]].
	_gsSqueakTemp_theFP := aContextOrProcessOrFrame asVoidPointer.
	[_gsSqueakTemp_context := self shortReversePrintFrameAndCallers: _gsSqueakTemp_theFP.
	((self isMarriedOrWidowedContext: _gsSqueakTemp_context)
			and: [_gsSqueakTemp_theFP := self frameOfMarriedContext: _gsSqueakTemp_context.
				self checkIsStillMarriedContext: _gsSqueakTemp_context currentFP: _gsSqueakTemp_theFP])
		ifFalse: [^ nil]] repeat