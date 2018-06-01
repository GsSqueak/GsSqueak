classes and traits
allTraitsDo: aBlock 
	self
		allClassesAndTraitsDo: [:value | value isTrait
				ifTrue: [aBlock value: value]]