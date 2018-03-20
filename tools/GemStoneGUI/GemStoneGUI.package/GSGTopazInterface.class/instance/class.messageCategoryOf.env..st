new api - classes
class: classProxy messageCategoryOf: aSelector env: envId

	| query topazOutput |
	query := classProxy codeReferencingMe , ' categoryOfSelector: ' , aSelector asSymbol printString , ' environmentId: ' , envId.
	topazOutput := self run: query.
	^ topazOutput first = 'nil'
		ifTrue: [nil]
		ifFalse: [topazOutput first asSymbol]