classes and traits
allClassesDo: aBlock 
	self
		allClassesAndTraitsDo: [:value | (value isKindOf: Class)
				ifTrue: [aBlock value: value]]