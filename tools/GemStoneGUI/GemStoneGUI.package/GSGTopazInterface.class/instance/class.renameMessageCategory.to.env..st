new api - class organizer
class: classProxy renameMessageCategory: oldCategory to: newCategory env: envId

	| query topazOutput |
	query := classProxy codeReferencingMe , 
				' renameCategory: ' , oldCategory asString printString ,
				' to: ' , newCategory asString printString ,
				' environmentId: ' , envId.
	topazOutput := self run: query