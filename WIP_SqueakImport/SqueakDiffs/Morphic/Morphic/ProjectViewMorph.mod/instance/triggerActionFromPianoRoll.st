*Morphic-Sound-piano rolls
triggerActionFromPianoRoll

	WorldState addDeferredUIMessage: [
		project world setProperty: #letTheMusicPlay toValue: true.
		self enter.
	]