initialize-release
setTarget: objectToHaveItsColorSet originalColor: aColor setColorSelector: colorSetterSymbol forPropertiesPanel: aBool 
	target := objectToHaveItsColorSet.
	setColorSelector := colorSetterSymbol.
	hsvaMorph selectedColor: aColor.
	aBool
		ifTrue: [self setupForProperties]
		ifFalse: [self setup]