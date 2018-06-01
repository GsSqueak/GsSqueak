drawing
drawOn: aCanvas 
	"Draw the receiver on a canvas"
	| _gsSqueakTemp_fauxBounds |
	self setDefaultContentsIfNil.
	super drawOn: aCanvas.
	"Border and background if any"
	false
		ifTrue: [self debugDrawLineRectsOn: aCanvas].
	"show line rects for debugging"
	self startingIndex > text size
		ifTrue: [self drawNullTextOn: aCanvas].
	"Hack here: The canvas expects bounds to carry the location of the
	text, but we also need to communicate clipping."
	_gsSqueakTemp_fauxBounds := self bounds topLeft corner: self innerBounds bottomRight.
	aCanvas
		paragraph: self paragraph
		bounds: _gsSqueakTemp_fauxBounds
		color: color