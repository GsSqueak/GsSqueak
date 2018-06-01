construction
addServices2: services for: served extraLines: linesArray 
	services
		withIndexDo: [:service :i | 
			service addServiceFor: served toMenu: self.
			self lastItem setBalloonText: service description.
			(linesArray includes: i)
				ifTrue: [self addLine]]