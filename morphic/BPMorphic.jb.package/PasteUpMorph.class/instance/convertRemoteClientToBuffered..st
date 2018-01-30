Nebraska
convertRemoteClientToBuffered: aClient 
	worldState removeRemoteCanvas: aClient canvas.
	aClient convertToBuffered.
	worldState addRemoteCanvas: aClient canvas.
	self changed