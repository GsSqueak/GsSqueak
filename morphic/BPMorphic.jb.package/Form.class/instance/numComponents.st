postscript generation
numComponents
	^ self depth <= 8
		ifTrue: [1]
		ifFalse: [3]