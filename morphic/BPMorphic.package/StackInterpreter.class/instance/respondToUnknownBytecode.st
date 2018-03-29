miscellaneous bytecodes
respondToUnknownBytecode
	"If an error selector is available then send it to the activeContext,
	otherwise abort."
	| _gsSqueakTemp_ourContext |
	messageSelector := objectMemory maybeSplObj: SelectorUnknownBytecode.
	(messageSelector isNil
			or: [messageSelector = objectMemory nilObject])
		ifTrue: [self error: 'Unknown bytecode'].
	_gsSqueakTemp_ourContext := self ensureFrameIsMarried: localFP SP: localSP.
	"undo fetch of bytecode so that context's pc is pointing to the
	unknown bytecode."
	localIP := localIP - 1.
	self internalPush: _gsSqueakTemp_ourContext.
	argumentCount := 0.
	self normalSend