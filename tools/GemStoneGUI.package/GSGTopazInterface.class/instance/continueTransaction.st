interface
continueTransaction

	| topazOutput |
	topazOutput := self continue.
	topazOutput second isEmpty ifFalse: [
		self notify: topazOutput second]