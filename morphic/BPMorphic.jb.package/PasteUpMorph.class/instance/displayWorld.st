world state
displayWorld
	(self
			valueOfProperty: #shouldDisplayWorld
			ifAbsent: [true])
		ifTrue: [worldState displayWorld: self submorphs: submorphs]