initialization
initializeFor: aSketchMorph inBounds: boundsToUse pasteUpMorph: aPasteUpMorph paintBoxPosition: aPosition
	"NB: if aPosition is nil, then it's assumed that the paintbox is obtained from a flap or some such, so do nothing special regarding a palette in this case.  The palette needs already to be in the world for this to work."
	| w  |
	(w := aPasteUpMorph world) addMorphInLayer: self.	"in back of palette"
	enclosingPasteUpMorph := aPasteUpMorph.
	hostView := aSketchMorph.  "may be ownerless"
	self bounds: boundsToUse.
	palette := w paintBox focusMorph: self.
	palette beStatic.		"give Nebraska whatever help we can"
	palette addWeakDependent: self.
	aPosition ifNotNil:
		[w addMorphFront: palette.  "bring to front"
		palette position: aPosition].
	paintingForm := Form extent: bounds extent depth: w assuredCanvas depth.
	self dimTheWindow.
	self addRotationScaleHandles.
	aSketchMorph ifNotNil:
		[
		aSketchMorph form
			displayOn: paintingForm
			at: (hostView boundsInWorld origin - bounds origin - hostView form offset)
			clippingBox: (0@0 extent: paintingForm extent)
			rule: Form over
			fillColor: nil.  "assume they are the same depth".
			undoBuffer := paintingForm deepCopy.
		rotationCenter := aSketchMorph rotationCenter]