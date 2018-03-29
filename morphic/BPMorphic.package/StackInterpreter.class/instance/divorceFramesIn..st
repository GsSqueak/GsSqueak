frame access
divorceFramesIn: aStackPage 
	| _gsSqueakTemp_theFP _gsSqueakTemp_calleeFP _gsSqueakTemp_theSP _gsSqueakTemp_theIP _gsSqueakTemp_calleeContext _gsSqueakTemp_theContext |
	statStackPageDivorce := statStackPageDivorce + 1.
	_gsSqueakTemp_theFP := aStackPage headFP.
	_gsSqueakTemp_theSP := aStackPage headSP.
	_gsSqueakTemp_theIP := stackPages longAt: _gsSqueakTemp_theSP.
	_gsSqueakTemp_theSP := _gsSqueakTemp_theSP + objectMemory wordSize.
	"theSP points at hottest item on frame's stack"
	_gsSqueakTemp_calleeContext := nil.
	[_gsSqueakTemp_theContext := self ensureFrameIsMarried: _gsSqueakTemp_theFP SP: _gsSqueakTemp_theSP.
	self updateStateOfSpouseContextForFrame: _gsSqueakTemp_theFP WithSP: _gsSqueakTemp_theSP.
	objectMemory
		storePointerUnchecked: InstructionPointerIndex
		ofObject: _gsSqueakTemp_theContext
		withValue: (self contextInstructionPointer: _gsSqueakTemp_theIP frame: _gsSqueakTemp_theFP).
	self assert: (self frameReceiver: _gsSqueakTemp_theFP)
			= (objectMemory fetchPointer: ReceiverIndex ofObject: _gsSqueakTemp_theContext).
	_gsSqueakTemp_calleeContext ~~ nil
		ifTrue: [objectMemory
				storePointer: SenderIndex
				ofObject: _gsSqueakTemp_calleeContext
				withValue: _gsSqueakTemp_theContext].
	_gsSqueakTemp_calleeContext := _gsSqueakTemp_theContext.
	_gsSqueakTemp_calleeFP := _gsSqueakTemp_theFP.
	_gsSqueakTemp_theIP := (self frameCallerSavedIP: _gsSqueakTemp_theFP) asInteger.
	_gsSqueakTemp_theFP := self frameCallerFP: _gsSqueakTemp_theFP.
	_gsSqueakTemp_theFP ~= 0]
		whileTrue: ["theSP points at stacked hottest item on frame's stack"
			_gsSqueakTemp_theSP := self frameCallerSP: _gsSqueakTemp_calleeFP].
	objectMemory
		storePointer: SenderIndex
		ofObject: _gsSqueakTemp_theContext
		withValue: (self frameCallerContext: _gsSqueakTemp_calleeFP).
	"The page is now free; mark it so."
	aStackPage baseFP: 0