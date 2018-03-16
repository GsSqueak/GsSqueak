new api - classes
superclassFor: classProxy env: envId

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: '(' , classProxy codeReferencingMe , ' superclassForEnv: ' , envId , ') name'.
	^ self convertToClassProxy: (topazOutput at: 1) inEnvironment: classProxy environment