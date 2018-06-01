actions
showColorPalette: evt

	| w box |
	self comeToFront.
	colorMemory align: colorMemory bounds topRight 
			with: colorMemoryThin bounds topRight.
	"make sure color memory fits or else align with left"
	w := self world.
	box := self bounds: colorMemory fullBounds in: w.
	box left < 0 ifTrue:[
		colorMemory align: colorMemory bounds topLeft
			with: colorMemoryThin bounds topLeft].
	self addMorphFront: colorMemory.
	self changed