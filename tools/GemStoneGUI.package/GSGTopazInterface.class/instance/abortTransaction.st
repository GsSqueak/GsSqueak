interface
abortTransaction

	| topazOutput |
	topazOutput := self abort.
	topazOutput second isEmpty ifFalse: [
		self notify: topazOutput second]