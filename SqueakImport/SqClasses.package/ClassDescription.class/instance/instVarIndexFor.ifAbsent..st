*SqClasses-instance variables
instVarIndexFor: instVarName ifAbsent: aBlock
	"Answer the index of the named instance variable."

	| index |
	index := instanceVariables
		ifNil: [ 0 ]
		ifNotNil: [ instanceVariables indexOf: instVarName ].
	index = 0 ifTrue: [
		^superclass
			ifNil: [ aBlock value ]
			ifNotNil: [ superclass instVarIndexFor: instVarName ifAbsent: aBlock ] ].
	^superclass 
		ifNil: [ index ]
		ifNotNil: [ index + superclass instSize ]
