*SqClasses-accessing class hierarchy
removeUninstantiatedSubclassesSilently
	"Remove the classes of any subclasses that have neither instances nor subclasses.  Answer the number of bytes reclaimed"
	"self removeUninstantiatedSubclassesSilently"

	| oldFree |
	oldFree := Smalltalk garbageCollect.
	
	self subclasses
		select: [:c | (c isSystemDefined not and: [c instanceCount = 0]) and: [c subclasses isEmpty]]
		thenDo: [:c | c removeFromSystem].
	
	^ Smalltalk garbageCollect - oldFree
