adjacent splitters
withSiblingSplittersDo: aBlock 
	aBlock value: self.
	self siblingSplittersDo: aBlock