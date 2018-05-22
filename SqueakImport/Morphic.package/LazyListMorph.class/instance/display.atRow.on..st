drawing
display: item atRow: row on: canvas
	"display the given item at row row"

	| drawBounds emphasized rowColor itemAsText |
	itemAsText := item asStringOrText.
	
	"If it is a text, we will only use the first character's emphasis."
	emphasized := itemAsText isText 
		ifTrue: [font emphasized: (itemAsText emphasisAt: 1)] 
		ifFalse: [font].
	
	rowColor := itemAsText isText
		ifTrue: [itemAsText colorAt: 1 ifNone: [self colorForRow: row]]
		ifFalse: [self colorForRow: row].
	
	drawBounds := (self drawBoundsForRow: row) translateBy: (self hMargin @ 0).
	drawBounds := drawBounds intersect: self bounds.

	"Draw icon if existing. Adjust draw bounds in that case."
	(self icon: row) ifNotNil: [ :icon || top |
		top := drawBounds top + ((drawBounds height - icon height) // 2).
		canvas translucentImage: icon at: drawBounds left @ top.
		drawBounds := drawBounds left: drawBounds left + icon width + 2 ].
		
	"We will only draw strings here."
	canvas
		drawString: itemAsText asString
		in: drawBounds
		font: emphasized
		color: rowColor.

	"Draw filter matches if any."
	self
		displayFilterOn: canvas
		for: row
		in: drawBounds
		font: emphasized.