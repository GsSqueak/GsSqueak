classes and traits
allClassesAndTraitsDo: aBlock 
	declarations
		keysAndValuesDo: [:key :value | (value isBehavior
					and: [key == value name])
				ifTrue: [aBlock value: value]]