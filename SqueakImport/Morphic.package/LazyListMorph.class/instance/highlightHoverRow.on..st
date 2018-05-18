drawing
highlightHoverRow: row on: aCanvas
	| drawBounds  |
	drawBounds := self drawBoundsForRow: row.
	drawBounds := drawBounds intersect: self bounds.
	aCanvas fillRectangle: drawBounds color: self hoverColor.