card/stack commands
goToLastCardOfStack
	"Send the stack to the last card of the entire stack"
	costume
		stackDo: [:aStack | aStack goToLastCardOfStack]