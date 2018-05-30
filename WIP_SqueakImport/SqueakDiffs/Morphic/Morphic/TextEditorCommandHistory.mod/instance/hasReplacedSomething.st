testing
hasReplacedSomething

	^ self hasPrevious and: [self previous hasReplacedSomething]