-Etoys-card in a stack
goToNextCardInStack
	"Tell my stack to advance to the next page"
	self
		stackDo: [:aStack | aStack goToNextCardInStack]