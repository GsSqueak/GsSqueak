initialize-release
toDoIncrement: var 
	^ (var = variable
			and: [value isMessageNode])
		ifTrue: [value toDoIncrement: var]