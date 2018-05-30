geometry
extent: aPoint
	super extent: ((aPoint x max: aPoint y)  asInteger bitClear: 3) asPoint.
	corners := nil.