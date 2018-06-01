drawing
generateRotatedForm
	"Compute my rotatedForm and offsetWhenRotated."
	| _gsSqueakTemp_scalePt _gsSqueakTemp_smoothPix _gsSqueakTemp_pair |
	scalePoint
		ifNil: [scalePoint := 1 @ 1].
	_gsSqueakTemp_scalePt := scalePoint x abs @ scalePoint y abs.
	rotationStyle == #none
		ifTrue: [_gsSqueakTemp_scalePt := 1 @ 1].
	_gsSqueakTemp_smoothPix := (_gsSqueakTemp_scalePt x < 1.0
					or: [_gsSqueakTemp_scalePt y < 1.0])
				ifTrue: [2]
				ifFalse: [1].
	rotationStyle = #leftRight
		ifTrue: [self heading asSmallAngleDegrees < 0.0
				ifTrue: [_gsSqueakTemp_scalePt := _gsSqueakTemp_scalePt x negated @ _gsSqueakTemp_scalePt y]].
	rotationStyle = #upDown
		ifTrue: [self heading asSmallAngleDegrees abs > 90.0
				ifTrue: [_gsSqueakTemp_scalePt := _gsSqueakTemp_scalePt x @ _gsSqueakTemp_scalePt y negated]].
	rotatedForm := _gsSqueakTemp_scalePt = (1 @ 1)
				ifTrue: [originalForm]
				ifFalse: ["ar 11/19/2001: I am uncertain what happens in the
					case of rotationStyle ~~ normal"
					(rotationStyle == #normal
							and: [self useInterpolation])
						ifTrue: [^ self generateInterpolatedForm].
					_gsSqueakTemp_pair := WarpBlt
								rotate: originalForm
								degrees: 0
								center: originalForm boundingBox center
								scaleBy: _gsSqueakTemp_scalePt
								smoothing: _gsSqueakTemp_smoothPix.
					_gsSqueakTemp_pair first]