isolation layers
invokePhase2

	revertable ifFalse: [^ self].

	"Do the second part of the revert operation.  This must be very simple."
	"Replace original method dicts if there are method changes."
	self realClass methodDictionary: thisMD.  "zap.  Must flush Cache in outer loop."
	inForce := true.
