new api - classes
class: classProxy classComment: commentString stamp: stampString

	| query topazOutput |
	query := classProxy codeReferencingMe , 
				' comment: ' , commentString asString printString , 
				'; commentStamp: ' , stampString asString printString.
	topazOutput := self run: query