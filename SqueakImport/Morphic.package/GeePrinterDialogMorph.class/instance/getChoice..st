as yet unclassified
getChoice: aSymbol

	aSymbol == #landscapeFlag ifTrue: [^printSpecs landscapeFlag].
	aSymbol == #drawAsBitmapFlag ifTrue: [^printSpecs drawAsBitmapFlag].
	aSymbol == #scaleToFitPage ifTrue: [^printSpecs scaleToFitPage].
