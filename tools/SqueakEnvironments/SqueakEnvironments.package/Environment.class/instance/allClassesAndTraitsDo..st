classes and traits
allClassesAndTraitsDo: aBlock 
	declarations
		keysAndValuesDo: [:key :value | (value isBehavior
					and: [key == value @env7: name])
				ifTrue: [aBlock value: value]]
