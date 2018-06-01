private
fill: fillColor andStroke: strokeColor
	self preserveStateDuring: [:inner | inner fill: fillColor];
		stroke: strokeColor.
