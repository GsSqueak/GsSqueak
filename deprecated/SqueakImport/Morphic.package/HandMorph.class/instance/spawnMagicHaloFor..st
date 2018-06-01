halo handling
spawnMagicHaloFor: aMorph
	
	self halo ifNotNil: [ :halo |
		halo target == aMorph ifTrue:[ ^self ] ].
	aMorph addMagicHaloFor: self.