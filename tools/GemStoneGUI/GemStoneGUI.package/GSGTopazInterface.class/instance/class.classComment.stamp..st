new api - classes
class: classProxy classComment: commentString stamp: stampString

	| topazOutput |
	topazOutput := self run: classProxy codeReferencingMe , 
						' comment: ''' , commentString , 
						'''; commentStamp: ''' , stampString , $'