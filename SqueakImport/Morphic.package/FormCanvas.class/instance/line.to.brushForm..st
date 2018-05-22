drawing
line: pt1 to: pt2 brushForm: brush
	| offset |
	offset := origin.
	self setPaintColor: Color black.
	port sourceForm: brush; fillColor: nil;
		sourceRect: brush boundingBox;
		colorMap: (brush colormapIfNeededFor: form);
		drawFrom: (pt1 + offset) to: (pt2 + offset)