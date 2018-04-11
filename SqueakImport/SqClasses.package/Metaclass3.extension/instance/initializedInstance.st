*SqClasses-instance creation
initializedInstance
	thisClass class == self ifFalse: [^self new].
	^thisClass
