drawing
drawOn: aCanvas
	"The tiling is solely determined by bounds, subBounds and offset.
	The extent of display is determined by bounds and the clipRect of the canvas."
	| start d subBnds |
	submorphs isEmpty ifTrue: [^ super drawOn: aCanvas].
	subBnds := self subBounds.
	running ifFalse:
		[super drawOn: aCanvas.
		^ aCanvas fillRectangle: subBnds color: Color lightBlue].
	start := subBnds topLeft + offset - bounds topLeft - (1@1) \\ subBnds extent - subBnds extent + (1@1).
	d := subBnds topLeft - bounds topLeft.
"Sensor redButtonPressed ifTrue: [self halt]."
	start x to: bounds width - 1 by: subBnds width do:
		[:x |
		start y to: bounds height - 1 by: subBnds height do:
			[:y | aCanvas translateBy: (x@y) - d clippingTo: bounds
				during:[:tileCanvas| self drawSubmorphsOn: tileCanvas]]].