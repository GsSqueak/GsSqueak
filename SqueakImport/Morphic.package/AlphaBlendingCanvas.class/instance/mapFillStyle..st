private
mapFillStyle: aFillStyle

	^ self alpha = 1.0
		ifTrue: [aFillStyle]
		ifFalse: [super mapFillStyle: aFillStyle]
