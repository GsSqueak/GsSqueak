drawing
drawStaffOn: aCanvas

	| blackKeyColor l r topEdge y |
	self drawMeasureLinesOn: aCanvas.

	blackKeyColor := Color gray: 0.5.
	l := self left + borderWidth.
	r := self right - borderWidth.
	topEdge := self top + borderWidth + 3.
	lowestNote to: 127 do: [:k |
		y := self yForMidiKey: k.
		y <= topEdge ifTrue: [^ self].  "over the top!"
		(self isBlackKey: k) ifTrue: [
			aCanvas
				fillRectangle: (l@y corner: r@(y + 1))
				color: blackKeyColor]].
