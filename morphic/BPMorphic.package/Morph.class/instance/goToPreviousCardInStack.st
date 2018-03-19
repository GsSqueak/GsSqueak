-Etoys-card in a stack
goToPreviousCardInStack
	"Tell my stack to advance to the previous card"
	self
		stackDo: [:aStack | aStack goToPreviousCardInStack]