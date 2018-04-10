initialization
initializeFor: aSketchMorph inBounds: boundsToUse pasteUpMorph: aPasteUpMorph paintBoxPosition: aPosition 
	"NB: if aPosition is nil, then it's assumed that the paintbox is obtained
	from a flap or some such, so do nothing special regarding a palette in
	this case. The palette needs already to be in the world for this to
	work. "
	| _gsSqueakTemp_w |
	(_gsSqueakTemp_w := aPasteUpMorph world) addMorphInLayer: self.
	"in back of palette"
	enclosingPasteUpMorph := aPasteUpMorph.
	hostView := aSketchMorph.
	"may be ownerless"
	self bounds: boundsToUse.
	palette := _gsSqueakTemp_w paintBox focusMorph: self.
	palette beStatic.
	"give Nebraska whatever help we can"
	palette addWeakDependent: self.
	aPosition
		ifNotNil: [_gsSqueakTemp_w addMorphFront: palette.
			"bring to front"
			palette position: aPosition].
	paintingForm := Form extent: bounds extent depth: _gsSqueakTemp_w assuredCanvas depth.
	self dimTheWindow.
	self addRotationScaleHandles.
	aSketchMorph
		ifNotNil: [aSketchMorph form
				displayOn: paintingForm
				at: hostView boundsInWorld origin - bounds origin - hostView form offset
				clippingBox: (0 @ 0 extent: paintingForm extent)
				rule: Form over
				fillColor: nil.
			undoBuffer := paintingForm deepCopy.
			rotationCenter := aSketchMorph rotationCenter]