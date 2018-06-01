compatibility
addServices2: services for: served extraLines: linesArray

	services withIndexDo: [:service :i |
		service addServiceFor: served toMenu: self.
		(linesArray includes: i)  ifTrue: [self addLine] ]