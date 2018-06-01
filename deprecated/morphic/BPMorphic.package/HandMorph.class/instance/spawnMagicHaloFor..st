halo handling
spawnMagicHaloFor: aMorph 
	(self halo notNil
			and: [self halo target == aMorph])
		ifTrue: [^ self].
	aMorph addMagicHaloFor: self