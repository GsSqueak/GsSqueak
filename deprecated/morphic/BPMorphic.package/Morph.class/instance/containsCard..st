-Etoys-card in a stack
containsCard: aCard 
	"Answer whether the given card belongs to the uniclass representing
	the receiver"
	^ self isStackBackground
		and: [aCard isKindOf: self player class baseUniclass]