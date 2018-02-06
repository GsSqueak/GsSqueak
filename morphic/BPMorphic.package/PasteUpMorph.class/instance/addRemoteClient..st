Nebraska
addRemoteClient: aClient 
	self addHand: aClient hand.
	worldState addRemoteCanvas: aClient canvas.
	aClient canvas fullDrawMorph: self.
	self changed