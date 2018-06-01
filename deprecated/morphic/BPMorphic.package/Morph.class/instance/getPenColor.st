-Etoys
getPenColor
	^ self player
		ifNil: [Color green]
		ifNotNil: [self actorState getPenColor]