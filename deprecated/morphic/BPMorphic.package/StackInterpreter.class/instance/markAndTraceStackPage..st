object memory support
markAndTraceStackPage: thePage 
	| _gsSqueakTemp_theSP _gsSqueakTemp_theFP _gsSqueakTemp_frameRcvrOffset _gsSqueakTemp_callerFP _gsSqueakTemp_oop |
	self assert: (stackPages isFree: thePage) not.
	self
		assert: (self ifCurrentStackPageHasValidHeadPointers: thePage).
	self assert: thePage trace ~= StackPageTraced.
	thePage trace: StackPageTraced.
	_gsSqueakTemp_theSP := thePage headSP.
	_gsSqueakTemp_theFP := thePage headFP.
	"Skip the instruction pointer on top of stack of inactive pages."
	thePage = stackPage
		ifFalse: [_gsSqueakTemp_theSP := _gsSqueakTemp_theSP + objectMemory wordSize].
	[_gsSqueakTemp_frameRcvrOffset := self frameReceiverLocation: _gsSqueakTemp_theFP.
	[_gsSqueakTemp_theSP <= _gsSqueakTemp_frameRcvrOffset]
		whileTrue: [_gsSqueakTemp_oop := stackPages longAt: _gsSqueakTemp_theSP.
			(objectMemory isOopForwarded: _gsSqueakTemp_oop)
				ifTrue: [_gsSqueakTemp_oop := objectMemory followForwarded: _gsSqueakTemp_oop.
					stackPages longAt: _gsSqueakTemp_theSP put: _gsSqueakTemp_oop].
			(objectMemory isImmediate: _gsSqueakTemp_oop)
				ifFalse: [objectMemory markAndTrace: _gsSqueakTemp_oop].
			_gsSqueakTemp_theSP := _gsSqueakTemp_theSP + objectMemory wordSize].
	(self frameHasContext: _gsSqueakTemp_theFP)
		ifTrue: [self
				assert: (objectMemory
						isContext: (self frameContext: _gsSqueakTemp_theFP)).
			objectMemory
				markAndTrace: (self frameContext: _gsSqueakTemp_theFP)].
	objectMemory
		markAndTrace: (self iframeMethod: _gsSqueakTemp_theFP).
	(_gsSqueakTemp_callerFP := self frameCallerFP: _gsSqueakTemp_theFP) ~= 0]
		whileTrue: [_gsSqueakTemp_theSP := _gsSqueakTemp_theFP + FoxCallerSavedIP + objectMemory wordSize.
			_gsSqueakTemp_theFP := _gsSqueakTemp_callerFP].
	_gsSqueakTemp_theSP := _gsSqueakTemp_theFP + FoxCallerSavedIP.
	"caller ip is frameCallerContext in a base frame"
	[_gsSqueakTemp_theSP <= thePage baseAddress]
		whileTrue: [_gsSqueakTemp_oop := stackPages longAt: _gsSqueakTemp_theSP.
			(objectMemory isOopForwarded: _gsSqueakTemp_oop)
				ifTrue: [_gsSqueakTemp_oop := objectMemory followForwarded: _gsSqueakTemp_oop.
					stackPages longAt: _gsSqueakTemp_theSP put: _gsSqueakTemp_oop].
			(objectMemory isImmediate: _gsSqueakTemp_oop)
				ifFalse: [objectMemory markAndTrace: _gsSqueakTemp_oop].
			_gsSqueakTemp_theSP := _gsSqueakTemp_theSP + objectMemory wordSize]