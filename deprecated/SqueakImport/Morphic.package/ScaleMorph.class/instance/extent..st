geometry
extent: newExtent 
	| modExtent |
	modExtent := self checkExtent: newExtent.
	super extent: modExtent.
	self buildLabels