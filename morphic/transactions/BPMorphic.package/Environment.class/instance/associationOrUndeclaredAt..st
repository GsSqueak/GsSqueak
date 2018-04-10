emulating
associationOrUndeclaredAt: key 
	^ bindings
		associationAt: key
		ifAbsent: [undeclared at: key put: nil.
			undeclared associationAt: key]