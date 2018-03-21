new api - classes
class: classProxy sourceCodeAt: selector env: envId ifAbsent: aBlock

	| code topazOutput |
	code := '[:class :selector :envId |
[class sourceCodeAt: selector environmentId: envId]
    onException: Error
    do: [ :ex | nil]] value: ' , classProxy codeReferencingMe , ' value: ' , selector asSymbol printString, ' value: ' , envId.
	self setEnv: 0.
	topazOutput := self run: code.
	^ (topazOutput at: 1) = 'nil'
		ifTrue: [aBlock value]
		ifFalse: [topazOutput at: 1]