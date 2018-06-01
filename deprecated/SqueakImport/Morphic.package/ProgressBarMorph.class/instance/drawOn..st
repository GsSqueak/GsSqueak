drawing
drawOn: aCanvas
	| width inner |
	super drawOn: aCanvas.
	inner := self innerBounds.
	width := (inner width * lastValue) truncated min: inner width.
	aCanvas fillRectangle: (inner origin extent: width @ inner height) color: progressColor.