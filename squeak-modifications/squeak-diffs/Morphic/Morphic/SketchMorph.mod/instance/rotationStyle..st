e-toy support
rotationStyle: aSymbol
	"Set my rotation style to #normal, #leftRight, #upDown, or #none. Styles mean:
		#normal		-- continuous 360 degree rotation
		#leftRight		-- quantize angle to left or right facing
		#upDown		-- quantize angle to up or down facing
		#none			-- do not rotate
	Because my rendering code flips the form (see generateRotatedForm) we 'pre-flip' it here to preserve the same visual appearance.
	"

	| wasFlippedX wasFlippedY isFlippedX isFlippedY |
	wasFlippedX := rotationStyle == #leftRight
		and: [ self heading asSmallAngleDegrees < 0.0 ].
	wasFlippedY := rotationStyle == #upDown
		and: [ self heading asSmallAngleDegrees abs > 90.0 ].

	rotationStyle := aSymbol.

	isFlippedX := rotationStyle == #leftRight
		and: [ self heading asSmallAngleDegrees < 0.0 ].
	isFlippedY := rotationStyle == #upDown
		and: [ self heading asSmallAngleDegrees abs > 90.0 ].

	wasFlippedX == isFlippedX
		ifFalse: [self form: (self form flipBy: #horizontal centerAt: self form center)].
	wasFlippedY == isFlippedY
		ifFalse: [self form: (self form flipBy: #vertical centerAt: self form center)].

	self layoutChanged.
