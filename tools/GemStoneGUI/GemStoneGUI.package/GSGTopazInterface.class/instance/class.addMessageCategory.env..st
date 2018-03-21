new api - class organizer
class: classProxy addMessageCategory: categoryName env: envId

	| query topazOutput |
	query := classProxy codeReferencingMe , 
				' addCategory: ' , categoryName asString printString ,
				' environmentId: ' , envId.
	topazOutput := self run: query