costume
hasCostumeThatIsAWorld
	self
		costumesDo: [:aCostume | aCostume isWorldMorph
				ifTrue: [^ true]].
	^ false