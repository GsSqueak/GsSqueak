running
getUserResponseAtHand: aHand 
	self message
		ifEmpty: [messageMorph delete].
	"Do not waste space."
	self paneMorph submorphs
		ifEmpty: [self paneMorph delete].
	"Do not waste space."
	self moveSelectedButtonToHand: aHand.
	^ self getUserResponse