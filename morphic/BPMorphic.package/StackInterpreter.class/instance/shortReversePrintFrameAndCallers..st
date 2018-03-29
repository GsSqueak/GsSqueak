debug printing
shortReversePrintFrameAndCallers: aFramePointer 
	| _gsSqueakTemp_theFP _gsSqueakTemp_callerFP _gsSqueakTemp_caller |
	aFramePointer = 0
		ifTrue: [^ objectMemory nilObject].
	_gsSqueakTemp_theFP := aFramePointer.
	[self shortPrintFrame: _gsSqueakTemp_theFP.
	_gsSqueakTemp_callerFP := self frameCallerFP: _gsSqueakTemp_theFP.
	_gsSqueakTemp_callerFP ~= 0]
		whileTrue: [_gsSqueakTemp_theFP := _gsSqueakTemp_callerFP].
	_gsSqueakTemp_caller := self frameCallerContext: _gsSqueakTemp_theFP.
	(objectMemory isForwarded: _gsSqueakTemp_caller)
		ifTrue: [_gsSqueakTemp_caller := objectMemory followForwarded: _gsSqueakTemp_caller].
	^ _gsSqueakTemp_caller