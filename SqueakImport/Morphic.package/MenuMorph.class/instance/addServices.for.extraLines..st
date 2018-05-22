construction
addServices: services for: served extraLines: linesArray

	services withIndexDo: [:service :i |
		self addService: service for: served.
		submorphs last setBalloonText: service description.
		(linesArray includes: i) | service useLineAfter 
			ifTrue: [self addLine]].
