new api - classes
class: classProxy setSystemCategory: aString

	| query topazOutput |
	query := classProxy codeReferencingMe , ' category: ' , aString asString printString.
	topazOutput := self run: query.
	^ topazOutput first = 'nil'
		ifTrue: [nil]
		ifFalse: [classProxy]