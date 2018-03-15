api
classDefinitionFor: class

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: class , ' definition'.
	^ topazOutput at: 1