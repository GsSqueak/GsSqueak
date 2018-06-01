compatibility
addServices: services for: served extraLines: linesArray

	services withIndexDo: [:service :i |
		self addService: service for: served.
		(linesArray includes: i) | service useLineAfter 
			ifTrue: [self addLine]]