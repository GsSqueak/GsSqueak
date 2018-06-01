actions & preps
fill: evt 
	"Find the area that is the same color as where you clicked. Fill it with 
	the current paint color."
	evt isMouseUp
		ifFalse: [^ self].
	"Only fill upon mouseUp"
	"would like to only invalidate the area changed, but can't find out what
	it is."
	Cursor execute
		showWhile: [| box |
			box := paintingForm
						floodFill: (self getColorFor: evt)
						at: evt cursorPoint - bounds origin.
			self
				render: (box translateBy: bounds origin)]