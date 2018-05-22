menu
nextSmoothingLevel
	smoothing = 1
		ifTrue: [smoothing := 2]
		ifFalse: [smoothing = 2
			ifTrue: [smoothing := 4]
			ifFalse: [smoothing = 4
				ifTrue: [smoothing := 1]]].
	self changed