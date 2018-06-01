geometry
extent: p 
	(bounds extent closeTo: p)
		ifTrue: [^ self].
	p x > p y
		ifTrue: [super
				extent: (p max: 8 @ 4)]
		ifFalse: [super
				extent: (p max: 4 @ 8)].
	self updateSliderColor