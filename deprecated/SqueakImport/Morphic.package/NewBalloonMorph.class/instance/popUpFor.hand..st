initialization
popUpFor: aMorph hand: aHand
	"Pop up the receiver as balloon help for the given hand. Ignore if the hand does not touch the morph."

	(aMorph boundsInWorld containsPoint: aHand position)
		ifFalse: [^ self "Ignore"].
		
	self balloonOwner: aMorph.
	self popUpForHand: aHand.