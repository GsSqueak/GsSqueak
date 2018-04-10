preferences
gradientWindow: aBoolean 
	aBoolean = GradientWindow
		ifTrue: [^ self].
	GradientWindow := aBoolean.
	self refreshAllWindows