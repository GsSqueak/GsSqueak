as yet unclassified
toggleChoice: aSymbol

	aSymbol == #landscapeFlag ifTrue: [
		printSpecs landscapeFlag: printSpecs landscapeFlag not
	].
	aSymbol == #drawAsBitmapFlag ifTrue: [
		printSpecs drawAsBitmapFlag: printSpecs drawAsBitmapFlag not
	].
	aSymbol == #scaleToFitPage ifTrue: [
		printSpecs scaleToFitPage: printSpecs scaleToFitPage not
	].
