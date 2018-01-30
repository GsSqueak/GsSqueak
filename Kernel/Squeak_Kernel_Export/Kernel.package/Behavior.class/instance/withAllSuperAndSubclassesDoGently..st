enumerating
withAllSuperAndSubclassesDoGently: aBlock
	self allSuperclassesDo: aBlock.
	aBlock value: self.
	self allSubclassesDoGently: aBlock