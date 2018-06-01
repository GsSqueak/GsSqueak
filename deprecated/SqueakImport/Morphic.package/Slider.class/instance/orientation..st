accessing
orientation: aSymbol

	orientation == aSymbol ifTrue: [^ self].
	orientation := aSymbol.
	self updateSlider.