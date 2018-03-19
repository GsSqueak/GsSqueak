new api - classes
systemCategoryFor: classProxy

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: classProxy codeReferencingMe , ' category'.
	^ (topazOutput at: 1) asSymbol