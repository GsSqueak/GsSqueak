testing
toDoIncrement: variable 
	^ (receiver = variable
			and: [selector key = #+
					and: [arguments first isConstantNumber]])
		ifTrue: [arguments first]