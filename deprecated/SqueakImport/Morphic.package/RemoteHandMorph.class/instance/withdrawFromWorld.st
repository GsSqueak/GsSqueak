other
withdrawFromWorld
	"Close the socket, if any, and remove this hand from the world."
	| addr |
	addr := self remoteHostAddress.
	addr = 0 ifFalse: [self stopTransmittingEvents].
	self stopListening.
	Transcript show: 'Remote hand ', self userInitials, ' closed'; cr.
	owner ifNotNil: [owner removeHand: self].
