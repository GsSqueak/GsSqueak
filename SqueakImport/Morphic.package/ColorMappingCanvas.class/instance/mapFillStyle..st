private
mapFillStyle: aFillStyle

	^ aFillStyle isGradientFill
		ifFalse: [self mapColor: aFillStyle asColor]
		ifTrue: [aFillStyle copy colorRamp: (aFillStyle colorRamp collect: [:assoc | assoc key -> (self mapColor: assoc value)])].
