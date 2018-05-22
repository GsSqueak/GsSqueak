drawing
drawSelectionOn: aCanvas
	
	self 
		drawSelectionFor: selectedRow 
		withColor: self selectionColor 
		on: aCanvas