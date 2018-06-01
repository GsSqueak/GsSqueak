solid tabs
solidTabString
	^ (self isCurrentlySolid
		ifTrue: ['currently using solid tab' translated]
		ifFalse: ['use solid tab' translated]) 