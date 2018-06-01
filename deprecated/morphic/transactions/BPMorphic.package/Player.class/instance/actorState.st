misc
actorState
	"Answer the receiver's actorState. If the receiver has no costume,
	answer nil, else answer the costume's current actor state, creating it
	at this time if necessary."
	^ self costume
		ifNotNil: [costume actorState]