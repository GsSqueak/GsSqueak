*SqClasses-class variables
addClassVarName: aString 
	"Add the argument, aString, as a class variable of the receiver.
	Signal an error if the first character of aString is not capitalized,
	or if it is already a variable named in the class."
	| symbol oldState |
	oldState := self copy.
	aString first canBeGlobalVarInitial
		ifFalse: [^self error: aString, ' class variable name should be capitalized; proceed to include anyway.'].
	symbol := aString asSymbol.
	self withAllSubclasses do: 
		[:subclass | 
		(self canFindWithoutEnvironment: symbol) ifTrue: [
			(DuplicateVariableError new)
				superclass: superclass; "fake!!!"
				variable: aString;
				signal: aString, ' is already defined']].
	classPool == nil ifTrue: [classPool := Dictionary new].
	(classPool includesKey: symbol) ifFalse: 
		["Pick up any refs in Undeclared"
		classPool declare: symbol from: self environment undeclared.
		SystemChangeNotifier uniqueInstance classDefinitionChangedFrom: oldState to: self]
