new api - classes
class: classProxy ultimateSourceCodeAt: selector env: envId ifAbsent: aBlock

	| code topazOutput |
	code := '[:class :selector :envId |
| currentClass source |
currentClass := class.
source := nil.
[source isNil and: [currentClass notNil]] whileTrue: [
  source := [currentClass sourceCodeAt: selector environmentId: envId]
    onException: Error
    do: [ :ex | nil].
  currentClass := currentClass superclassForEnv: envId].
source] value: ' , classProxy codeReferencingMe , ' value: ' , selector asSymbol printString , ' value: ' , envId.
	self setEnv: 0.
	topazOutput := self run: code.
	^ (topazOutput at: 1) = 'nil'
		ifTrue: [aBlock value]
		ifFalse: [topazOutput at: 1]