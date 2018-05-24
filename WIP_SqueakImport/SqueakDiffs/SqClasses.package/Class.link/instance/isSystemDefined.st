*SqClasses-testing
isSystemDefined
	"Answer true if the receiver is a system-defined class, and not a UniClass (an instance-specific lightweight class)"

	^ self == self officialClass
