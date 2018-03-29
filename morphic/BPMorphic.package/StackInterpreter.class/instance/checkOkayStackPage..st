debug support
checkOkayStackPage: thePage 
	| _gsSqueakTemp_theSP _gsSqueakTemp_theFP _gsSqueakTemp_ok _gsSqueakTemp_frameRcvrOffset _gsSqueakTemp_callerFP _gsSqueakTemp_oop |
	_gsSqueakTemp_theSP := thePage headSP.
	_gsSqueakTemp_theFP := thePage headFP.
	_gsSqueakTemp_ok := true.
	"Skip the instruction pointer on top of stack of inactive pages."
	thePage = stackPage
		ifFalse: [_gsSqueakTemp_theSP := _gsSqueakTemp_theSP + objectMemory wordSize].
	[_gsSqueakTemp_frameRcvrOffset := self frameReceiverLocation: _gsSqueakTemp_theFP.
	[_gsSqueakTemp_theSP <= _gsSqueakTemp_frameRcvrOffset]
		whileTrue: [_gsSqueakTemp_oop := stackPages longAt: _gsSqueakTemp_theSP.
			(objectMemory isIntegerObject: _gsSqueakTemp_oop)
				ifFalse: [_gsSqueakTemp_ok := _gsSqueakTemp_ok
								& (self checkOkayFields: _gsSqueakTemp_oop)].
			_gsSqueakTemp_theSP := _gsSqueakTemp_theSP + objectMemory wordSize].
	(self frameHasContext: _gsSqueakTemp_theFP)
		ifTrue: [self
				assert: (objectMemory
						isContext: (self frameContext: _gsSqueakTemp_theFP)).
			_gsSqueakTemp_ok := _gsSqueakTemp_ok
						& (self
								checkOkayFields: (self frameContext: _gsSqueakTemp_theFP))].
	_gsSqueakTemp_ok := _gsSqueakTemp_ok
				& (self
						checkOkayFields: (self frameMethodObject: _gsSqueakTemp_theFP)).
	(_gsSqueakTemp_callerFP := self frameCallerFP: _gsSqueakTemp_theFP) ~= 0]
		whileTrue: [_gsSqueakTemp_theSP := _gsSqueakTemp_theFP + FoxCallerSavedIP + objectMemory wordSize.
			_gsSqueakTemp_theFP := _gsSqueakTemp_callerFP].
	_gsSqueakTemp_theSP := self isCog
				ifTrue: [_gsSqueakTemp_theFP + FoxCallerSavedIP + objectMemory wordSize
					"caller ip is ceBaseReturnPC"]
				ifFalse: [_gsSqueakTemp_theFP + FoxCallerSavedIP].
	"caller ip is frameCallerContext in a base frame"
	[_gsSqueakTemp_theSP <= thePage baseAddress]
		whileTrue: [_gsSqueakTemp_oop := stackPages longAt: _gsSqueakTemp_theSP.
			(objectMemory isIntegerObject: _gsSqueakTemp_oop)
				ifFalse: [_gsSqueakTemp_ok := _gsSqueakTemp_ok
								& (self checkOkayFields: _gsSqueakTemp_oop)].
			_gsSqueakTemp_theSP := _gsSqueakTemp_theSP + objectMemory wordSize].
	^ _gsSqueakTemp_ok