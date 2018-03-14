api
commentFor: class

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: class , ' comment'.
	^ topazOutput at: 1