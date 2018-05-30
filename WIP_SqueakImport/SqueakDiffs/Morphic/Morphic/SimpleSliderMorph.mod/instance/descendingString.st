menu
descendingString
	^ (self descending
		ifTrue: ['switch to ascending' translatedNoop]
		ifFalse: ['switch to descending' translatedNoop]) translated