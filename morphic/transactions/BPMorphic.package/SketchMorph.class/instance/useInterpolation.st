accessing
useInterpolation
	^ (self
			valueOfProperty: #useInterpolation
			ifAbsent: [false])
		and: [Smalltalk includesKey: #B3DRenderEngine]