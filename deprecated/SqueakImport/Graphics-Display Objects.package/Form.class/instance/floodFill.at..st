filling
floodFill: aColor at: interiorPoint
	Preferences areaFillsAreVeryTolerant ifTrue:
		[^ self floodFill: aColor at: interiorPoint tolerance: 0.2].
	Preferences areaFillsAreTolerant ifTrue:
		[^ self floodFill: aColor at: interiorPoint tolerance: 0.1].
	^ self floodFill: aColor at: interiorPoint tolerance: 0
