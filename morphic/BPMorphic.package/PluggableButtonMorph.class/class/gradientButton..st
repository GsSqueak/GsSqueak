preferences
gradientButton: aBoolean 
	GradientButton = aBoolean
		ifTrue: [^ self].
	GradientButton := aBoolean.
	PluggableButtonMorph
		allSubInstancesDo: [:ea | ea updateFillStyle]