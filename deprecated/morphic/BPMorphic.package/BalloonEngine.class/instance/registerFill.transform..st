drawing
registerFill: aFillStyle transform: aTransform 
	aFillStyle
		ifNil: [^ 0].
	aFillStyle isSolidFill
		ifTrue: [^ aFillStyle scaledPixelValue32].
	aFillStyle isGradientFill
		ifTrue: [^ self
				primAddGradientFill: aFillStyle pixelRamp
				from: aFillStyle origin
				along: aFillStyle direction
				normal: aFillStyle normal
				radial: aFillStyle isRadialFill
				matrix: aTransform].
	^ 0