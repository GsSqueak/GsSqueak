as yet unclassified
scaleImageBy: pixels

	| scalePerPixel steps transform factor |

	transform := self myTransformMorph.
	(steps := (pixels * self getZoomFactor * 0.2) rounded) = 0 ifTrue: [^self].
	scalePerPixel := 1.01.
	factor := scalePerPixel raisedTo: steps abs.
	steps > 0 ifTrue: [
		factor := 1.0 / factor.
	].
	self changeScaleTo: (transform scale * factor min: 10.0 max: 0.1).
