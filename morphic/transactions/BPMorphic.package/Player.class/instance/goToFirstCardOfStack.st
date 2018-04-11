card/stack commands
goToFirstCardOfStack
	"Send the stack to the first card of the entire stack"
	costume
		stackDo: [:aStack | aStack goToFirstCardOfStack]