new api - classes
class: classProxy setTimeStamp: stampString forMethod: selector env: envId

	| query topazOutput |
	envId > 0 ifTrue: [^ nil].
	self flag: #gsg. "should be environment-aware"
	query := classProxy codeReferencingMe , 
				' setStamp: ' , stampString asString printString , 
				' forMethod: ' , selector asSymbol printString.
	topazOutput := self run: query