-Etoys-card in a stack
isStackBackground
	"Answer whether the receiver serves as a background of a stack"
	^ ((owner isKindOf: StackMorph)
			and: [owner currentPage == self])
		or: [self hasProperty: #stackBackground
			"This odd property-based check is because when a
			paste-up-morph is not the *current* background of a stack, it
			is maddeningly ownerlyess"]