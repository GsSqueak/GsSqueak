testing
assignmentCheck: encoder at: location 
	^ ((self isBlockArg
				and: [SqScanner allowBlockArgumentAssignment not])
			or: [self isMethodArg])
		ifTrue: [location]
		ifFalse: [-1]