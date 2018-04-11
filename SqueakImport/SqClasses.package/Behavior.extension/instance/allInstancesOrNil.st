*SqClasses-enumerating
allInstancesOrNil
	"Answer all instances of the receiver, or nil if the primitive
	 fails, which it may be due to being out of memory."
	(self isKindOf: Class)
		ifTrue: [[^ self _env0 allInstances] onError: [^nil]]
		ifFalse: [self halt]
