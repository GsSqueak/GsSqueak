compact
compactFlapString
	^ (self isFlapCompact
		ifTrue: ['<on>compact flap']
		ifFalse: ['<off>']), 'compact flap' translated