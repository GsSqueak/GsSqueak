api
sourceCodeFor: class selector: selector env: envId

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: class , ' sourceCodeAt: #''' , selector , ''' environmentId: ' , envId.
	^ topazOutput at: 1