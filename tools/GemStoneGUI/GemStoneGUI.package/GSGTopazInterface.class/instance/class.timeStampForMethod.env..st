new api - classes
class: classProxy timeStampForMethod: selector env: envId

	| topazOutput |
	envId > 0 ifTrue: [^ nil].
	self flag: #gsg. "should be environment-aware"
	topazOutput := self run: classProxy codeReferencingMe , ' stampForMethod: ' , selector asSymbol printString.
	^ topazOutput first = 'nil'
		ifTrue: [nil]
		ifFalse: [topazOutput first]