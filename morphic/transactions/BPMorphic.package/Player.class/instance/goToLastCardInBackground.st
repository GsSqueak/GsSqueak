card/stack commands
goToLastCardInBackground
	"Send the stack to the final card of the current background"
	costume
		stackDo: [:aStack | aStack goToLastCardInBackground]