other
translateBy: delta clippingTo: aRectangle during: aBlock
	"Set a translation and clipping rectangle only during the execution of aBlock."
	| tempCanvas |
	tempCanvas := self copyOffset: delta clipRect: aRectangle.
	aBlock value: tempCanvas.
	foundMorph := tempCanvas foundMorph.