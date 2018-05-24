*SqClasses-accessing
classPool
	"Answer the dictionary of class variables."

	classVars == nil
		ifTrue: [^ Dictionary new]
		ifFalse: [^ classVars]
