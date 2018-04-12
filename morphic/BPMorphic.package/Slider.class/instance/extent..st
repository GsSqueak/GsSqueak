geometry
extent: newExtent 
	(bounds extent closeTo: newExtent)
		ifTrue: [^ self].
	super extent: newExtent.
	self updateSlider