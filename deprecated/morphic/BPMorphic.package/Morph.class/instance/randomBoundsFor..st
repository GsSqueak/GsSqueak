WiW support
randomBoundsFor: aMorph 
	| trialRect |
	trialRect := self topLeft + ((self width * (15 + 75 atRandom / 100)) rounded @ (self height * (15 + 75 atRandom / 100)) rounded) extent: aMorph extent.
	^ trialRect
		translateBy: (trialRect amountToTranslateWithin: self bounds)