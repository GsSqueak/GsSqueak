*SqClasses-instance creation
initializedInstance
	destClass class == self ifFalse: [^self new].
	^destClass
