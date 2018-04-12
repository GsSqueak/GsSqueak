contents
methodSource

	^ self hasMessageSelected 
		ifTrue: [	self currentMethod source]
		ifFalse: ['']