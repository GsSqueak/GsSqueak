initialize-release
needsFrameSize: t1 
	| t2 t3 |
	t2 := 131072.
	self numTemps + t1 > LargeFrame
		ifTrue: [^ self error: 'Cannot compile -- stack including temps is too deep'].
	t3 := self objectAt: 1.
	(t3 bitAnd: t2)
			~= 0
		ifTrue: [t3 := t3 - t2].
	self objectAt: 1 put: t3
			+ (self numTemps + t1 > SmallFrame
					ifTrue: [t2]
					ifFalse: [0])