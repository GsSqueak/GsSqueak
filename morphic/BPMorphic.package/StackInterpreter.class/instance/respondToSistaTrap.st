sista bytecodes
respondToSistaTrap
	| _gsSqueakTemp_ourContext |
	messageSelector := objectMemory splObj: SelectorSistaTrap.
	_gsSqueakTemp_ourContext := self ensureFrameIsMarried: localFP SP: localSP.
	self internalPush: _gsSqueakTemp_ourContext.
	argumentCount := 0.
	self normalSend