card/stack commands
goToFirstCardInBackground
	"Send the stack to the first card of the current background"
	costume
		stackDo: [:aStack | aStack goToFirstCardInBackground]