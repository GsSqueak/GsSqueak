dictionary access
associationOrUndeclaredAt: key 
	"return an association or install in undeclared.  Used for mating up ImageSegments."
	self flag: #environments.

	^ self associationAt: key ifAbsent: [
		Undeclared at: key put: nil.
		Undeclared associationAt: key]