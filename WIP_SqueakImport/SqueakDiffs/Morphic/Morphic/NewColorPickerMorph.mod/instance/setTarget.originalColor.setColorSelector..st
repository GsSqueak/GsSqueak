initialize-release
setTarget: objectToHaveItsColorSet originalColor: aColor setColorSelector: colorSetterSymbol 
	target := objectToHaveItsColorSet.
	setColorSelector := colorSetterSymbol.
	hsvaMorph selectedColor: aColor.
	self setup