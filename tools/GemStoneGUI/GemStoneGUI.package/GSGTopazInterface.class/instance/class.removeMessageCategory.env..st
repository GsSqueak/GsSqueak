new api - class organizer
class: classProxy removeMessageCategory: categoryName env: envId

	| query topazOutput |
	query := classProxy codeReferencingMe , 
				' removeCategory: ' , categoryName asString printString ,
				' environmentId: ' , envId.
	topazOutput := self run: query