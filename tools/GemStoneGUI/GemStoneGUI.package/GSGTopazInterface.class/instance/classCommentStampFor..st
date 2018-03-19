new api - classes
classCommentStampFor: classProxy

	| topazOutput |
	topazOutput := self run: classProxy codeReferencingMe , ' commentStamp'.
	^ topazOutput at: 1