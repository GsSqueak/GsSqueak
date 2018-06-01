classes and traits
allClassesAndTraitsDo: aBlock 
	declarations
		keysAndValuesDo: [:key :value |
			(value isBehavior and: [
				| name |
				name := (value _respondsTo: #name private: true flags: (16r10000 + 7))
							ifTrue: [value @env7: name]
							ifFalse: [value name].
				key == name])
					ifTrue: [aBlock value: value]]

