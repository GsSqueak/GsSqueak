card/stack commands
deleteCard
	"Tell the receiver's stack to delete the current card"
	self costume
		stackDo: [:aStack | aStack deleteCard]