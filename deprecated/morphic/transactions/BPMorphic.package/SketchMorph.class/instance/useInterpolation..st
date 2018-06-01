accessing
useInterpolation: aBool 
	(aBool == true
			and: [Smalltalk includesKey: #B3DRenderEngine])
		ifTrue: [self setProperty: #useInterpolation toValue: aBool]
		ifFalse: [self removeProperty: #useInterpolation].
	self layoutChanged