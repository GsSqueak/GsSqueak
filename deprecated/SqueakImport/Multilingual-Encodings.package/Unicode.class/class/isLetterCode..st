character classification
isLetterCode: charCode 
	
	| codeCategory |
	(codeCategory := self generalCategoryOf: charCode) < Ll ifTrue: [ ^false ].
	^codeCategory <= Lu