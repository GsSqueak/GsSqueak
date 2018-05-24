private
updateAlpha: alpha
	| sliderRect |
	sliderRect := (TransparentBox left + 10)@1 corner: (TransparentBox right - 9)@9.
	originalForm fill: (sliderRect withRight: sliderRect left + (alpha*sliderRect width))
				fillColor: Color lightGray.
	originalForm fillWhite: (sliderRect withLeft: sliderRect left + (alpha*sliderRect width)).
	originalForm fill: ((TransparentBox right - 9)@1 extent: 8@8)
				fillColor: (alpha < 1.0 ifTrue: [Color white] ifFalse: [Color lightGray]).
	TransText displayOn: originalForm at: 62@1 rule: Form paint.
