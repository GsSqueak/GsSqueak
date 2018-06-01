A NewColorPickerMorph is a new widget for choosing colors in Morphic.  Instantiate a NewColorPickerMorph:

	(NewColorPickerMorph
		on: objectToHaveItsColorSet
		getColorSelector: itsColorGetterSymbol
		setColorSelector: itsColorSetterSymbol) openInWorld

