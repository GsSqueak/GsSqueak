new api - classes
class: classProxy methodAt: selector environmentId: envId ifAbsent: aBlock

	| code topazOutput |
	code := self codeForPrintingListCreatedBy: ( '[:class :selector :envId |
		| result method |
		method := class compiledMethodAt: selector environmentId: envId otherwise: nil.
		method ifNil: [^ nil].
		result := OrderedCollection new.
	' , (self codeForSerializingMethod: 'method' onCollection: 'result' environmentId: envId) , '.
	result] value: ' , classProxy codeReferencingMe , 
	' value: ' , selector asSymbol printString, 
	' value: ' , envId).
	self setEnv: 0.
	topazOutput := self run: code.
	^ topazOutput first = 'nil'
		ifTrue: [aBlock value]
		ifFalse: [self convertToMethodProxy: topazOutput first lines
					inEnvironment: classProxy environment]