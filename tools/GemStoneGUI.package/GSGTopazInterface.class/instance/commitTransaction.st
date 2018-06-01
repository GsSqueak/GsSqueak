old api - transactions
commitTransaction

	| topazOutput |
	topazOutput := self commit.
	topazOutput second = ('Successful commit' , Character lf) ifFalse: [
		self notify: topazOutput second]