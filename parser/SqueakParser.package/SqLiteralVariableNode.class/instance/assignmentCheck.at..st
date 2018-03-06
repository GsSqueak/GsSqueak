testing
assignmentCheck: encoder at: location 
	^ (key isVariableBinding
			and: [key canAssign not])
		ifTrue: [location]
		ifFalse: [-1]