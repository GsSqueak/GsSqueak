preferences
scrollBarsWithoutArrowButtons: aBoolean 
	ScrollBarsWithoutArrowButtons = aBoolean
		ifTrue: [^ self].
	ScrollBarsWithoutArrowButtons := aBoolean.
	self refreshAllScrollBars