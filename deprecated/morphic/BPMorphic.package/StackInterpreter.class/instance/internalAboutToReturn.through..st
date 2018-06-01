return bytecodes
internalAboutToReturn: resultOop through: aContext 
	| _gsSqueakTemp_ourContext |
	_gsSqueakTemp_ourContext := self ensureFrameIsMarried: localFP SP: localSP.
	self internalPush: _gsSqueakTemp_ourContext.
	self internalPush: resultOop.
	self internalPush: aContext.
	messageSelector := objectMemory splObj: SelectorAboutToReturn.
	argumentCount := 2.
	^ self normalSend