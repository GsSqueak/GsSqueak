drawing
drawOn: aCanvas
	aCanvas depth = 1 ifTrue: [aCanvas fillRectangle: self bounds color: Color white].
	Display depth = originalForm depth ifFalse: [self buildChartForm].
	super drawOn: aCanvas