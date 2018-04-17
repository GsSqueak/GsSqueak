*SqClasses-enumerating
allInstancesDo: aBlock
	"There should be only one"
	thisClass class == self ifTrue:[^aBlock value: thisClass].
	^super allInstancesDo: aBlock
