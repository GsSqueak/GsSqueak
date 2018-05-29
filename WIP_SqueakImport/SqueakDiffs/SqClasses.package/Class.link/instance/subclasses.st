accessing class hierarchy
subclasses
	"Answer a Set containing the receiver's subclasses."
	^ Smalltalk globals _env0 allClasses select: [:each | each superclass = self]
