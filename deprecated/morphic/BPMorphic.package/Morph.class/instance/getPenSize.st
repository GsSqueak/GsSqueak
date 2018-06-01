-Etoys
getPenSize
	self player
		ifNil: [^ 1].
	^ self actorState getPenSize