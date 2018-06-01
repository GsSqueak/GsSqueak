testing
hasInsertedSomething

	^ self hasPrevious and: [self previous hasInsertedSomething]