isolation layers
revokePhase1

	revertable ifFalse: [^ self].
	inForce ifFalse: [self error: 'Can revoke only when in force.'].

	"Do the first part of the revoke operation.  This must be very simple."
	"Replace original method dict if there are method changes."
	self realClass methodDictionary: priorMD  "zap.  Must flush Cache in outer loop."