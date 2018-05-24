construction
addDefaultSpace
	"Add a new space of the given size to the receiver."
	^ self addSpace: (Preferences tinyDisplay ifFalse:[10] ifTrue:[3])