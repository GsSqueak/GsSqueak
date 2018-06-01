drawing
drawOn: aCanvas

	| foregroundColor backgroundColor thickness hThickness vThickness hOffset vOffset |
	foregroundColor := highlighted ifTrue: [Color white] ifFalse: [color].
	backgroundColor := color muchDarker.
	hThickness := self height * 0.1.
	vThickness := self width * 0.1.
	thickness := hThickness min: vThickness.
	vOffset := ((hThickness - thickness) // 2) max: 0.
	hOffset := ((vThickness - thickness) // 2) max: 0.
	aCanvas fillRectangle: self bounds color: backgroundColor.
	"added to show the minus sign"
	(digit asString = '-') ifTrue: [digit := 10].
	HSegmentOrigins with: (HSegments at: digit+1) do:
		[:o :isLit |
		aCanvas
			fillRectangle: (Rectangle
				origin: (self position + (0@vOffset) + (o * self extent)) rounded
				extent: ((self width * 0.6) @ thickness) rounded)
			color: (isLit ifTrue: [foregroundColor] ifFalse: [backgroundColor])].
	VSegmentOrigins with: (VSegments at: digit+1) do:
		[:o :isLit |
		aCanvas
			fillRectangle: (Rectangle
				origin: (self position + (hOffset@0) + (o * self extent)) rounded
				extent: (thickness @ (self height * 0.25)) rounded)
			color: (isLit ifTrue: [foregroundColor] ifFalse: [backgroundColor])].
