preferences
gradientScrollBar: aBoolean 
	GradientScrollBar = aBoolean
		ifTrue: [^ self].
	GradientScrollBar := aBoolean.
	ScrollBar
		allSubInstancesDo: [:ea | ea updateSliderColor]