adjacent splitters
splittersAboveDo: aBlock 
	self splitterAbove
		ifNotNil: [:splitter | 
			aBlock value: splitter.
			splitter splittersAboveDo: aBlock]