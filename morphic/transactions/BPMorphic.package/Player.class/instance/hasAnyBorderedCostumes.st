testing
hasAnyBorderedCostumes
	"Answer true if any costumes of the receiver are BorderedMorph
	descendents "
	self
		costumesDo: [:cost | cost understandsBorderVocabulary
				ifTrue: [^ true]].
	^ false