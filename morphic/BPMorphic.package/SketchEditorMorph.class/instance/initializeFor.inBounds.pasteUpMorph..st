initialization
initializeFor: aSketchMorph inBounds: boundsToUse pasteUpMorph: aPasteUpMorph 
	"Initialize the receiver to edit the given sketchMorph in the given
	bounds, with the resulting object to reside in the given
	pasteUpMorph. "
	| _gsSqueakTemp_aPaintBox _gsSqueakTemp_newPaintBoxBounds _gsSqueakTemp_worldBounds _gsSqueakTemp_requiredWidth _gsSqueakTemp_newOrigin _gsSqueakTemp_aPosition _gsSqueakTemp_paintBoxFullBounds |
	self world paintingFlapTab
		ifNotNil: [:_gsSqueakTemp_aTab | 
			_gsSqueakTemp_aTab showFlap.
			^ self
				initializeFor: aSketchMorph
				inBounds: boundsToUse
				pasteUpMorph: aPasteUpMorph
				paintBoxPosition: nil].
	self setProperty: #recipientPasteUp toValue: aPasteUpMorph.
	_gsSqueakTemp_aPaintBox := self world paintBox.
	_gsSqueakTemp_worldBounds := self world bounds.
	_gsSqueakTemp_requiredWidth := _gsSqueakTemp_aPaintBox width.
	_gsSqueakTemp_aPosition := aPasteUpMorph standardPalette
				ifNil: [boundsToUse topRight]
				ifNotNil: [:_gsSqueakTemp_aPal | 
					_gsSqueakTemp_aPal showNoPalette.
					_gsSqueakTemp_aPal topRight + (_gsSqueakTemp_aPaintBox width negated @ 0)
					"aPal tabsMorph height"].
	_gsSqueakTemp_newOrigin := (_gsSqueakTemp_aPosition x + _gsSqueakTemp_requiredWidth <= _gsSqueakTemp_worldBounds right
					or: [Preferences unlimitedPaintArea])
				ifTrue: ["will fit to right of aPasteUpMorph"
					_gsSqueakTemp_aPosition]
				ifFalse: ["won't fit to right, try left"
					boundsToUse topLeft - (_gsSqueakTemp_requiredWidth @ 0)].
	_gsSqueakTemp_paintBoxFullBounds := _gsSqueakTemp_aPaintBox maxBounds.
	_gsSqueakTemp_paintBoxFullBounds := _gsSqueakTemp_newOrigin - _gsSqueakTemp_aPaintBox offsetFromMaxBounds extent: _gsSqueakTemp_paintBoxFullBounds extent.
	_gsSqueakTemp_newPaintBoxBounds := _gsSqueakTemp_paintBoxFullBounds translatedToBeWithin: _gsSqueakTemp_worldBounds.
	self
		initializeFor: aSketchMorph
		inBounds: boundsToUse
		pasteUpMorph: aPasteUpMorph
		paintBoxPosition: _gsSqueakTemp_newPaintBoxBounds origin + _gsSqueakTemp_aPaintBox offsetFromMaxBounds