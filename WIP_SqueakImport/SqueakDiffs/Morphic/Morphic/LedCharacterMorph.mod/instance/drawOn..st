drawing
drawOn: aCanvas 
	| foregroundColor backgroundColor thickness hThickness vThickness hOffset vOffset i |
	i := 0.
	foregroundColor := highlighted
				ifTrue: [Color white]
				ifFalse: [color].
	backgroundColor := color darker darker darker.
	hThickness := self height * 0.1.
	vThickness := self width * 0.1.
	thickness := hThickness min: vThickness.
	vOffset := hThickness - thickness // 2 max: 0.
	hOffset := vThickness - thickness // 2 max: 0.
	aCanvas fillRectangle: self bounds color: backgroundColor.
	CHSegmentOrigins with: (CHSegments at: char + 1)
		do: [:o :isLit | aCanvas fillRectangle: (Rectangle origin: (self position + (0 @ vOffset) + (o * self extent)) rounded extent: (self width * 0.6 @ thickness) rounded)
				color: (isLit
						ifTrue: [foregroundColor]
						ifFalse: [backgroundColor])].
	CVSegmentOrigins with: (CVSegments at: char + 1)
		do: [:o :isLit | aCanvas fillRectangle: (Rectangle origin: (self position + (hOffset @ 0) + (o * self extent)) rounded extent: (thickness @ (self height * 0.25)) rounded)
				color: (isLit
						ifTrue: [foregroundColor]
						ifFalse: [backgroundColor])].
	TSegments with: (DSegments at: char + 1)
		do: 
			[:tOrigin :isLit | | bOrigin | 
			i := i + 1.
			bOrigin := BSegments at: i.
			aCanvas
				line: self position x - hOffset + (self width * tOrigin x) @ (self position y - vOffset + (self height * tOrigin y))
				to: self position x + hOffset + (self width * bOrigin x) @ (self position y + vOffset + (self height * bOrigin y))
				width: thickness + 1 // 1.25
				color: (isLit
						ifTrue: [foregroundColor]
						ifFalse: [Color transparent])]