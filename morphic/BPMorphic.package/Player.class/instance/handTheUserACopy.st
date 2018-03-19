slot getters/setters
handTheUserACopy
	"Called from the user-interface: hand the user a copy"
	^ costume currentHand attachMorph: self getNewClone costume