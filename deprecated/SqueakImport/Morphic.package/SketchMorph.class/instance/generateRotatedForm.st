drawing
generateRotatedForm
	"Compute my rotatedForm and offsetWhenRotated."

	| scalePt smoothPix pair |
	scalePoint ifNil: [scalePoint := 1 @ 1].
	scalePt := scalePoint x abs @ scalePoint y abs.
	rotationStyle == #none ifTrue: [scalePt := 1 @ 1].
	smoothPix := (scalePt x < 1.0 or: [scalePt y < 1.0]) 
		ifTrue: [2]
		ifFalse: [1].
	rotationStyle = #leftRight 
		ifTrue: 
			[self heading asSmallAngleDegrees < 0.0 
				ifTrue: [scalePt := scalePt x negated @ scalePt y]].
	rotationStyle = #upDown 
		ifTrue: 
			[self heading asSmallAngleDegrees abs > 90.0 
				ifTrue: [scalePt := scalePt x @ scalePt y negated]].
	rotatedForm := scalePt = (1 @ 1) 
				ifTrue: [originalForm]
				ifFalse: 
					["ar 11/19/2001: I am uncertain what happens in the case of rotationStyle ~~ normal"

					(rotationStyle == #normal and: [self useInterpolation]) 
						ifTrue: [^self generateInterpolatedForm].
					pair := WarpBlt 
								rotate: originalForm
								degrees: 0
								center: originalForm boundingBox center
								scaleBy: scalePt
								smoothing: smoothPix.
					pair first]