-Etoys-card in a stack
insertCard
	"Insert a new card in the stack, with the receiver as its background,
	and have it become the current card of the stack"
	self
		stackDo: [:aStack | aStack insertCardOfBackground: self]