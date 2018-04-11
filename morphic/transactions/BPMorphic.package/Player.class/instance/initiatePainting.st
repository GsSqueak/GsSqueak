scripts-standard
initiatePainting
	(self costume isKindOf: PasteUpMorph)
		ifTrue: [self costume makeNewDrawingWithin]