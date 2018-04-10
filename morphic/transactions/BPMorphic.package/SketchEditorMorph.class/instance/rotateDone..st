actions & preps
rotateDone: evt 
	"MouseUp, snap box back to center."
	"
	self render: rotationButton bounds.
	rotationButton position: (canvasRectangle width // 2 + composite x)
	@ rotationButton position y.
	self render: rotationButton bounds
	"
	"Not snap back..."
	^ self