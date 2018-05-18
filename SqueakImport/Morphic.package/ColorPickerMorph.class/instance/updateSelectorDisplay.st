initialization
updateSelectorDisplay
	theSelectorDisplayMorph ifNil: [^self].
	theSelectorDisplayMorph position: self bottomLeft.
	theSelectorDisplayMorph firstSubmorph contents: selector asString , ' ' , selectedColor printString