misc
innocuousName
	^ (self isFlap)
		ifTrue:
			['flap' translated]
		ifFalse:
			[super innocuousName]