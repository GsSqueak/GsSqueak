drawing
display: items atRow: row on: canvas 
	"display the specified item, which is on the specified row; for Multicolumn 
	lists, items will be a list of strings"
	| drawBounds |
	drawBounds :=  (self drawBoundsForRow: row) translateBy: (self hMargin @ 0).
	drawBounds := drawBounds intersect: self bounds.
	items
		with: (1 to: items size)
		do: [:item :index | 
			"move the bounds to the right at each step"
			index > 1
				ifTrue: [drawBounds := drawBounds left: drawBounds left + 6
									+ (columnWidths at: index - 1)].
			item isText
				ifTrue: [canvas
						drawString: item
						in: drawBounds
						font: (font
								emphasized: (item emphasisAt: 1))
						color: (self colorForRow: row)]
				ifFalse: [canvas
						drawString: item
						in: drawBounds
						font: font
						color: (self colorForRow: row)]]