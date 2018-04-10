-Etoys-support
handMeTilesToFire
	"Construct a phrase of tiles comprising a line of code that will 'fire' this
	object, and hand it to the user"
	ActiveHand
		attachMorph: (self assuredPlayer tilesToCall: MethodInterface firingInterface)