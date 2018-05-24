dropping/grabbing
justDroppedInto: targetMorph event: anEvent 
	"If only world wants this TransferMorph, treat it as unaccepted (see also >>delete)."
	super
		justDroppedInto: targetMorph
		event: anEvent.
	self animationForMoveSuccess: true.
	self delete