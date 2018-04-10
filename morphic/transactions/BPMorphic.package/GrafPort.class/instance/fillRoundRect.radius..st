drawing support
fillRoundRect: aRectangle radius: radius 
	| nextY outer nextOuterX ovalDiameter rectExtent rectOffset rectX rectY rectWidth rectHeight ovalRadius ovalRect |
	aRectangle area <= 0
		ifTrue: [^ self].
	ovalDiameter := (radius * 2) asPoint min: aRectangle extent.
	(ovalDiameter x <= 0
			or: [ovalDiameter y <= 0])
		ifTrue: [^ self fillRect: aRectangle offset: 0 @ 0].
	"force diameter to be even - this simplifies lots of stuff"
	ovalRadius := ovalDiameter x // 2 @ (ovalDiameter y // 2).
	(ovalRadius x <= 0
			or: [ovalRadius y <= 0])
		ifTrue: [^ self fillRect: aRectangle offset: 0 @ 0].
	ovalDiameter := ovalRadius * 2.
	rectExtent := aRectangle extent - ovalDiameter.
	rectWidth := rectExtent x.
	rectHeight := rectExtent y.
	rectOffset := aRectangle origin + ovalRadius.
	rectX := rectOffset x.
	rectY := rectOffset y.
	ovalRect := ovalRadius negated extent: ovalDiameter.
	height := 1.
	outer := EllipseMidpointTracer new on: ovalRect.
	nextY := ovalRadius y.
	"upper and lower portions of round rect"
	[nextY > 0]
		whileTrue: [nextOuterX := outer stepInY.
			width := nextOuterX * 2 + rectWidth.
			destX := rectX - nextOuterX.
			destY := rectY - nextY.
			self copyBits.
			destY := rectY + nextY + rectHeight - 1.
			self copyBits.
			nextY := nextY - 1].
	destX := aRectangle left.
	destY := rectOffset y.
	height := rectHeight.
	width := aRectangle width.
	self copyBits