new api - classes
class: classProxy compile: aString classified: categoryName env: envId notifying: aController

	|query topazOutput | 
	query := '(' , classProxy codeReferencingMe , 
				' compileMethod: ' ,   aString asString printString , 
				' dictionaries: ' , classProxy environment codeReferencingMe , 
				' category: ' , categoryName asString printString , 
				' environmentId: ' , envId , ') selector asString'.
	topazOutput := self run: query.
	^ topazOutput second isEmpty
		ifTrue: [topazOutput first asSymbol]
		ifFalse: [nil]