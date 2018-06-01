initialization
initializeFor: aSketchMorph inBounds: boundsToUse pasteUpMorph: aPasteUpMorph
	"Initialize the receiver to edit the given sketchMorph in the given bounds, with the resulting object to reside in the given pasteUpMorph."

	| aPaintBox newPaintBoxBounds worldBounds requiredWidth newOrigin aPosition aPal aTab paintBoxFullBounds |
	(aTab := self world paintingFlapTab) ifNotNil:
		[aTab showFlap.
		^ self initializeFor: aSketchMorph inBounds: boundsToUse pasteUpMorph: aPasteUpMorph paintBoxPosition: nil].

	self setProperty: #recipientPasteUp toValue: aPasteUpMorph.
	aPaintBox := self world paintBox.
	worldBounds := self world bounds.
	requiredWidth := aPaintBox width.

	aPosition := (aPal := aPasteUpMorph standardPalette)
		ifNotNil:
			[aPal showNoPalette.
			aPal topRight + (aPaintBox width negated @ 0 "aPal tabsMorph height")]
		ifNil:
			[boundsToUse topRight].

	newOrigin := ((aPosition x  + requiredWidth <= worldBounds right) or: [Preferences unlimitedPaintArea])
			ifTrue:  "will fit to right of aPasteUpMorph"
				[aPosition]
			ifFalse:  "won't fit to right, try left"
				[boundsToUse topLeft - (requiredWidth @ 0)].
	paintBoxFullBounds := aPaintBox maxBounds.
	paintBoxFullBounds := (newOrigin - aPaintBox offsetFromMaxBounds) extent: 
					paintBoxFullBounds extent.
	newPaintBoxBounds := paintBoxFullBounds translatedToBeWithin: worldBounds.
	

	self initializeFor: aSketchMorph inBounds: boundsToUse 
		pasteUpMorph: aPasteUpMorph 
		paintBoxPosition: newPaintBoxBounds origin + aPaintBox offsetFromMaxBounds.
