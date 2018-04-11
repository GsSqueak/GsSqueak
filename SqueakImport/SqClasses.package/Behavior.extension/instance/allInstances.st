*SqClasses-accessing instances and variables
allInstances
	"Answer all instances of the receiver."
	(self isKindOf: Class)
		ifTrue: [^ self _env0 allInstances]
		ifFalse: [self halt]
	self primitiveFailed
