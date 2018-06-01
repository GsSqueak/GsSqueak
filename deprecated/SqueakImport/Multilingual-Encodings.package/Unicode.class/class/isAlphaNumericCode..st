character classification
isAlphaNumericCode: charCode 
	
	| codeCategory |
	(codeCategory := self generalCategoryOf: charCode) < Ll ifTrue: [ ^false ].
	codeCategory <= Lu ifTrue: [ ^true ].
	^codeCategory = Nd
