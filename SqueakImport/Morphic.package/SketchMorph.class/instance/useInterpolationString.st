menu
useInterpolationString
	^ (self useInterpolation
		ifTrue: ['<yes>']
		ifFalse: ['<no>'])
		, 'smooth image' translated