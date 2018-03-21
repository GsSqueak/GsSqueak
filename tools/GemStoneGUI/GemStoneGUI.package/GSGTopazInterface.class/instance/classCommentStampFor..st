new api - classes
classCommentStampFor: classProxy

	| topazOutput |
	topazOutput := self run: classProxy codeReferencingMe , ' commentStamp'.
	^ topazOutput first = 'nil'
		ifTrue: [nil]
		ifFalse: [topazOutput first]