new api - classes
classCommentFor: classProxy

	| topazOutput |
	topazOutput := self run: classProxy codeReferencingMe , ' comment'.
	^ topazOutput at: 1