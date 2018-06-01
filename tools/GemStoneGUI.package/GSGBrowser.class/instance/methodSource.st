contents
methodSource

	^ self hasMessageSelected 
		ifTrue: [	self currentMethod sourceString]
		ifFalse: ['']