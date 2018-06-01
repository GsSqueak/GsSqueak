-Etoys-card in a stack
isStackBackground
  "Answer whether the receiver serves as a background of a stack"

  ^ ((self owner isKindOf: StackMorph) and: [ self owner currentPage == self ])
    or: [ 
      self hasProperty: #'stackBackground'	"This odd property-based check is because when a
			paste-up-morph is not the *current* background of a stack, it
			is maddeningly ownerlyess" ]