classes and traits
traitNames
	"Answer a sorted collection of all traits (not including class-traits) names."

	^self nonClassNames select: [ :name |
		(name beginsWith: 'AnObsolete') not and: [
			self 
				at: name 
				ifPresent: [ :global | global isInMemory and: [ global isTrait ] ]
				ifAbsent: [ false ] ] ]