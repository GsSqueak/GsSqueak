drawing
drawPreSelectionOn: aCanvas
	
	self 
		drawSelectionFor: preSelectedRow
		withColor: self preSelectionColor 
		on: aCanvas