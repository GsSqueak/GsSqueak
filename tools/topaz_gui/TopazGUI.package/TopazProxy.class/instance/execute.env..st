api
execute: code env: envId

	| topazOutput |
	self setEnv: envId.
	topazOutput := self run: code.
	^ topazOutput at: 1