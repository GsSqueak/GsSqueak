preferences
scrollBarsWithoutMenuButton: aBoolean 
	ScrollBarsWithoutMenuButton = aBoolean
		ifTrue: [^ self].
	ScrollBarsWithoutMenuButton := aBoolean.
	self refreshAllScrollBars