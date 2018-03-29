return bytecodes
internalCannotReturn: resultOop 
	| _gsSqueakTemp_ourContext |
	_gsSqueakTemp_ourContext := self ensureFrameIsMarried: localFP SP: localSP.
	self internalPush: _gsSqueakTemp_ourContext.
	self internalPush: resultOop.
	messageSelector := objectMemory splObj: SelectorCannotReturn.
	argumentCount := 1.
	^ self normalSend