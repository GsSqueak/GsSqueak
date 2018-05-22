initialization
buildChartForm
	| chartForm |
	chartForm := ColorChart deepCopy asFormOfDepth: Display depth.
	chartForm fill: ((TransparentBox left + 9)@0 extent: 1@9) fillColor: Color lightGray.
	chartForm fill: ((TransparentBox right - 10)@0 extent: 1@9) fillColor: Color lightGray.
	TransText displayOn: chartForm at: 62@0.
	Display depth = 32 ifTrue:
		["Set opaque bits for 32-bit display"
		chartForm fill: chartForm boundingBox rule: Form under
				fillColor: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 1.0)].
	chartForm borderWidth: 1.
	self form: chartForm.
	selectedColor ifNotNil: [self updateAlpha: selectedColor alpha].
	self updateSelectorDisplay.

