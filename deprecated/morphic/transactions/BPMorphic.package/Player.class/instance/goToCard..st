card/stack commands
goToCard: aCard 
	"Install aCard as the new current card of the stack"
	self
		stackDo: [:aStack | aStack goToCard: aCard]