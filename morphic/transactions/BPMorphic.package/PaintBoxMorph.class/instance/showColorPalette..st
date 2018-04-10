actions
showColorPalette: evt 
	| _gsSqueakTemp_w _gsSqueakTemp_box |
	self comeToFront.
	colorMemory align: colorMemory bounds topRight with: colorMemoryThin bounds topRight.
	"make sure color memory fits or else align with left"
	_gsSqueakTemp_w := self world.
	_gsSqueakTemp_box := self bounds: colorMemory fullBounds in: _gsSqueakTemp_w.
	_gsSqueakTemp_box left < 0
		ifTrue: [colorMemory align: colorMemory bounds topLeft with: colorMemoryThin bounds topLeft].
	self addMorphFront: colorMemory