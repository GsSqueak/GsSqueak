menu
opacityString
	^ (self isOpaque
		ifTrue: ['<on>']
		ifFalse: ['<off>']), 'opaque' translated