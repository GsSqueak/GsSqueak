stack bytecodes
extPushPseudoVariable
	"SistaV1:	*	82			01010010			Push thisContext, (then e.g. Extend B 1 = push
	thisProcess) "
	| _gsSqueakTemp_theThingToPush |
	extB caseOf: {
		[0] -> [_gsSqueakTemp_theThingToPush := self ensureFrameIsMarried: localFP SP: localSP].
		[1] -> [_gsSqueakTemp_theThingToPush := self activeProcess]}
		 otherwise: [self respondToUnknownBytecode].
	self fetchNextBytecode.
	self internalPush: _gsSqueakTemp_theThingToPush.
	extB := 0.
	numExtB := 0