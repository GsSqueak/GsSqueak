magnifying
magnification: aNumber
	| c |  
	magnification := aNumber min: 8 max: 0.5.
	magnification := magnification roundTo:
		(magnification < 3 ifTrue: [0.5] ifFalse: [1]).
	srcExtent := srcExtent min: (512@512) // magnification. "to prevent accidents"
	c := self center.
	super extent: self defaultExtent.
	self center: c.