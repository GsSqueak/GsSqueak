*SqClasses-organization
category
	"Answer the system organization category for the receiver. First check whether the
	category name stored in the ivar is still correct and only if this fails look it up"
	^ self environment organization categoryOfElement: self name
