new api - classes
definitionFor: classProxy

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: classProxy theNonMetaClass codeReferencingMe , ' definition'.
	^ topazOutput at: 1