preferences
gradientDialog: aBoolean

	aBoolean = GradientDialog ifTrue: [^ self].
	GradientDialog := aBoolean.
	self refreshAllDialogs.