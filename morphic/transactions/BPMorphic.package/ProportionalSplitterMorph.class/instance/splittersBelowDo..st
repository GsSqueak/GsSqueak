adjacent splitters
splittersBelowDo: aBlock 
	self splitterBelow
		ifNotNil: [:splitter | 
			aBlock value: splitter.
			splitter splittersBelowDo: aBlock]