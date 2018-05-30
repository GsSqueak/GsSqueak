stepping and presenter
stepAt: nowTick 
	| delta |
	self isTicking 
		ifTrue: 
			[(lastTick isNil or: [nowTick < lastTick]) ifTrue: [lastTick := nowTick].
			delta := (nowTick - lastTick) // self stepTime.
			delta > 0 
				ifTrue: 
					[index := index + delta.
					lastTick := nowTick.
					self changed]]